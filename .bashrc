########################################################
# load Square specific bashrc
########################################################
source ~/Development/config_files/square/bashrc
########################################################

###########################################
# Feel free to make your own changes below.
###########################################

# uncomment to automatically `bundle exec` common ruby commands
# if [[ -f "$SQUARE_HOME/config_files/square/bundler-exec.sh" ]]; then
#   source $SQUARE_HOME/config_files/square/bundler-exec.sh
# fi

# load the aliases in config_files files (optional)
source ~/Development/config_files/square/aliases

[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"
[[ -f "$HOME/.localaliases" ]] && source "$HOME/.localaliases"

#######################################################
# Square specific section - commented out for bash compatibility
#######################################################
# source ~/Development/config_files/square/zshrc
#######################################################

###########################################
# Feel free to make your own changes below.
###########################################

# uncomment to automatically `bundle exec` common ruby commands
# if [[ -f "$SQUARE_HOME/config_files/square/bundler-exec.sh" ]]; then
#   source $SQUARE_HOME/config_files/square/bundler-exec.sh
# fi

# load the aliases in config_files files (optional) - commented out (Square specific)
# source ~/Development/config_files/square/aliases

[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"
[[ -f "$HOME/.localaliases" ]] && source "$HOME/.localaliases"

alias python=python3
# alias compost="~/Development/topsoil/compost"  # commented out (Square specific)

# end block zshrc #

# alias ls='eza'  # commented out - requires eza to be installed
alias countdir='pwd | ls -1 | wc -l'
alias vac='source .venv/bin/activate'
# Note: ${PWD:t} is zsh syntax, using basename instead
alias vinit='python -m venv .venv --prompt $(basename "$PWD")'
# alias ytdl='yt-dlp'  # commented out - requires yt-dlp to be installed
alias f2v='f() { ffmpeg -framerate 30 -pattern_type glob -i "$1/*.jpeg" -c:v libx264 -pix_fmt yuv420p $2 };f'
alias gitpush-fix='git config http.postBuffer 524288000'
# alias prettycolors='msgcat --color=test'  # commented out - msgcat may not be available on Ubuntu
# alias pdfmerge='"/System/Library/Automator/Combine PDF Pages.action/Contents/MacOS/join" -o'  # commented out - macOS specific

# help aliases
mod_help_str="u: Converts the string to uppercase\n\
l: Converts the string to lowercase\n\
h: Extracts the head (directory part) of a path\n\
t: Extracts the tail (basename) of a path\n\
r: Extracts the root (basename without extension) of a path\n\
e: Extracts the extension of a path\n\
a: Converts a path to its absolute form"

alias strmod-h='echo -e "$mod_help_str"'

# alias git-push-all="~/Development/scripts/git_push_all.zsh"  # commented out (Square specific)

function git_branch_name() {
  local branch=$(git branch 2> /dev/null | grep "*")
  branch="${branch#*\ }"
  branch="${branch#*\/}"
  branch="${branch//\(/}"
  branch="${branch//\)/}"
  if [[ -n $branch ]]; then
    echo "($branch)"
  else
    echo -e "\b"
  fi
}

# export VIRTUAL_ENV_DISABLE_PROMPT=1

# function virtualenv_info(){
#     if [[ -n "$VIRTUAL_ENV" ]]; then
#         venv="${VIRTUAL_ENV##*/}" # Extracts the environment name
#         echo "(venv:$venv) "
#     fi
# }

# Bash prompt setup (equivalent to zsh PROMPT)
# Ubuntu bash uses PS1 with ANSI color codes
PS1='\[\033[34m\]\u@\h \[\033[33m\]$(git_branch_name) \[\033[0m\]\W % '

# Ubuntu uses LS_COLORS instead of LSCOLORS (GNU coreutils vs BSD)
# Setting up colors for ls command on Ubuntu
export LS_COLORS='di=35:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'

# Enable color support for ls and grep if available
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# NVM setup (works the same in bash)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Ruby path - commented out homebrew path (macOS specific)
# Common Ubuntu Ruby paths (uncomment if you have Ruby installed via rbenv, rvm, or system package)
# export PATH="$HOME/.rbenv/bin:$PATH"  # for rbenv
# eval "$(rbenv init -)"  # for rbenv
# export PATH="/usr/local/bin:$PATH"  # for system ruby
