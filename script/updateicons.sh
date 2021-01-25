
function replace_icons() {
  appname=$1
  sudo cp ~/.dotfiles/Icons/"$appname".icns /Applications/$appname.app/Contents/Resources/"$appname".icns
  sudo touch /Applications/"$appname".app
}

function replace_icons_electron() {
  appname=$1
  sudo cp ~/.dotfiles/Icons/"$appname".icns /Applications/$appname.app/Contents/Resources/electron.icns
  sudo cp ~/.dotfiles/Icons/"$appname".icns /Applications/$appname.app/Contents/Resources/"$appname".icns
  sudo touch /Applications/"$appname".app
}

function replace_icons_teams() {
  appname=$1
  sudo cp ~/.dotfiles/Icons/"$appname".icns /Applications/$appname.app/Contents/Resources/icon.icns
  sudo touch /Applications/"$appname".app
}

replace_icons_electron "Discord"
replace_icons_electron "Figma"
replace_icons_electron "GitHub Desktop"
replace_icons "Microsoft Edge Dev"
replace_icons "Microsoft Excel"
replace_icons "Microsoft Outlook"
replace_icons "Microsoft PowerPoint"
replace_icons "Microsoft Teams"
replace_icons "Microsoft Word"
replace_icons_electron "Notion"
replace_icons_electron "Visual Studio Code - Insiders"
replace_icons "VMware Fusion"

sudo killall Finder && sudo killall Dock