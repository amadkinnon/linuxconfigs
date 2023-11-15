alias vi='nvim'
alias gitl='git log --pretty=oneline --abbrev-commit'
alias gitfpm='git checkout master && git fetch && git pull'
alias gitfpmn='git checkout main && git fetch && git pull'
alias yarnreset='rm -f yarn.lock && yarn clean && yarn lerna clean -y && rm -rf node_modules && yarn install'
alias kc='kubectl'
alias kcb='kubectl -n backstage '
alias fact81='ARGOCD_TOKEN=$(pass show argo/factorium) BT_AUTHTYPE=PAT BT_PLAYGROUND=true BT_LOGLEVEL=debug BT_MODE=debug BT_SERVER_PORT=8081 BT_HEALTH_PORT=8084 BT_METRICS_PORT=8085 dist/factorium server'
alias nve='vi ~/.config/nvim/lua/adam/'
alias devfact='BT_PLAYGROUND=true BT_LOGLEVEL=debug BT_MODE=debug FACTORIUM_GITHUB_APPID=$(pass show github/factorium/gha-appid) FACTORIUM_GITHUB_INSTALLID=$(pass show github/factorium/gha-installid) FACTORIUM_GITHUB_PKEY=$(pass show github/factorium/gha-pkey) dist/factorium'
alias loginecr='aws-vault exec sb-amackinnon --prompt-ykman -- aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 330434500086.dkr.ecr.us-east-1.amazonaws.com'
alias ave='aws-vault exec sb-amackinnon --prompt=ykman -- '
alias dr='cd ~/dev'