if vim.g.colors_name then
  vim.cmd("hi clear")
end

if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "vanta_black"

local c = {
  bg = "#0d0d0d",
  bg_alt = "#141414",
  bg_panel = "#1a1a1a",
  bg_visual = "#262626",
  border = "#3a3a3a",
  fg = "#A7938E",
  fg_soft = "#e5d9d5",
  fg_hard = "#4a4545",
  fg_muted = "#BAABA7",
  comment = "#5f5551",
  subtle = "#8e8b8c",
  white = "#ffffff",
  pop = "#dac2bb",
  dev = "#ff0000"
}

local set = vim.api.nvim_set_hl

set(0, "Normal", { fg = c.fg, bg = c.bg })
set(0, "NormalNC", { fg = c.fg, bg = c.bg })
set(0, "NormalFloat", { fg = c.fg, bg = c.bg_alt })
set(0, "FloatBorder", { fg = c.border, bg = c.bg_alt })
set(0, "SignColumn", { fg = c.subtle, bg = c.bg })
set(0, "FoldColumn", { fg = c.subtle, bg = c.bg })
set(0, "Comment", { fg = c.fg_hard, italic = true })
set(0, "CursorLine", { bg = c.bg_alt })
set(0, "CursorLineNr", { fg = c.white, bold = true })
set(0, "LineNr", { fg = c.subtle })
set(0, "Visual", { bg = c.bg_visual })
set(0, "Search", { fg = c.bg, bg = c.fg_soft })
set(0, "IncSearch", { fg = c.bg, bg = c.white })
set(0, "MatchParen", { fg = c.white, bold = true })
set(0, "VertSplit", { fg = c.border })
set(0, "WinSeparator", { fg = c.border })
set(0, "StatusLine", { fg = c.fg, bg = c.bg_panel })
set(0, "StatusLineNC", { fg = c.fg, bg = c.bg_panel })
set(0, "Pmenu", { fg = c.fg, bg = c.bg_alt })
set(0, "PmenuSel", { fg = c.bg, bg = c.fg_soft, bold = true })
set(0, "PmenuSbar", { bg = c.bg_visual })
set(0, "PmenuThumb", { bg = c.subtle })
set(0, "ColorColumn", { bg = c.bg_alt })

set(0, "Constant", { fg = c.white })
set(0, "String", { fg = c.white })
set(0, "Character", { fg = c.fg_soft })
set(0, "Number", { fg = c.fg })
set(0, "Boolean", { fg = c.fg })
set(0, "Identifier", { fg = c.fg })
set(0, "Function", { fg = c.white })
set(0, "Statement", { fg = c.pop, bold = true })
set(0, "Operator", { fg = c.subtle })
set(0, "Keyword", { fg = c.fg })
set(0, "Type", { fg = c.white })
set(0, "Special", { fg = c.pop })
set(0, "Title", { fg = c.white, bold = true })
set(0, "Directory", { fg = c.fg })

set(0, "DiagnosticError", { fg = c.fg_soft })
set(0, "DiagnosticWarn", { fg = c.fg_muted })
set(0, "DiagnosticInfo", { fg = c.fg_muted })
set(0, "DiagnosticHint", { fg = c.subtle })
set(0, "DiagnosticUnderlineError", { undercurl = true, sp = c.fg_soft })
set(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = c.fg_muted })
set(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = c.fg_muted })
set(0, "DiagnosticUnderlineHint", { undercurl = true, sp = c.subtle })

set(0, "NeoTreeNormal", { fg = c.fg, bg = c.bg })
set(0, "NeoTreeNormalNC", { fg = c.fg, bg = c.bg })
set(0, "NeoTreeEndOfBuffer", { fg = c.bg, bg = c.bg })
set(0, "NeoTreeRootName", { fg = c.white, bold = true })
set(0, "NeoTreeDirectoryName", { fg = c.fg_soft })
set(0, "NeoTreeDirectoryIcon", { fg = c.fg_muted })
set(0, "NeoTreeFileName", { fg = c.fg_soft })
set(0, "NeoTreeFileNameIcon", { fg = c.fg_muted })
set(0, "NeoTreeFileNameOpened", { fg = c.fg_muted })
set(0, "NeoTreeIndentMarker", { fg = c.border })
set(0, "NeoTreeExpander", { fg = c.fg_hard })
set(0, "NeoTreeDotfile", { fg = c.fg })
set(0, "NeoTreeGitAdded", { fg = c.fg_muted })
set(0, "NeoTreeGitDeleted", { fg = c.fg_muted })
set(0, "NeoTreeGitModified", { fg = c.fg_muted })
set(0, "NeoTreeGitConflict", { fg = c.fg_soft })
set(0, "NeoTreeGitUntracked", { fg = c.fg_muted })
set(0, "NeoTreeGitIgnored", { fg = c.fg_hard }) -- LOCKED IN - This is solid
set(0, "BufferLineFill", { fg = c.fg_hard, bg = c.bg_panel })
set(0, "BufferLineBackground", { fg = c.subtle, bg = c.bg_panel })
set(0, "BufferLineBufferVisible", { fg = c.fg_muted, bg = c.bg_alt })
set(0, "BufferLineBufferSelected", { fg = c.white, bg = c.bg_alt, bold = true })
set(0, "BufferLineIndicatorSelected", { fg = c.fg_soft, bg = c.bg_alt })
set(0, "BufferLineSeparator", { fg = c.bg_panel, bg = c.bg_panel })
set(0, "BufferLineSeparatorVisible", { fg = c.bg_alt, bg = c.bg_alt })
set(0, "BufferLineSeparatorSelected", { fg = c.bg_alt, bg = c.bg_alt })
set(0, "BufferLineModified", { fg = c.fg_muted, bg = c.bg_panel })
set(0, "BufferLineModifiedSelected", { fg = c.fg_soft, bg = c.bg_alt })
set(0, "BufferLineCloseButton", { fg = c.subtle, bg = c.bg_panel })
set(0, "BufferLineCloseButtonSelected", { fg = c.fg_soft, bg = c.bg_alt })

set(0, "LualineNormal", { fg = c.fg, bg = c.bg_panel })
set(0, "LualineInactive", { fg = c.fg_muted, bg = c.bg_panel })

set(0, "@comment", { link = "Comment" })
set(0, "@keyword", { link = "Keyword" })
set(0, "@string", { link = "String" })
set(0, "@function", { link = "Function" })
set(0, "@type", { link = "Type" })

local function force_monochrome_devicons()
  for _, group in ipairs(vim.fn.getcompletion("DevIcon", "highlight")) do
    set(0, group, { fg = c.fg_muted, bg = "NONE" })
  end
end

force_monochrome_devicons()

local group = vim.api.nvim_create_augroup("VantaBlackDevicons", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
  group = group,
  callback = force_monochrome_devicons,
})
