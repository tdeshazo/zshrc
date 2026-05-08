## Completion

zmodload zsh/complist
zmodload zsh/zutil

autoload -U compinit
mkdir -p "$HOME/.zsh/cache"

zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' rehash true
zstyle ':completion:*' menu select

# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.zsh/cache"

compinit -d "${ZDOTDIR:-$HOME}/.zcompdump"
