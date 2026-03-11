# ~/.zshrc: executed for interactive shells.

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ---------------------------------------------------------------------------
# History
# ---------------------------------------------------------------------------
HISTSIZE=1000
SAVEHIST=2000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt APPEND_HISTORY

# ---------------------------------------------------------------------------
# Shell options
# ---------------------------------------------------------------------------
setopt GLOB_STAR_SHORT 2>/dev/null

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

setopt PROMPT_SUBST
PS1='[${CONDA_DEFAULT_ENV:-native}]
[%n@%m %~]$(parse_git_branch)
$ '

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
autoload -Uz compinit
compinit

# ---------------------------------------------------------------------------
# Anaconda
# ---------------------------------------------------------------------------

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
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
# <<< conda initialize <<<
