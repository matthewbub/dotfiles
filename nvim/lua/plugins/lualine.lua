return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local function repo_name()
      local root = (vim.b.gitsigns_status_dict or {}).root
      if not root or root == '' then
        local top = vim.fn.systemlist('git rev-parse --show-toplevel')[1] or ''
        if top == '' or vim.v.shell_error ~= 0 then return '' end
        root = top
      end
      return ' ' .. vim.fn.fnamemodify(root, ':t')
    end

    local function last_edit()
      local file = vim.fn.expand('%:p')
      if file == '' then return '' end
      local cmd = 'git -C '
        .. vim.fn.shellescape(vim.fn.fnamemodify(file, ':h'))
        .. ' log -n 1 --format=%an\\ (%ar) -- '
        .. vim.fn.shellescape(file)
      local line = vim.fn.systemlist(cmd)[1] or ''
      if line == '' or vim.v.shell_error ~= 0 then return '' end
      return ' ' .. line
    end

    require('lualine').setup({
      options = {
        theme = {
          normal = { a = { fg = "#0d0d0d", bg = "#ececec", gui = "bold" }, b = { fg = "#ececec", bg = "#1a1a1a" }, c = { fg = "#cecece", bg = "#141414" } },
          insert = { a = { fg = "#0d0d0d", bg = "#cecece", gui = "bold" }, b = { fg = "#ececec", bg = "#1a1a1a" }, c = { fg = "#cecece", bg = "#141414" } },
          visual = { a = { fg = "#0d0d0d", bg = "#cecece", gui = "bold" }, b = { fg = "#ececec", bg = "#1a1a1a" }, c = { fg = "#cecece", bg = "#141414" } },
          replace = { a = { fg = "#0d0d0d", bg = "#cecece", gui = "bold" }, b = { fg = "#ececec", bg = "#1a1a1a" }, c = { fg = "#cecece", bg = "#141414" } },
          command = { a = { fg = "#0d0d0d", bg = "#cecece", gui = "bold" }, b = { fg = "#ececec", bg = "#1a1a1a" }, c = { fg = "#cecece", bg = "#141414" } },
          inactive = { a = { fg = "#9b9b9b", bg = "#141414" }, b = { fg = "#9b9b9b", bg = "#141414" }, c = { fg = "#9b9b9b", bg = "#141414" } },
        },
        globalstatus = true,
        icons_enabled = true,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff' }, -- branch uses git, diff shows counts
        lualine_c = { repo_name, { 'filename', path = 1, symbols = { modified = '●' } } },
        lualine_x = { last_edit, 'diagnostics', 'encoding', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    })
  end,
}
