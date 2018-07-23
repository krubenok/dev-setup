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

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install zsh.
brew install zsh

brew tap homebrew/versions
brew tap caskroom/fonts
brew tap caskroom/cask

# We installed the new shell, now we have to activate it
echo "Adding the newly installed shell to the list of allowed shells"
# Prompts for password
sudo bash -c 'echo /usr/local/bin/zsh >> /etc/shells'
# Change to the new shell, prompts for password
chsh -s /usr/local/bin/zsh

# Install Python
brew install python
brew install python3

# Install other useful tools
brew install git
brew install git-lfs
brew install git-flow
brew install git-extras
brew install tree
brew install dockutil
brew install git
# brew install mas
# Commenting out mas because of Mojave beta
brew install zsh
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
brew cask install gfxcardstatus
brew cask install github-beta
brew cask install google-backup-and-sync
brew cask install google-chrome
brew cask install highsierramediakeyenabler
brew cask install hyper
brew cask install iina
brew cask install intel-power-gadget
brew cask install java
brew cask install jetbrains-toolbox
brew cask install notion
brew cask install private-internet-access
brew cask install setapp
brew cask install sketch
brew cask install visual-studio-code-insiders
brew cask install vmware-fusion
brew cask install webex-teams

# Fonts 
brew cask install font-fira-code
brew cask install font-hind

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package

# Remove outdated versions from the cellar.
brew cleanup
