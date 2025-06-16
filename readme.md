# readme 


Scripts
1. ./MacOS.sh - installs the core shit that i need on a Macbook
2. ./MacOS_neovim.sh - installs packages used as dependecies in my neovim configuration. You can lauch neovim BEFORE running this script, and then do a `:checkhealth` to get a sense of what errors this script is aiming to solve. 


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

These are general tmux commands.

- `tmux new -s bob`: New session with name 
- `tmux ls`: List sessions
- `tmux a`: Reattach to most recent session
- `tmux a -t 0` or `tmux a -t bob`: Reattach to targeted session 
- `tmux kill-session`: Kill most recent session 
- `tmux kill-session -t bob`: Kill named session 

**Session Hotkeys**

- `control + b s`: Show all sessions and switch between them
- `control + b $`: Rename the current session
- `control + b d`: Detach from the current session (same as above, just listing for clarity)

**Window Hotkeys**

- `control + b c`: Create a new window
- `control + b n`: Switch to the next window
- `control + b p`: Switch to the previous window
- `control + b 0` ... `control + b 9`: Jump to window by number (0-9)
- `control + b ,`: Rename the current window
- `control + b &`: Kill the current window (with confirmation)

**Pane Hotkeys**

- `control + b %`: Split pane vertically (left/right)
- `control + b "`: Split pane horizontally (top/bottom)
- `control + b o`: Cycle through panes
- `control + b arrow-key`: Move to pane in direction of arrow (up, down, left, right)
- `control + b z`: Zoom/unzoom the current pane (full-screen toggle)
- `control + b x`: Kill the current pane (with confirmation)
- `control + b q`: Show pane numbers (then press number to jump to that pane)
- `control + b !`: Break pane into its own window

**Misc Hotkeys (Prefix + Key)**

- `control + b t`: Show a big clock in the current pane (useful for breaks)
- `control + b ?`: List all Tmux keybindings (handy for reference)
- `control + b :`: Enter Tmux command prompt (e.g., for :kill-pane or other commands)

## Notes

- All hotkeys start with `control + b` (prefix), then release and press the next key.
- In Tmux docs or configs, `control + b` is written as `C-b`. For example, `control + b c` is `C-b c`.
- Terminal commands like `tmux new` or `tmux ls` are run outside Tmux, while hotkeys (control + b ...) are used inside an active Tmux session.
- If `control + b` feels awkward, you can change the prefix in your `~/.tmux.conf`, like `set -g prefix C-a` for `control + a`.
- Use `control + b q` to see pane numbers if you’re lost in a multi-pane setup.
- For scripting or automation, commands like `tmux send-keys` or `tmux new -d` are lifesavers.
- Check `man tmux` or run `tmux list-commands` for a full list of commands if you want to go deeper.


