-- for the neovim aspect - https://neovim.io/doc/user/lua-guide.html#_vim.opt
-- for list of options <:options>
vim.opt.relativenumber=true
vim.opt.number=true

vim.g.have_nerd_font = true

-- enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- https://stackoverflow.com/questions/1204149/smart-wrap-in-vim
vim.o.breakindent = true

-- save undo history
vim.o.undofile = true

-- case insensitive searching unless 
-- \C or one or more chararacters have cap in search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- decrease update time 
vim.o.updatetime = 250

-- decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- configure whitespace in editor 
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- https://www.youtube.com/watch?v=sA3z6gsqOuw
vim.o.inccommand = 'split'

-- show the line your on
vim.o.cursorline = true

-- minimal num of screen lines to keep above and below the curosr
vim.o.scrolloff = 10

 

-- tab settings
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- clear highlights on search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- move current line up/down (like VSCode Alt+Up/Down)
vim.keymap.set('n', '<D-j>', '<cmd>m .+1<CR>==', { desc = 'Move line down' })
vim.keymap.set('n', '<D-k>', '<cmd>m .-2<CR>==', { desc = 'Move line up' })
vim.keymap.set('i', '<D-j>', '<cmd>m .+1<CR>==gi', { desc = 'Move line down' })
vim.keymap.set('i', '<D-k>', '<cmd>m .-2<CR>==gi', { desc = 'Move line up' })
vim.keymap.set('x', '<D-Up>', ":move '<-2<CR>gv=gv", { desc = 'Move selection up' })
vim.keymap.set('x', '<D-Down>', ":move '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('x', '<C-Up>', ":move '<-2<CR>gv=gv", { desc = 'Move selection up' })
vim.keymap.set('x', '<C-Down>', ":move '>+1<CR>gv=gv", { desc = 'Move selection down' })

-- override Shift+Up/Down to move 6 lines instead of page up/down
vim.keymap.set({'n', 'i'}, '<S-Up>', '<C-o>6k', { desc = 'Move up 6 lines' })
vim.keymap.set({'n', 'i'}, '<S-Down>', '<C-o>6j', { desc = 'Move down 6 lines' })
vim.keymap.set('n', '<S-Up>', '6k', { desc = 'Move up 6 lines' })
vim.keymap.set('n', '<S-Down>', '6j', { desc = 'Move down 6 lines' })
