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
