# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Hide username in prompt
DEFAULT_USER=`whoami`

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git 1password macos)

source $ZSH/oh-my-zsh.sh

# Set up asdf
. $(brew --prefix asdf)/libexec/asdf.sh

# do not update all homebrew stuff automatically
export HOMEBREW_NO_AUTO_UPDATE=1
