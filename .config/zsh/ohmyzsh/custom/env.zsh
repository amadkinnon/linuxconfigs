# Set the PAT if pass is available
if command pass &> /dev/null; then
    if command pass github/PAT &> /dev/null; then
        export GITHUB_OAUTH_TOKEN=$(pass github/PAT)
    fi
fi

# Set pass as the vault backend
if command aws-vault &> /dev/null; then
    export AWS_VAULT_BACKEND=pass
fi

# SSH Agent
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket

export GPG_TTY=$(tty)
