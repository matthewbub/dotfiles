return {
  "luckasRanarison/tailwind-tools.nvim",
  name = "tailwind-tools",
  build = ":UpdateRemotePlugins",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim", -- you already have this
    "neovim/nvim-lspconfig", -- you already have this
  },
  opts = {
    server = {
      override = true, -- automatically configure tailwindcss-language-server
    },
    document_color = {
      enabled = true, -- color hints inline
      kind = "inline", -- "inline" | "foreground" | "background"
      inline_symbol = "󰝤 ",
      debounce = 200,
    },
    conceal = {
      enabled = false, -- can toggle with :TailwindConcealToggle
      symbol = "󱏿",
      highlight = {
        fg = "#38BDF8",
      },
    },
    cmp = {
      highlight = "foreground", -- works with your blink.cmp
    },
    telescope = {
      utilities = {
        callback = function(name, class) 
          -- callback when selecting utility class in telescope
        end,
      },
    },
  },
} 