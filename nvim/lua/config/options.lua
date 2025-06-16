-- for the neovim aspect - https://neovim.io/doc/user/lua-guide.html#_vim.opt
-- for list of options <:options>
vim.opt.relativenumber=true
vim.opt.number=true

vim.g.have_nerd_font = true

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)
