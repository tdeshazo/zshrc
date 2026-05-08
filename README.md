# zsh-config

Modular Zsh configuration for Arch-based Linux systems.

## What This Installs

The installer installs the required packages with `pacman`, then copies:

- `.zshrc` to `~/.zshrc`
- `zsh/*.zsh` to `${XDG_CONFIG_HOME:-$HOME/.config}/zsh`

Existing destination files are backed up with a timestamped `.backup.YYYYMMDDHHMMSS`
suffix before they are replaced. Files that already match are left unchanged.

## Dependencies

The installer uses `pacman` to install:

- `zsh`
- `git`
- `fzf`
- `fd`
- `ripgrep`
- `bat`
- `zoxide`
- `zsh-theme-powerlevel10k`
- `zsh-autosuggestions`
- `zsh-history-substring-search`
- `zsh-syntax-highlighting`

## Install

Run from the repository root:

```sh
./install.sh
```

If the script is not executable:

```sh
chmod +x install.sh
./install.sh
```

The script uses `sudo pacman -S --needed ...` when it is not run as root.

## Optional: Make Zsh Your Login Shell

After installation, switch your login shell to Zsh:

```sh
chsh -s /usr/bin/zsh
```

Log out and back in for the shell change to take effect.

## Layout

```text
.
├── .zshrc
├── install.sh
└── zsh/
    ├── 00-options.zsh
    ├── 10-completion.zsh
    ├── 20-keybindings.zsh
    ├── 30-aliases.zsh
    ├── 40-helpers.zsh
    ├── 50-terminal.zsh
    ├── 60-fzf.zsh
    ├── 70-prompt.zsh
    ├── 80-history-search.zsh
    ├── 90-syntax-highlighting.zsh
    └── 99-zoxide.zsh
```

## Reload

Reload the config in an existing Zsh session:

```sh
source ~/.zshrc
```

or use the included alias:

```sh
zsh-reload
```
