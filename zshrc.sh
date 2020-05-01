source /usr/local/share/antigen/antigen.zsh

# Load Antigen configurations
antigen init ~/.antigenrc

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

# =============================
# ------------nvmrc------------
# Adds support to automatically detect `.nvmrc` files and switch to the node version specified in
# them
# =============================
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

declare -a NODE_GLOBALS=(`find ~/.nvm/versions/node -maxdepth 3 -type l -wholename '*/bin/*' | xargs -n1 basename | sort | uniq`)

NODE_GLOBALS+=("node")
NODE_GLOBALS+=("nvm")

load_nvm () {
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
}

for cmd in "${NODE_GLOBALS[@]}"; do
    eval "${cmd}(){ unset -f ${NODE_GLOBALS}; load_nvm; ${cmd} \$@ }"
done