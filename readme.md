# readme 

## Cloning

```sh
cd ~/
git clone https://github.com/matthewbub/dotfiles.git .config
```


## Scripts

1. ./MacOS.sh - installs the core shit that i need on a Macbook
2. ./MacOS_neovim.sh - installs packages used as dependecies in my neovim configuration. You can lauch neovim BEFORE running this script, and then do a `:checkhealth` to get a sense of what errors this script is aiming to solve. 

## Manual Setup Steps (After running scripts)

Modify your `~/.gitconfig` file to include the this git config associated with this repo 

```text
[user]
    name = Your Name
    email = your.email@example.com
[include]
    path = ~/.config/git/config
```



# NeoVim - good to knows

hey if it's your first time working with vim, or you want a refresher on the basics, check out this post https://www.matthewbub.com/blog/vim-motions-a-generalists-guide

`C-` = `Ctrl`


## Hotkeys

**navigate completion menus** (blink.cmp, normal mode). I have a hard time getting this to stick in my head.

- `C-n`: Selects the next item in the completion menu.
- `C-p`: Selects the previous item in the completion menu.
- `C-y`: Accept the  currently selected menu item 

**general searching of files and contents**

While in Normal Mode, type `:Telescope` to choose from the available options

- `:Telescope live_grep`: search text in files
- `:Telescope find_files`: to search for files

# Tmux hotkeys 

`control + b ?`: List all Tmux keybindings 
