# About Me
* Minimal
* Opinionated

# Prerequisites
* zsh
* Mac

# Why
* Effective tooling
* Abstractions work

# Install Brew & Dependencies
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)
brew reinstall fzf
brew reinstall ripgrep
brew reinstall fd
brew reinstall bat
```

# Install Node & Dependencies
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | zsh
echo 'stable' > $HOME/.nvmrc
npm i -g pure-prompt
npm i -g diff-so-fancy
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
```

# Define ~/.zshrc
## Pure Prompt
```
autoload -U promptinit; promptinit
prompt pure
```
## NVM
```
export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```
## FZF
```
project_or_home_dir() {
	git rev-parse --show-toplevel 2> /dev/null || echo $HOME
}

export FZF_ALT_C_COMMAND='fd --type d . $HOME'
export FZF_ALT_C_OPTS="--preview-window down:99% --preview 'tree -C {}'"

export FZF_DEFAULT_COMMAND="fd --type f . $(project_or_home_dir)"
export FZF_DEFAULT_OPTS="--reverse --no-height --info inline"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--multi --bind left:preview-page-up,right:preview-page-down --preview-window down:99% --preview 'bat --color always --style numbers,changes --line-range 1: {}'"

function chpwd() {
    # Need to re-run $(project_or_home_dir) upon directory change
    export FZF_DEFAULT_COMMAND="fd --type f . $(project_or_home_dir)"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
```
