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

echo "Installing a few global NPM packages"
npm install --global npm pure-prompt

echo "Cloning dotfiles"
git clone git@github.com:robinvdvleuten/dotfiles.git "${HOME}/.dotfiles"
ln -s "${HOME}/.dotfiles/.zshrc" "${HOME}/.zshrc"

echo "Set macOS preferences"
source .macos
