source /usr/local/share/antigen/antigen.zsh
antigen init ~/.dotfiles/antigenrc

export STARSHIP_CONFIG="/Users/krubenok/.dotfiles/starship.toml"
export PATH="/usr/local/sbin:$PATH"

eval "$(starship init zsh)"

# ===============================
# ------------Aliases------------
# ===============================

# Alias to use the insiders version of VS Code over the default version. 
alias code="code-insiders"

# run the previous command with sudo
alias please='sudo $(fc -ln -1)'

# Show large files
alias ducks='du -cksh * | sort -rn | head'

# alias ls to exa
alias ls='exa'

# alias to clear DNS cache
alias flushcache='sudo killall -HUP mDNSResponder'

# ==============================
# ------------iTerm2------------
# ==============================

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
