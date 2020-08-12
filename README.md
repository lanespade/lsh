A minimal, effective shell environment

# Prerequisites
* zsh
* Mac

# tl;dr

## Install Dependencies

**Warning**

The following will install nvm, npm, npm packages, homebrew, homebrews, homebrew casks, and will replace ~/.zshrc, ~/.ignore, and ~/.nvmrc without asking.

```
git clone https://github.com/lanespade/lsh.git
./lsh/install.sh
rm -rf lsh
```

## Configure Terminal Font
![Fira Code](https://user-images.githubusercontent.com/5313372/89879464-daffa680-db77-11ea-92e9-7a932c105f6d.png)

## Enable Terminal Meta Key
![Meta Key](https://user-images.githubusercontent.com/5313372/89879446-d4712f00-db77-11ea-9f3c-29b884ecfc3c.png)

# Installation Breakdown (install.sh)

## brew.sh
Installs Homebrew and the following...
* brews
	* **[fzf](https://github.com/junegunn/fzf)** - fuzzy finder, an incredibly powerful tool, the bedrock of my environment
	* **[ripgrep](https://github.com/BurntSushi/ripgrep)** - faster `grep` that respects `~/.ignore` and `.gitignore` files
	* **[fd](https://github.com/sharkdp/fd)** - faster `find` that respects `~/.ignore` and `.gitignore` files
	* **[bat](https://github.com/sharkdp/bat)** - `cat` with syntax highlighting, useful for previewing contents with `fzf`
* casks
	* **[font-fira-code](https://github.com/tonsky/FiraCode)** - support for [spaceship-prompt](https://github.com/denysdovhan/spaceship-prompt)

## ignore.sh
Copies `.ignore` under the home directory (used by `fd` and `rg`)

## nvm.sh
Installs `nvm` and creates a `.nvmrc` containing 'stable' under the home directory

## npm.sh
* packages
	* **[spaceship-prompt](https://github.com/denysdovhan/spaceship-prompt)** - minimal, beautiful prompt with git integration
	* **[diff-so-fancy](https://github.com/so-fancy/diff-so-fancy)** - improved git diffs, useful when combined with [forgit](https://github.com/wfxr/forgit)
* configurations
	* **git** - for **diff-so-fancy** core configuration, whitespace preference, and recommended colors

## zsh.sh
Copies `.zshrc` under the home directory and sources it

# Shell Breakdown (.zshrc)

## # Custom Prompt
Loads spaceship-prompt

### Why not [pure](https://github.com/sindresorhus/pure) or [starship](https://github.com/starship/starship)?
While I like the goal of cross-shell, I chose **spaceship-prompt** because it was designed for my target shell (zsh)... and it has the most stars

## # Auto Suggestions
Nice to have, Ctrl-R like shadow functionality, that I find often useful as I am not always so quick to bring up real Ctrl-R

### Why are you not using a package manager or referencing a locally cloned repo?
`source <(curl ...)` is definitely not the best practice, so I will most likely update `zsh.sh` to clone this repo (and a couple more that I "install" in the same way) under `~/.zsh/` and source from there

## # NVM
Standard NVM block, to load and enable auto completion

## # FZF
Opinionated, minimal configuration of the built-in `fzf` keybindings, Alt-C and Ctrl-T, and its defaults

### Alt-C
Finds directories starting at the home directory using `fd` while previewing contents using `tree`

### Defaults (including Ctrl-R)
Finds files starting at the home directory using `fd` above the cursor using 40% of the screen

### Ctrl-T
Finds files starting at the home directory using `fd` in fullscreen mode while previewing contents using `bat`

## # FZF Completion
Enables `fzf` fuzzy filtering for all tab completions, immensely powerful, like having `man` open at all times

### Why not [fzf-tab](https://github.com/Aloxaf/fzf-tab)?
I tried both and they both seem to work, but **fzf-tab** didn't install as cleanly (due to zsh-ls-colors) and seemed to conflict with **zsh-autosuggestions** (order matters in `.zshrc`)

## # Interactive Git (via FZF)
**forgit** is a great tool built on top of `fzf` to add interactivity around git commands

## # Aliases
Primarily around `git` and **forgit** and the extremely valuable `l` alias (inspired by `oh-my-zsh`)

## # Ctrl-f (Find in Files)
A key binding connected to a function that combines `fzf` and `rg` to search file contents and selected files back to the prompt to be used however (i.e. opened with an editor, removed, moved, `chmod`, etc.)

## # Ctrl-x (Kill Process)
A key binding connected to a function that combines `fzf` and `ps` to filter, select (multi), and terminate kill-able processes
