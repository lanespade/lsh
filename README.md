# Installation

## Disclaimer
This is only tested on the latest **M1** macOS

## [install.zsh](https://github.com/lanespade/lsh/blob/master/install.zsh)

### [brew.zsh](https://github.com/lanespade/lsh/blob/master/brew.zsh)
* Installs homebrew
* Reinstalls the following brews...
	* **[fzf](https://github.com/junegunn/fzf)**
	* **[ripgrep](https://github.com/BurntSushi/ripgrep)**
	* **[fd](https://github.com/sharkdp/fd)**
	* **[bat](https://github.com/sharkdp/bat)**
	* **[tree](https://en.wikipedia.org/wiki/Tree_(command))**
	* **[spaceship](https://github.com/spaceship-prompt/spaceship-prompt)** 
* Installs the following casks...
	* **[font-fira-code](https://github.com/tonsky/FiraCode)**

### [ignore.zsh](https://github.com/lanespade/lsh/blob/master/ignore.zsh)
* Creates / replaces `~/.ignore`

### [npm.zsh](https://github.com/lanespade/lsh/blob/master/npm.zsh)
* Reinstalls `nvm` (via zsh-nvm)
* Creates / replaces `~/.nvmrc` with 'stable'
* Installs `npm`

### [zshrc.zsh](https://github.com/lanespade/lsh/blob/master/zshrc.zsh)
* Reinstalls the following plugins into `~/.zsh/`...
	* **[zsh-nvm](https://github.com/lukechilds/zsh-nvm)**
	* **[zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)**
	* **[fzf-tab](https://github.com/Aloxaf/fzf-tab)**
	* **[forgit](https://github.com/wfxr/forgit)**
	* **[zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)**
* Creates / replaces `~/.zshrc`

### [terminal.zsh](https://github.com/lanespade/lsh/blob/master/terminal.zsh)
* Replace `~/Library/Preferences/com.apple.Terminal.plist` in order to...
	* Default to Homebrew
	* Switch to Fira Code Light font
	* Enable "Use option as Meta Key"

## tl;dr

1. `git clone https://github.com/lanespade/lsh.git`
1. `cd lsh`
1. `./install.zsh`
1. Logout and log back in

# Shell Breakdown (.zshrc)

## NVM
Loads zsh-nvm plugin to enable nvm with completion 

## Custom Prompt
Loads spaceship

## Completion
Enables zsh and bash built-in completions

## FZF Completion
Loads fzf-tab plugin to enable fuzzy completion

## FZF
Opinionated, minimal configuration of the `fzf` keybindings, Alt-C, Ctrl-R, and Ctrl-T

### Alt-C
Finds directory to change to by name, starting at the home directory using `fd` while previewing contents using `tree`

### Ctrl-T
Finds file by name, starting in the current directory using `fd` in fullscreen mode while previewing contents using `bat`

## Interactive Git
Enables forgit for interactive git commands

## Aliases
Primarily around `git` and the extremely valuable `l` alias (inspired by `oh-my-zsh`)

## Custom Key Bindings

### Ctrl-f (Find in Files)
A key binding connected to a function that combines `fzf` and `rg` to search file contents and selected files back to the prompt to be used however (i.e. opened with an editor, removed, moved, `chmod`, etc.)

### Ctrl-x (Kill Process)
A key binding connected to a function that combines `fzf` and `ps` to filter, select (multi), and terminate kill-able processes

## Auto Suggestions
Loads zsh-autosuggestions plugin to enable suggestions as you type

## Syntax Highlighting
Loads zsh-syntax-highlighting plugin to enable syntax highlighting as you type
