source /usr/local/share/antigen/antigen.zsh

# Load Antigen configurations
antigen init ~/.dotfiles/antigenrc

# ===================================
# ------------zsh options------------
# ===================================

setopt list_types                   # show types in completion
setopt hist_ignore_dups             # ignore duplication command history list
setopt hist_verify                  # expand history onto the current line instead of executing it
setopt hist_expire_dups_first       # remove oldest duplicate commands from the history first
setopt hist_ignore_space            # don't save commands beginning with spaces to history
setopt inc_append_history           # always be saving history (not just when the shell exits)
setopt auto_menu                    # show completion menu on succesive tab press
setopt auto_pushd                   # make cd push the old directory onto the directory stack

# history
HISTFILE=$HOME/.dotfiles/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# z menu style
zstyle ':completion:*' menu select
ZSHZ_DATA=$HOME/.dotfiles/z

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
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

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