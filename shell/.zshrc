# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Hide username in prompt
DEFAULT_USER=`whoami`

# Minimal - Theme Settings
export MNML_INSERT_CHAR="$"
export MNML_PROMPT=(mnml_git mnml_keymap)
export MNML_RPROMPT=('mnml_cwd 20')

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="minimal"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git 1password macos)

source $ZSH/oh-my-zsh.sh

# Enable autosuggestions
. $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Enable syntax highlighting
. $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Set up mise-en-place
eval "$(mise activate zsh)"

# do not update all homebrew stuff automatically
export HOMEBREW_NO_AUTO_UPDATE=1
