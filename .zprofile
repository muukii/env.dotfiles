echo "🥤 Load zprofile"
# setup ghq
which ghq > /dev/null && export GHQ_ROOT=~/.ghq

# setup goenv
if [ -d "$HOME/.goenv" ]; then
  export GOPATH="$HOME/develop"
  export GOBIN="$GOPATH/bin"
  export PATH="$HOME/.goenv/bin:$PATH"
  eval "$(goenv init -)"  
  echo "🥤 goenv"
fi

# setup pyenv
if [ -d "$HOME/.pyenv" ]; then
  export PYTHON_CONFIGURE_OPTS="--enable-shared"
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
  echo "🥤 pyenv"
fi

# setup swiftenv
if [ -d "$HOME/.swiftenv" ]; then
  export SWIFTENV_ROOT="$HOME/.swiftenv"
  export PATH="$SWIFTENV_ROOT/bin:$PATH"
  eval "$(swiftenv init -)"
  echo "🥤 swiftenv"
fi

which rbenv > /dev/null 2>&1 && eval "$(direnv hook zsh)" && export EDITOR="vim"

# setup rbenv
if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
  echo "🥤 rbenv"
fi

# setup nvm
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.cargo/bin:$PATH"
