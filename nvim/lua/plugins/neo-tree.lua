-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    close_if_last_window = true,
    popup_border_style = 'rounded',
    enable_git_status = true,
    enable_diagnostics = true,
    default_component_configs = {
      indent = {
        with_expanders = true,
        expander_collapsed = '',
        expander_expanded = '',
      },
      icon = {
        folder_closed = '',
        folder_open = '',
        folder_empty = '',
      },
      git_status = {
        symbols = {
          added = 'A',
          modified = 'M',
          deleted = 'D',
          renamed = 'R',
          untracked = 'U',
          ignored = 'I',
          unstaged = '*',
          staged = 'S',
          conflict = '!',
        },
      },
    },
    filesystem = {
      hijack_netrw_behavior = 'open_current',
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
      use_libuv_file_watcher = true,
      window = {
        position = 'left',
        width = 34,
        mappings = {
          ['<cr>'] = 'open',
          ['o'] = 'open',
          ['l'] = 'open',
          ['h'] = 'close_node',
          ['a'] = 'add',
          ['A'] = 'add_directory',
          ['r'] = 'rename',
          ['d'] = 'delete',
          ['x'] = 'cut_to_clipboard',
          ['y'] = 'copy_to_clipboard',
          ['p'] = 'paste_from_clipboard',
          ['.'] = 'set_root',
          ['H'] = 'toggle_hidden',
          ['R'] = 'refresh',
          ['?'] = 'show_help',
          ['\\'] = 'close_window',
        },
      },
      filtered_items = {
        hide_gitignored = false,
        hide_dotfiles = false,
        always_show = { -- remains visible even if other settings would normally hide it
          ".gitignore",
        },
        always_show_by_pattern = { -- uses glob style patterns
          ".env*",
        },
      }
    },
  },
}
