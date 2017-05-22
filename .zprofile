
# setup ghq
which ghq > /dev/null && export GHQ_ROOT=~/develop/src

# setup goenv
if [ -d "$HOME/.goenv" ]; then
  export GOPATH="$HOME/develop"
  export GOBIN="$GOPATH/bin"
  export GOENV_ROOT="$HOME/.goenv"
  if [[ ":${PATH}:" != *:"${GOENV_ROOT}/bin":* ]]; then
    export PATH="$GOENV_ROOT/bin:$PATH"
    which goenv > /dev/null 2>&1 && eval "$(goenv init -)"
  fi
fi

# setup nvm
if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  if [[ ":${PATH}:" != *:"${NVM_DIR}/bin":* ]]; then
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
  fi
fi

# setup pyenv
if [ -d "$HOME/.pyenv" ]; then
  export PYTHON_CONFIGURE_OPTS="--enable-shared"
  export PYENV_ROOT="$HOME/.pyenv"
  if [[ ":${PATH}:" != *:"${PYENV_ROOT}/bin":* ]]; then
    export PATH="$PYENV_ROOT/bin:$PATH"
    which pyenv > /dev/null 2>&1 && eval "$(pyenv init -)"
  fi
fi

# setup swiftenv
if [ -d "$HOME/.swiftenv" ]; then
  export SWIFTENV_ROOT="$HOME/.swiftenv"
  export PATH="$SWIFTENV_ROOT/bin:$PATH"
  eval "$(swiftenv init -)"
fi

which rbenv > /dev/null 2>&1 && eval "$(direnv hook zsh)" && export EDITOR="vim"

# setup rbenv
if [ -d "$HOME/.rbenv" ]; then
  export RBENV_ROOT="$HOME/.rbenv"
  if [[ ":${PATH}:" != *:"${RBENV_ROOT}/bin":* ]]; then
    export PATH="$RBENV_ROOT/bin:$PATH"
    which rbenv > /dev/null 2>&1 && eval "$(rbenv init -)"
  fi
fi

export PATH="$HOME/.cargo/bin:$PATH"
