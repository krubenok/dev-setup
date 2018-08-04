#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

brew tap caskroom/versions
brew tap caskroom/cask
brew tap caskroom/fonts


brew install zsh
brew install python
brew install python3
brew install wget
brew install git
brew install git-lfs
brew install git-flow
brew install git-extras
brew install tree
brew install dockutil
brew install git
brew install mas
brew install z

# Casks
brew cask install 1password-beta
brew cask install aerial
brew cask install affinity-designer-beta
brew cask install affinity-photo-beta
brew cask install alfred
brew cask install emojify
brew cask install figma
brew cask install firefox
brew cask install franz
brew cask install geekbench
brew cask install github-beta
brew cask install google-backup-and-sync
brew cask install google-chrome
brew cask install highsierramediakeyenabler
brew cask install hyper
brew cask install iina
brew cask install java
brew cask install notion
brew cask install private-internet-access
# brew cask install setapp
brew cask install sketch
brew cask install visual-studio-code-insiders
brew cask install vmware-fusion
brew cask install webex-teams

# Fonts 
brew cask install font-fira-code
brew cask install font-hind

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv qlimagesize webpquicklook suspicious-package

# Remove outdated versions from the cellar.
brew cleanup
