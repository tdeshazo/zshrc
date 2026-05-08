# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

(( ${+ZSH_CONFIG_DIR} )) || typeset -gr ZSH_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

source "$ZSH_CONFIG_DIR/00-options.zsh"
source "$ZSH_CONFIG_DIR/10-completion.zsh"
source "$ZSH_CONFIG_DIR/20-keybindings.zsh"
source "$ZSH_CONFIG_DIR/30-aliases.zsh"
source "$ZSH_CONFIG_DIR/40-helpers.zsh"
source "$ZSH_CONFIG_DIR/50-terminal.zsh"
source "$ZSH_CONFIG_DIR/60-fzf.zsh"
source "$ZSH_CONFIG_DIR/70-prompt.zsh"
source "$ZSH_CONFIG_DIR/80-history-search.zsh"
source "$ZSH_CONFIG_DIR/90-syntax-highlighting.zsh"
source "$ZSH_CONFIG_DIR/99-zoxide.zsh"
