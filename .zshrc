# Custom Prompt
autoload -U promptinit; promptinit
prompt spaceship

# Auto Suggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# FZF
project_or_current_dir() {
	git rev-parse --show-toplevel 2> /dev/null || pwd
}

FZF_PREVIEW_DEFAULTS='--bind left:preview-page-up,right:preview-page-down --preview-window up:99%'
export FZF_ALT_C_COMMAND="fd --type d . $HOME"
export FZF_ALT_C_OPTS="$FZF_PREVIEW_DEFAULTS --preview 'tree -C {}'"

export FZF_DEFAULT_COMMAND="fd --type f --hidden . $(project_or_current_dir)"
export FZF_DEFAULT_OPTS="--layout default --info inline --multi"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--no-height $FZF_PREVIEW_DEFAULTS --preview 'bat --color always --style full --line-range 1: {}'"

function chpwd() {
    export FZF_DEFAULT_COMMAND="fd --type f --hidden . $(project_or_current_dir)"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# FZF Completion
source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh

# Interactive Git (via FZF)
source ~/.zsh/forgit/forgit.plugin.zsh

# Forgit Aliases
# ga - Interactive git add selector
# gcf - Interactive git checkout <file> selector
# gclean - Interactive git clean selector
# gd - Interactive git diff viewer
# gi - Interactive .gitignore generator
# glo - Interactive git log viewer
# grh - Interactive git reset HEAD <file> selector
# gss - Interactive git stash viewer

# Custom Aliases
alias gb='git branch'
alias gc='git commit'
alias gcm='git checkout master'
alias gco='git checkout'
alias gl='git pull'
alias gm='git merge'
alias gp='git push'
alias grbm='git rebase master'
alias gst='git status'
alias l='ls -lAhG'

# Ctrl-f (Find in Files)
RG_PREFIX='rg --column --line-number --no-heading --color=always --smart-case '
INITIAL_QUERY=''
FZF_DEFAULT_COMMAND="$RG_PREFIX '$INITIAL_QUERY' ."

__fif() {
    fzf --bind "change:reload:$RG_PREFIX {q} . || true" --ansi --phony --query "$INITIAL_QUERY" | cut -d ':' -f1
}

find-in-files() {
  LBUFFER="${LBUFFER}$(__fif)"
  local ret=$?
  zle reset-prompt
  return $ret
}

zle -N find-in-files
bindkey '^f' find-in-files

# Ctrl-x (Kill Process)
fkill() {
    local pid
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi
}

zle -N fkill
bindkey '^x' fkill
