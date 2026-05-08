## fzf integration

# Enables Ctrl-T, Ctrl-R, Alt-C keybindings + fuzzy completion
if (( $+commands[fzf] )); then
  # Prefer upstream integration if fzf ≥ 0.48
  source <(fzf --zsh) 2>/dev/null || {
    [ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
    [ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
  }

  # speedier searches with nicer previews (requires fd, ripgrep, bat)
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
  export FZF_CTRL_T_OPTS='--preview "bat --style=numbers --line-range=:200 --plain {} 2>/dev/null || head -n 200 {}"'
fi
