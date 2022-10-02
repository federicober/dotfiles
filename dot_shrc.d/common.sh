# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG="en_US.UTF-8"
export LC_ALL="en_US.utf8"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
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

alias work='cd ~/workspace'

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

# Allow debugging of python coroutines
# Do not set in prod
export PYTHONTRACEMALLOC=1

## Completions
eval "$(register-python-argcomplete pipx)"
