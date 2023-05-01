# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG="en_US.UTF-8"
export LC_ALL="en_US.utf8"

if nvim --version > /dev/null
  then
    EDITOR=nvim
    alias vim=nvim
    alias vi=nvim
  else
    EDITOR=vim
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Generic
alias zshconfig="chezmoi edit ~/.zshrc"
alias ohmyzsh="chezmoi edit ~/.oh-my-zsh"

MY_WORKSPACE=$HOME/workspace
alias work='cd "$MY_WORKSPACE"'

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
        virtualenv --prompt "$(basename $PWD)-env" "$VENV_NAME"
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

## Completions
eval "$(register-python-argcomplete pipx)"

# Rust
append_path "$HOME/.cargo/bin"
