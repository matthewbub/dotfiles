return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        numbers = "both",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        indicator = {
          icon = "▎",
          style = "icon",
        },
        buffer_close_icon = "󰅖",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 30,
        max_prefix_length = 30,
        truncate_names = true,
        tab_size = 21,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        show_duplicate_prefix = true,
        persist_buffer_sort = true,
        move_wraps_at_ends = false,
        separator_style = "slant",
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        hover = {
          enabled = true,
          delay = 200,
          reveal = {"close"},
        },
        sort_by = "insert_after_current",
        name_formatter = function(buf)
          if buf.name:match("%.md") then
            return vim.fn.fnamemodify(buf.name, ":t:r")
          end
        end,
        custom_filter = function(buf_number, buf_numbers)
          if vim.bo[buf_number].filetype ~= "oil" then
            return true
          end
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            text_align = "left",
            separator = true,
          },
        },
        groups = {
          options = {
            toggle_hidden_on_enter = true,
          },
          items = {
            {
              name = "Tests",
              highlight = {underline = true, sp = "blue"},
              priority = 2,
              icon = "",
              matcher = function(buf)
                return buf.name:match("%_test") or buf.name:match("%_spec")
              end,
            },
            {
              name = "Docs",
              highlight = {underline = true, sp = "green"},
              auto_close = false,
              matcher = function(buf)
                return buf.name:match("%.md") or buf.name:match("%.txt")
              end,
            },
          },
        },
      },
      highlights = {
        fill = {
          fg = "#1e1e2e",
          bg = "#1e1e2e",
        },
        background = {
          fg = "#6c7086",
          bg = "#1e1e2e",
        },
        buffer_visible = {
          fg = "#cdd6f4",
          bg = "#313244",
        },
        buffer_selected = {
          fg = "#cdd6f4",
          bg = "#45475a",
          bold = true,
          italic = true,
        },
        tab_selected = {
          fg = "#cdd6f4",
          bg = "#45475a",
        },
        tab_separator_selected = {
          fg = "#45475a",
          bg = "#45475a",
        },
        close_button = {
          fg = "#6c7086",
          bg = "#1e1e2e",
        },
        close_button_visible = {
          fg = "#cdd6f4",
          bg = "#313244",
        },
        close_button_selected = {
          fg = "#f38ba8",
          bg = "#45475a",
        },
        numbers = {
          fg = "#6c7086",
          bg = "#1e1e2e",
        },
        numbers_visible = {
          fg = "#cdd6f4",
          bg = "#313244",
        },
        numbers_selected = {
          fg = "#fab387",
          bg = "#45475a",
          bold = true,
        },
        indicator_selected = {
          fg = "#89b4fa",
          bg = "#45475a",
        },
        modified = {
          fg = "#f9e2af",
          bg = "#1e1e2e",
        },
        modified_visible = {
          fg = "#f9e2af",
          bg = "#313244",
        },
        modified_selected = {
          fg = "#f9e2af",
          bg = "#45475a",
        },
        duplicate_selected = {
          fg = "#cdd6f4",
          bg = "#45475a",
          italic = true,
        },
        duplicate_visible = {
          fg = "#cdd6f4",
          bg = "#313244",
          italic = true,
        },
        duplicate = {
          fg = "#6c7086",
          bg = "#1e1e2e",
          italic = true,
        },
        separator_selected = {
          fg = "#45475a",
          bg = "#45475a",
        },
        separator_visible = {
          fg = "#313244",
          bg = "#313244",
        },
        separator = {
          fg = "#1e1e2e",
          bg = "#1e1e2e",
        },
        pick_selected = {
          fg = "#f38ba8",
          bg = "#45475a",
          bold = true,
          italic = true,
        },
        pick_visible = {
          fg = "#f38ba8",
          bg = "#313244",
          bold = true,
          italic = true,
        },
        pick = {
          fg = "#f38ba8",
          bg = "#1e1e2e",
          bold = true,
          italic = true,
        },
      },
    })

    -- Keymaps for buffer navigation and management
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- Navigate buffers
    map("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
    map("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)
    map("n", "<leader>bl", ":BufferLineCycleNext<CR>", opts)
    map("n", "<leader>bh", ":BufferLineCyclePrev<CR>", opts)

    -- Move buffers
    map("n", "<leader>bmr", ":BufferLineMoveNext<CR>", opts)
    map("n", "<leader>bml", ":BufferLineMovePrev<CR>", opts)

    -- Go to buffer by number
    map("n", "<leader>b1", ":BufferLineGoToBuffer 1<CR>", opts)
    map("n", "<leader>b2", ":BufferLineGoToBuffer 2<CR>", opts)
    map("n", "<leader>b3", ":BufferLineGoToBuffer 3<CR>", opts)
    map("n", "<leader>b4", ":BufferLineGoToBuffer 4<CR>", opts)
    map("n", "<leader>b5", ":BufferLineGoToBuffer 5<CR>", opts)
    map("n", "<leader>b6", ":BufferLineGoToBuffer 6<CR>", opts)
    map("n", "<leader>b7", ":BufferLineGoToBuffer 7<CR>", opts)
    map("n", "<leader>b8", ":BufferLineGoToBuffer 8<CR>", opts)
    map("n", "<leader>b9", ":BufferLineGoToBuffer 9<CR>", opts)

    -- Buffer picking
    map("n", "<leader>bp", ":BufferLinePick<CR>", opts)
    map("n", "<leader>bpc", ":BufferLinePickClose<CR>", opts)

    -- Pin/unpin buffers
    map("n", "<leader>bP", ":BufferLineTogglePin<CR>", opts)

    -- Close buffers
    map("n", "<leader>bc", ":BufferLinePickClose<CR>", opts)
    map("n", "<leader>bco", ":BufferLineCloseOthers<CR>", opts)
    map("n", "<leader>bcr", ":BufferLineCloseRight<CR>", opts)
    map("n", "<leader>bcl", ":BufferLineCloseLeft<CR>", opts)

    -- Sort buffers
    map("n", "<leader>bse", ":BufferLineSortByExtension<CR>", opts)
    map("n", "<leader>bsd", ":BufferLineSortByDirectory<CR>", opts)
    map("n", "<leader>bst", ":BufferLineSortByTabs<CR>", opts)

    -- Group toggle
    map("n", "<leader>bgt", ":BufferLineGroupToggle<CR>", opts)
  end,
}