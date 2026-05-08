#!/usr/bin/env sh
set -eu

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

packages="
zsh
git
fzf
fd
ripgrep
bat
zoxide
zsh-theme-powerlevel10k
zsh-autosuggestions
zsh-history-substring-search
zsh-syntax-highlighting
"

if ! command -v pacman >/dev/null 2>&1; then
  echo "pacman was not found. This installer is intended for Arch-based systems." >&2
  exit 1
fi

target_user=${SUDO_USER:-$(id -un)}
if command -v getent >/dev/null 2>&1; then
  target_home=$(getent passwd "$target_user" | cut -d: -f6)
else
  target_home=${HOME:?}
fi

if [ -z "$target_home" ] || [ ! -d "$target_home" ]; then
  echo "Could not determine a valid home directory for $target_user." >&2
  exit 1
fi

if [ "$(id -u)" -eq 0 ]; then
  pacman -S --needed $packages
else
  sudo pacman -S --needed $packages
fi

config_home=${XDG_CONFIG_HOME:-"$target_home/.config"}
zsh_config_dir="$config_home/zsh"

install -d -m 0755 "$zsh_config_dir"

backup_existing() {
  path=$1

  if [ -e "$path" ] || [ -L "$path" ]; then
    backup="$path.backup.$(date +%Y%m%d%H%M%S)"
    echo "Backing up $path to $backup"
    mv -- "$path" "$backup"
  fi
}

install_file() {
  src=$1
  dest=$2

  if [ -e "$dest" ] || [ -L "$dest" ]; then
    if cmp -s "$src" "$dest"; then
      return
    fi
    backup_existing "$dest"
  fi

  install -m 0644 "$src" "$dest"
}

install_file "$script_dir/.zshrc" "$target_home/.zshrc"

for file in "$script_dir"/zsh/*.zsh; do
  target_file="$zsh_config_dir/$(basename "$file")"
  install_file "$file" "$target_file"
done

if [ "$(id -u)" -eq 0 ] && [ "$target_user" != root ]; then
  chown -R "$target_user:" "$target_home/.zshrc" "$zsh_config_dir"
fi

echo "Installed zsh config for $target_user."
