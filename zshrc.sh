export ZSH="/Users/krubenok/.oh-my-zsh"

ZSH_THEME="spaceship"

plugins=(
    git
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh


# Alias to use the insiders version of VS Code over the default version. 
alias code="code-insiders"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# run the previous command with sudo
alias please='sudo $(fc -ln -1)'

# Show large files
alias ducks='du -cksh * | sort -rn | head'

# alias ls to exa
alias ls='exa'

# z support for quick folder navigation
. `brew --prefix`/etc/profile.d/z.sh

# alias to clear DNS cache
alias flushcache='sudo killall -HUP mDNSResponder'

# Load nvm into the shell
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Custom script to automatically use the node version specified in the .nvmrc file.
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

source "/Users/krubenok/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
