# readme

<img width="1613" alt="screenshot" src="https://github.com/user-attachments/assets/ceef90b9-b072-4196-9923-192ca32a8812" />

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

# Neovim - good to knows

hey if it's your first time working with vim, or you want a refresher on the basics, check out this post https://www.matthewbub.com/blog/vim-motions-a-generalists-guide

## Cheat Sheet (this setup)

### Leaders

- Leader: Space
- Local Leader: \

### Explorer (Neo-tree)

- \: Toggle reveal current file (focus) / closes window inside Neo-tree

### Search (Telescope)

- <leader>sf: Search files (hidden included)
- <leader>sg: Live grep (project)
- <leader>sw: Grep current word
- <leader>sb: Buffers
- <leader>sh: Help tags
- <leader>sk: Keymaps
- <leader>ss: Telescope builtins
- <leader>sr: Resume last picker
- <leader>s.: Recent files
- <leader>/: Fuzzy find in current buffer
- <leader>s/: Live grep in open files

### Buffers (bufferline.nvim)

- Navigate: <S-l> (next), <S-h> (prev)
- Navigate: <leader>bl (next), <leader>bh (prev)
- Move: <leader>bmr (move right), <leader>bml (move left)
- Jump to N: <leader>b1 … <leader>b9
- Pick buffer: <leader>bp
- Pick & close: <leader>bpc
- Pin: <leader>bP
- Close: <leader>bc (pick close), <leader>bco (close others), <leader>bcr (close right), <leader>bcl (close left)
- Sort: <leader>bse (by extension), <leader>bsd (by directory), <leader>bst (by tabs)
- Group toggle: <leader>bgt

### Git (gitsigns.nvim)

- Next/prev hunk: ]c / [c
- Stage hunk: <leader>gs (or Visual: <leader>hs)
- Reset hunk: <leader>gr (or Visual: <leader>hr)
- Stage buffer: <leader>gS
- Undo stage hunk: <leader>gu
- Reset buffer: <leader>gR
- Preview hunk: <leader>gp
- Blame line: <leader>gb
- Diff vs index: <leader>gd
- Diff vs last commit: <leader>gD
- Toggles: <leader>tb (inline blame), <leader>tD (show deleted)

### LSP

- Rename: <leader>lr
- Code action: <leader>la
- References: <leader>lR
- Implementations: <leader>li
- Definition: <leader>ld
- Jump back: <leader>lb (same as <C-t>)
- Declaration: <leader>lD
- Document symbols: <leader>ls
- Workspace symbols: <leader>lw
- Type definition: <leader>lt
- Toggle inlay hints: <leader>th
- LSP UI: <leader>lm (Mason), <leader>lI (LspInfo)

### Harpoon (quick marks)

- Add file: <leader>ha
- Menu: <leader>hm
- Remove current: <leader>hr
- Clear all: <leader>hc
- Go to 1..4: <leader>h1 … <leader>h4
- Prev/next: <leader>hp / <leader>hn

### Completion (blink.cmp)

- C-Space: Open menu (or docs if open)
- C-n / C-p or Up/Down: Select items
- C-e: Hide menu
- Enter: Accept (preset: default)
- C-k: Toggle signature help (when enabled)

### Formatting & Linting

- Format on save (Conform): gofumpt + goimports for Go; falls back to LSP if needed
- Linting (nvim-lint): golangci-lint runs on save and after leaving insert

### Statusline (lualine)

- Shows repo name, current branch, diff, filename
- Shows last editor of current file (author and relative time)
- Diagnostics, encoding, filetype, progress, location

### Misc

- <Esc>: Clear search highlight
- Shift+Up/Down: Move 6 lines (normal/insert)
- Relative line numbers enabled

### Notes

- Tailwind Tools: provides Tailwind utilities integration; conceal can be toggled with :TailwindConcealToggle
- Treesitter auto-installs parsers; Go parsers should be installed (go/gomod/gosum/gowork)
