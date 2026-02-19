return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      go = { 'gofumpt', 'goimports' },
      javascript = { 'eslint_d', 'prettierd', 'prettier' },
      javascriptreact = { 'eslint_d', 'prettierd', 'prettier' },
      typescript = { 'eslint_d', 'prettierd', 'prettier' },
      typescriptreact = { 'eslint_d', 'prettierd', 'prettier' },
      json = { 'prettierd', 'prettier' },
      jsonc = { 'prettierd', 'prettier' },
      css = { 'prettierd', 'prettier' },
      scss = { 'prettierd', 'prettier' },
      html = { 'prettierd', 'prettier' },
      yaml = { 'prettierd', 'prettier' },
      markdown = { 'prettierd', 'prettier' },
    },
    format_on_save = { lsp_fallback = true, timeout_ms = 2000 },
  },
}
