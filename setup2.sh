sudo scutil --set ComputerName "Bender Rodriguez"
sudo scutil --set HostName "bender"
sudo scutil --set LocalHostName "bender"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "Bender Rodriguez"


# We installed the new shell, now we have to activate it
echo "Adding the newly installed shell to the list of allowed shells"
# Prompts for password
sudo bash -c 'echo /usr/local/bin/zsh >> /etc/shells'


sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh

#Install oh-my-zsh
curl -L http://install.ohmyz.sh | sh

#Install syntax highlighting
cd ~/.oh-my-zsh && git clone git://github.com/zsh-users/zsh-syntax-highlighting.git

curl -sSL https://get.rvm.io | bash -s stable --ruby
wget -O ~/oh-my-zsh/themes/hyperzsh.zsh-theme https://raw.githubusercontent.com/tylerreckart/hyperzsh/master/hyperzsh.zsh-theme 

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

rm -rf ~/.ssh
ln -s /Volumes/GoogleDrive/My Drive/dotfiles/.ssh ~/.ssh