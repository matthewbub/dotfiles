return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs',    
  opts = {
    ensure_installed = {
      'bash','c','diff','html','lua','luadoc','markdown','markdown_inline','query','vim','vimdoc',
      'go','gomod','gosum','gowork',
      -- Web / JS ecosystem
      'javascript','typescript','tsx','jsdoc','json','jsonc','yaml','regex',
      'css','scss',
    },
    auto_install = true,
    highlight = { enable = true, additional_vim_regex_highlighting = { 'ruby' } },
    indent = { enable = true, disable = { 'ruby' } },
  }
}
