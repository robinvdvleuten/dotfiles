#!/bin/sh

echo "Setting up your Mac..."

echo "mkdir -p ${HOME}/Projects"
mkdir -p "${HOME}/Projects"

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Installing bundled Homebrew formulas (see Brewfile)"
brew bundle

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Checking out asdf-vm + nodejs and ruby plugins"
if [ ! -d "$HOME/.asdf" ]; then
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.1

  asdf plugin-add "ruby" "https://github.com/asdf-vm/asdf-ruby.git"
  asdf plugin-add "nodejs" "https://github.com/asdf-vm/asdf-nodejs.git"
fi

install_asdf_language() {
  local language="$1"
  local version
  version="$(asdf list-all "$language" | grep -v "[a-z]" | tail -1)"

  if ! asdf list "$language" | grep -Fq "$version"; then
    asdf install "$language" "$version"
    asdf global "$language" "$version"
  fi
}

echo "Installing latest Ruby ..."
install_asdf_language "ruby"
gem update --system
number_of_cores=$(sysctl -n hw.ncpu)
bundle config --global jobs $((number_of_cores - 1))

echo "Installing latest Node ..."
bash "$HOME/.asdf/plugins/nodejs/bin/import-release-team-keyring"
install_asdf_language "nodejs"

echo "Installing a few global NPM packages"
npm install --global npm pure-prompt

echo "Cloning dotfiles"
git clone git@github.com:robinvdvleuten/dotfiles.git "${HOME}/.dotfiles"
ln -s "${HOME}/.dotfiles/.gitignore_global" "${HOME}/.gitignore_global"
ln -s "${HOME}/.dotfiles/.zshrc" "${HOME}/.zshrc"

echo "Set macOS preferences"
source .macos

echo "Let git use global gitignore file"
git config --global core.excludesfile ~/.gitignore_global
