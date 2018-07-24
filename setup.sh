#!/usr/bin/env bash

function runSetup() {
    # Ask for the administrator password upfront
    sudo -v

    # Keep-alive: update existing `sudo` time stamp until the script has finished
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

    # Run sections based on command line arguments
    for ARG in "$@"
    do
        if [ $ARG == "osxprep" ] || [ $ARG == "all" ]; then
            # Run the osxprep.sh Script
            echo ""
            echo "------------------------------"
            echo "Updating OSX and installing Xcode command line tools"
            echo "------------------------------"
            echo ""
            ./osxprep.sh
        fi
        if [ $ARG == "brew" ] || [ $ARG == "all" ]; then
            # Run the brew.sh Script
            # For a full listing of installed formulae and apps, refer to
            # the commented brew.sh source file directly and tweak it to
            # suit your needs.
            echo ""
            echo "------------------------------"
            echo "Installing Homebrew along with some common formulae and apps."
            echo "This might awhile to complete, as some formulae need to be installed from source."
            echo "------------------------------"
            echo ""
            ./brew.sh
        fi
        if [ $ARG == "osx" ] || [ $ARG == "all" ]; then
            # Run the osx.sh Script
            # I strongly suggest you read through the commented osx.sh
            # source file and tweak any settings based on your personal
            # preferences. The script defaults are intended for you to
            # customize. For example, if you are not running an SSD you
            # might want to change some of the settings listed in the
            # SSD section.
            echo ""
            echo "------------------------------"
            echo "Setting sensible OSX defaults."
            echo "------------------------------"
            echo ""
            ./osx.sh
        fi
        if [ $ARG == "web" ] || [ $ARG == "all" ]; then
            # Run the web.sh Script
            echo "------------------------------"
            echo "Setting up JavaScript web development environment."
            echo "------------------------------"
            echo ""
            ./web.sh
        fi
        if [ $ARG == "dock" ] || [ $ARG == "all" ]; then
            # Run the web.sh Script
            echo "------------------------------"
            echo "Setting up dock configuration"
            echo "------------------------------"
            echo ""
            ./dock.sh
        fi
    done

    echo "------------------------------"
    echo "Completed running .dots, restart your computer to ensure all updates take effect"
    echo "------------------------------"

    rm -rf ~/.zshrc
    ln -s ~/Repos/dotfiles/.zshrc ~/.zshrc
    
    rm -rf ~/.gitignore
    ln -s ~/Repos/dotfiles/.gitignore ~/.gitignore

    rm -rf ~/.gitconfig
    ln -s ~/Repos/dotfiles/.gitconfig ~/.gitconfig

    cp ~/Repos/dotfiles/.hushlogin ~/.hushlogin

    rm -rf ~/.aliases
    ln -s ~/Repos/dotfiles/.aliases ~/.aliases

    rm -rf ~/.hyper.js
    ln -s ~/Repos/dotfiles/.hyper.js ~/.hyper.js
}

read -p "This script may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
    runSetup $@
fi;

unset runSetup;
