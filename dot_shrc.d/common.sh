# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG="en_US.UTF-8"
export LC_ALL="en_US.utf8"

if nvim --version > /dev/null 2>&1
  then
    export EDITOR=nvim
    export VISUAL=nvim
    alias vim=nvim
    alias vi=nvim
  else
    export EDITOR=vim
    export VISUAL=vim
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Generic
alias upgrep='pgrep -u $(whoami)'

# Settings
alias zshconfig="chezmoi edit ~/.zshrc"
alias ohmyzsh="chezmoi edit ~/.oh-my-zsh"


MY_WORKSPACE=$HOME/workspace
alias work='cd "$MY_WORKSPACE"'

MY_PLAYGROUND=$HOME/playground
alias play='cd $MY_PLAYGROUND'

# Python

VENV_NAME=".venv"
activate() { 
  source "$VENV_NAME"/bin/activate
}
venv() {
    if [ -n "${1-}" ] ; then
        if [ ! -d "${1}" ] ; then
            echo "${1} is not a directory" >&2
            return 1
        fi
        cd "${1}"
        shift
    fi
    if [ ! -d "$VENV_NAME" ] ; then 
        uv venv --prompt "$(basename $PWD)-env" "$VENV_NAME"
    fi
    source "$VENV_NAME"/bin/activate
}
rmvenv() {
  rm -rf "$VENV_NAME"
}

notebook() {
  mkdir -p "$MY_WORKSPACE/notebooks"
  cd "$MY_WORKSPACE/notebooks"
  jupyter lab
}

# Allow debugging of python coroutines
# Do not set in prod
export PYTHONTRACEMALLOC=1

# Config file for Python REPL
export PYTHONSTARTUP=~/.pythonrc

## Completions
if register-python-argcomplete --version > /dev/null 2>&1 ; then
  if pipx --version > /dev/null 2>&1 ; then
    eval "$(register-python-argcomplete pipx)"
  fi
fi

# Rust
append_path "$HOME/.cargo/bin"
