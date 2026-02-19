# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# ---------------------------------------------------------------------------
# History
# ---------------------------------------------------------------------------
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# ---------------------------------------------------------------------------
# Shell options
# ---------------------------------------------------------------------------
shopt -s checkwinsize
shopt -s globstar 2>/dev/null

# ---------------------------------------------------------------------------
# Prompt
# ---------------------------------------------------------------------------

# Function to get git branch
parse_git_branch() {
  branch=$(git branch --show-current 2>/dev/null)
  if [ -n "$branch" ]; then
    echo " on [$branch]"
  fi
}

# Logic: ${VAR:-default} means "Use VAR if set, otherwise use 'default'"
PS1='[${CONDA_DEFAULT_ENV:-native}]\n[\u@\h \w]$(parse_git_branch)\n$ '

# ---------------------------------------------------------------------------
# PATH
# ---------------------------------------------------------------------------
export PATH="$HOME/.local/bin:$PATH"

# ---------------------------------------------------------------------------
# Aliases
# ---------------------------------------------------------------------------
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ---------------------------------------------------------------------------
# Completion
# ---------------------------------------------------------------------------
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# ---------------------------------------------------------------------------
# Anaconda
# ---------------------------------------------------------------------------

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda/bin/conda' 'shell.bash' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
  eval "$__conda_setup"
else
  if [ -f "/opt/anaconda/etc/profile.d/conda.sh" ]; then
    . "/opt/anaconda/etc/profile.d/conda.sh"
  else
    export PATH="/opt/anaconda/bin:$PATH"
  fi
fi
unset __conda_setup
# <<< conda initialize <<
