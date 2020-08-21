# Custom Prompt
autoload -U promptinit; promptinit
prompt spaceship

# Auto Suggestions
source <(curl -sSL https://raw.githubusercontent.com/zsh-users/zsh-autosuggestions/master/zsh-autosuggestions.zsh)

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# FZF
FZF_PREVIEW_DEFAULTS='--bind left:preview-page-up,right:preview-page-down --preview-window up:99%'
export FZF_ALT_C_COMMAND="fd --type d . $HOME"
export FZF_ALT_C_OPTS="$FZF_PREVIEW_DEFAULTS --preview 'tree -C {}'"

export FZF_DEFAULT_COMMAND="fd --type f . $HOME"
export FZF_DEFAULT_OPTS="--layout default --info inline -m"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--no-height $FZF_PREVIEW_DEFAULTS --preview 'bat --color always --style full --line-range 1: {}'"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# FZF Completion
source <(curl -sSL https://raw.githubusercontent.com/lincheney/fzf-tab-completion/master/zsh/fzf-zsh-completion.sh)
zstyle ':completion:*' fzf-search-display true # Allow searching display strings as well

# Interactive Git (via FZF)
source <(curl -sSL https://raw.githubusercontent.com/wfxr/forgit/master/forgit.plugin.zsh)

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
alias gc='git commit -m'
alias gcm='git checkout master'
alias gco='git checkout'
alias gl='git pull'
alias gp='git push'
alias grbm='git rebase master'
alias gst='git status'
alias l='ls -lAhG'

# Ctrl-f (Find in Files)
RG_PREFIX='rg --column --line-number --no-heading --color=always --smart-case '
INITIAL_QUERY=''
FZF_DEFAULT_COMMAND="$RG_PREFIX '$INITIAL_QUERY' $HOME"

__fif() {
    fzf --bind "change:reload:$RG_PREFIX {q} $HOME || true" --ansi --phony --query "$INITIAL_QUERY" | cut -d ':' -f1
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
