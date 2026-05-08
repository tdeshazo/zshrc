## Aliases

alias cp='cp -i'
alias df='df -h'
alias free='free -m'
alias gitu='git add . && git commit && git push'
alias ls='ls $LS_OPTIONS'
alias zsh-reload='source ~/.zshrc'

if [[ $TERM == xterm-kitty ]]; then
  alias icat='kitten icat'
fi
