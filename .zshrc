# load local rc data
source ~/Development/config_files/.zshlocal    

[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"
[[ -f "$HOME/.localaliases" ]] && source "$HOME/.localaliases"
[[ -f "~/.zshfns" ]] && source ~/.zshfns

# python
alias python3=python3.12
alias python=python3
export PIPX_DEFAULT_PYTHON=python3
alias vac='source .venv/bin/activate'
alias vinit='python -m venv .venv --prompt ${${PWD:t}//\ /}'

# aliases
alias ls='eza'
alias countdir='pwd | ls -1 | wc -l'

alias ytdl='yt-dlp'
alias f2v='f() { ffmpeg -framerate 30 -pattern_type glob -i "$1/*.jpeg" -c:v libx264 -pix_fmt yuv420p $2 };f'
alias gitpush-fix='git config http.postBuffer 524288000'
alias prettycolors='msgcat --color=test'
alias pdfmerge='"/System/Library/Automator/Combine PDF Pages.action/Contents/MacOS/join" -o'
alias copy='pbcopy'
alias diff='diff --color=auto'
alias cafe='caffeinate -d > /dev/null &'
alias decaf='kill $(pgrep caffeinate)'

# help aliases
local mod_help_str="u: Converts the string to uppercase\n\
l: Converts the string to lowercase\n\
h: Extracts the head (directory part) of a path\n\
t: Extracts the tail (basename) of a path\n\
r: Extracts the root (basename without extension) of a path\n\
e: Extracts the extension of a path\n\
a: Converts a path to its absolute form"

alias strmod-h='echo "$mod_help_str"'

# prompt
function git_branch_name() {
    local branch=$(git branch 2> /dev/null | grep "*")
    branch="${branch#*\ }"
    branch="${branch#*\/}"
    branch="${branch//\(/}"
    branch="${branch//\)/}"
    local repo_basename=$(basename $(git rev-parse --show-toplevel) 2> /dev/null)
    if [[ -n $branch ]]; then
        if [ $repo_basename = 'yon' ]; then
            # ignore root repo
            echo ""
        else
	        echo "($branch) "
        fi
    else
    	echo ""
    fi
}

export VIRTUAL_ENV_DISABLE_PROMPT=1

function virtualenv_info(){
    if [[ -n "$VIRTUAL_ENV" ]]; then
        if [[ -n "$VIRTUAL_ENV_PROMPT" ]]; then
	    venv="${VIRTUAL_ENV_PROMPT//'('/}"
	    venv="${venv//')'/}"
	    venv="${venv//' '/}"
        else
            venv="${VIRTUAL_ENV##*/}"
        fi
        echo "(${venv}) "
    fi
} 

# Enable prompt options for better stability
setopt prompt_subst
setopt prompt_percent
setopt transient_rprompt

# Load colors
autoload -U colors && colors

# Create a more stable prompt using prompt expansion
# %{...%} tells zsh that the enclosed text doesn't take up space (for colors)
# This prevents issues with line wrapping and pasting
PROMPT='$(virtualenv_info)%{$fg[blue]%}%n@%m%{$reset_color%} %{$fg[yellow]%}$(git_branch_name)%{$reset_color%}%{$fg[yellow]%}%1d%{$reset_color%} %% '

LSCOLORS="fxfxcxdxbxegedabagacad"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/opt/homebrew/opt/ruby@3.2/bin:$PATH"
export PATH=~/bin:$PATH

unsetopt inc_append_history
unsetopt share_history

