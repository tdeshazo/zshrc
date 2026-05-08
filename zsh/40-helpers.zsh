## Helpers and prompt-related shell behavior

autoload -U colors zcalc
colors

setopt PROMPT_SUBST

mkcd() {
  command mkdir -p -- "$1" && cd -- "$1"
}

switch() {
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    git switch "$@"
  else
    echo "Not inside a Git repository."
    return 1
  fi
}
