return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = { go = { 'gofumpt', 'goimports' } },
    format_on_save = { lsp_fallback = true, timeout_ms = 2000 },
  },
}
