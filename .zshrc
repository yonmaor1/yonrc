#######################################################
# load Square specific zshrc; please don't change this bit.
#######################################################
source ~/Development/config_files/square/zshrc
#######################################################

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

alias python=python3
alias compost="~/Development/topsoil/compost"

# end block zshrc #

alias ls='eza'
alias countdir='pwd | ls -1 | wc -l'
alias vac='source .venv/bin/activate'
alias vinit='python -m venv .venv --prompt ${PWD:t//\ /}'
alias ytdl='yt-dlp'
alias f2v='f() { ffmpeg -framerate 30 -pattern_type glob -i "$1/*.jpeg" -c:v libx264 -pix_fmt yuv420p $2 };f'
alias gitpush-fix='git config http.postBuffer 524288000'
alias prettycolors='msgcat --color=test'
alias pdfmerge='"/System/Library/Automator/Combine PDF Pages.action/Contents/MacOS/join" -o'
alias copy='pbcopy'


# help aliases
local mod_help_str="u: Converts the string to uppercase\n\
l: Converts the string to lowercase\n\
h: Extracts the head (directory part) of a path\n\
t: Extracts the tail (basename) of a path\n\
r: Extracts the root (basename without extension) of a path\n\
e: Extracts the extension of a path\n\
a: Converts a path to its absolute form"

alias strmod-h='echo "$mod_help_str"'

alias git-push-all="~/Development/scripts/git_push_all.zsh"

function git_branch_name() {
  local branch=$(git branch 2> /dev/null | grep "*")
  branch="${branch#*\ }"
  branch="${branch#*\/}"
  branch="${branch//\(/}"
  branch="${branch//\)/}"
  if [[ -n $branch ]]; then
    echo "($branch)"
  fi
}

 export VIRTUAL_ENV_DISABLE_PROMPT=1

function virtualenv_info(){
    if [[ -n "$VIRTUAL_ENV" ]]; then
        if [[ -n "$VIRTUAL_ENV_PROMPT" ]]; then
            venv="${VIRTUAL_ENV_PROMPT//[()]/}"
        else
            venv="${VIRTUAL_ENV##*/}"
        fi
        echo "(${venv#*\:}) "
    fi
} 

# Enable substitution in the prompt.
setopt prompt_subst

autoload -U colors && colors

# Use a dynamic evaluation of the branch name in the prompt.
PROMPT='$(virtualenv_info)%F{blue}%n@%m%f %F{yellow}$(git_branch_name) %1d%f %% '

LSCOLORS="fxfxcxdxbxegedabagacad"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/opt/homebrew/opt/ruby@3.2/bin:$PATH"
