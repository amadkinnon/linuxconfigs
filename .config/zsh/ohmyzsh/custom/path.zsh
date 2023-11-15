#export PATH=$PATH:~/bin:/usr/local/bin/nvim/bin:~/go/bin
function pathmunge () {
  if ! echo "$PATH" | grep -Eq "(^|:)$1($|:)"; then
    if [ "$2" = "after" ]; then
        export PATH="$PATH:$1"
      else
        export PATH="$1:$PATH"
    fi
  fi
}

additional_paths=("/usr/local/texlive/2023/bin/x86_64-linux" "${HOME}/bin" "${HOME}/go/bin" "${HOME}/.yarn/bin" "/usr/local/bin/nvim/bin")

for dir in $additional_paths
do
  if [ -d $dir ]; then
    pathmunge $dir "after"
  fi
done

# NVM Config
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
