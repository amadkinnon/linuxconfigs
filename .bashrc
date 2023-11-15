# Set pass as the vault backend
if command aws-vault &> /dev/null; then
    export AWS_VAULT_BACKEND=pass
fi

# Set vi mode on the command line
set -o vi
export EDITOR=nvim

# Add nvim to path
export PATH=$PATH:/usr/local/bin/nvim/bin

# Set the PAT if pass is available
if command pass &> /dev/null; then
    if command pass github/PAT &> /dev/null; then
        export GITHUB_OAUTH_TOKEN=$(pass github/PAT)
    fi
fi

# Start up the ssh agent if it's not a runnin'
#if ! pgrep -u "$USER" ssh-agent &> /dev/null; then
#    ssh-agent > "$XDG_RUNTIME_DIR/ssh-agent.env"
#fi
#if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
#    source "$XDG_RUNTIME_DIR/ssh-agent.env" &> /dev/null
#fi
# Or use systemd
#

# History Config
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend

# Source Aliases
[ -f ~/linuxconfigs/.bash_aliases ] && source ~/linuxconfigs/.bash_aliases

# Source FZF help 
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# NVM Config
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
