# dotfiles

These are my dotfiles (and a few setup scritps). I was largely inspired by [Mike McQuaid](https://github.com/MikeMcQuaid) and his [Strap tool](https://github.com/MikeMcQuaid/strap). As such, these dotfiles are compatible with Strap and has scripts where it's expecting them.

My Brewfile is fairly heavy so do be careful and don't just run this blindly. Use it as inspiration and re-write your own.

## How to Install

1. Do the macOS first boot dance and setup your account however you wish. This should be the account you intend on using as your primary one. _N.B. In order for the Brewfile to install your Mac App Store selections, you must sign in to an iCloud account with those purchases._
2. Open Safari and visit https://macos-strap.herokuapp.com/
3. Open Terminal and run the following commands:
  
  ```bash
  cd Downloads
  chmod +x strap.sh
  # Optionally, you can add the --debug flag to see more output on the strap.sh script
  ./strap.sh
  ```

## Update Brewfile

```bash
rm /Users/krubenok/.dotfiles/Brewfile
brew bundle dump --file=/Users/krubenok/.dotfiles/Brewfile
```

## Acknowledgements

Like most dotfiles, they were heavily inspired by the following excellent people!

- [Mike McQuaid](https://github.com/MikeMcQuaid)
- [Zell](https://zellwk.com/blog/mac-setup-2/)
- [Mathias Bynens](https://github.com/mathiasbynens/dotfiles)
