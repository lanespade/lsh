A minimal, effective shell environment

# Prerequisites
* zsh
* Mac

# Installation

**Warning**

The following will install nvm, 'stable' npm, homebrew, homebrews, homebrew casks, clone zsh plugins into `~/.zsh/`, and will replace `~/.zshrc`, `~/.ignore`, and `~/.nvmrc` without asking.

## Run Installation

```
git clone https://github.com/lanespade/lsh.git
./lsh/install.zsh
rm -rf lsh
```

## Configure Terminal Font
![Fira Code](https://user-images.githubusercontent.com/5313372/89879464-daffa680-db77-11ea-92e9-7a932c105f6d.png)

## Enable Terminal Meta Key
![Meta Key](https://user-images.githubusercontent.com/5313372/89879446-d4712f00-db77-11ea-9f3c-29b884ecfc3c.png)

# Installation Breakdown (install.zsh)

## brew.zsh
* Installs Homebrew 
* Installs the following brews
	* **[fzf](https://github.com/junegunn/fzf)** - command-line fuzzy finder
	* **[ripgrep](https://github.com/BurntSushi/ripgrep)** - recursively searches directories for a regex pattern while respecting your gitignore
	* **[fd](https://github.com/sharkdp/fd)** - simple, fast and user-friendly alternative to 'find'
	* **[bat](https://github.com/sharkdp/bat)** - cat(1) clone with wings.
	* **tree** - list contents of directories in a tree-like format
    * **[spaceship](https://github.com/spaceship-prompt/spaceship-prompt)** - minimalistic, powerful and extremely customizable Zsh prompt
* Installs the following casks
	* **[font-fira-code](https://github.com/tonsky/FiraCode)** - monospaced font with programming ligatures

## ignore.zsh
* Copies `.ignore` under the home directory (used by `rg` and `fd`)

## npm.zsh
* Installs NVM (via **[zsh-nvm](https://github.com/lukechilds/zsh-nvm)**)
* Sets ~/.nvmrc to 'stable'

## zshrc.zsh
* Copies `.zshrc` under the home directory
* Sources it

# Shell Breakdown (.zshrc)

## # NVM
Configures the zsh-nvm plugin to call `nvm use` whenever a directory changes to switch NPM versions, enables auto completion and loads the plugin

## # Custom Prompt
Loads spaceship-prompt

## # Auto Suggestions
Nice to have, Ctrl-R like shadow functionality that I find useful as I am not always so quick to bring up Ctrl-R

## # FZF
Opinionated, minimal configuration of the `fzf` keybindings, Alt-C, Ctrl-R, and Ctrl-T

### Alt-C
Finds directory to change to by name, starting at the home directory using `fd` while previewing contents using `tree`

### Ctrl-T
Finds file by name, starting in the current directory using `fd` in fullscreen mode while previewing contents using `bat`

## # FZF Tab
Enables `fzf` fuzzy filtering for all tab completions, immensely powerful

## # Interactive Git (via FZF)
**forgit** is a great tool built on top of `fzf` to add interactivity around git commands

## # Aliases
Primarily around `git` and **forgit** and the extremely valuable `l` alias (inspired by `oh-my-zsh`)

## # Ctrl-f (Find in Files)
A key binding connected to a function that combines `fzf` and `rg` to search file contents and selected files back to the prompt to be used however (i.e. opened with an editor, removed, moved, `chmod`, etc.)

## # Ctrl-x (Kill Process)
A key binding connected to a function that combines `fzf` and `ps` to filter, select (multi), and terminate kill-able processes
