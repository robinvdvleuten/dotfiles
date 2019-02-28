# Path to your dotfiles installation.
export DOTFILES=$HOME/.dotfiles

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Disable any oh-my-zsh theme. This is required by the pure prompt.
# see https://github.com/sindresorhus/pure#oh-my-zsh
ZSH_THEME=""

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# Activate oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Load nodenv environment.
eval "$(nodenv init -)"

# Load rbenv environment.
eval "$(rbenv init -)"

# Initialize the prompt system and choose pure.
autoload -U promptinit; promptinit
prompt pure
