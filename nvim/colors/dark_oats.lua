if vim.g.colors_name then
  vim.cmd("hi clear")
end

if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "dark_oats"

local c = {
  bg = "#0d0d0d",
  bg_alt = "#141414",
  bg_panel = "#1a1a1a",
  bg_visual = "#262626",
  border = "#3a3a3a",
  fg = "#A7938E",
  fg_soft = "#DEDEDE",
  fg_hard = "#4a4545",
  subtle = "#8e8b8c",
  white = "#ffffff",
}

local set = vim.api.nvim_set_hl
local function apply(definitions)
  for _, item in ipairs(definitions) do
    set(0, item[1], item[2])
  end
end

apply({
  { "Normal", { fg = c.fg, bg = c.bg } },
  { "NormalNC", { fg = c.fg, bg = c.bg } },
  { "NormalFloat", { fg = c.fg, bg = c.bg_alt } },
  { "FloatBorder", { fg = c.border, bg = c.bg_alt } },
  { "SignColumn", { fg = c.subtle, bg = c.bg } },
  { "FoldColumn", { fg = c.subtle, bg = c.bg } },
  { "Comment", { fg = c.fg_hard, italic = true } },
  { "CursorLine", { bg = c.bg_alt } },
  { "CursorLineNr", { fg = c.white, bold = true } },
  { "LineNr", { fg = c.subtle } },
  { "Visual", { bg = c.bg_visual } },
  { "Search", { fg = c.bg, bg = c.fg_soft } },
  { "IncSearch", { fg = c.bg, bg = c.white } },
  { "MatchParen", { fg = c.white, bold = true } },
  { "VertSplit", { fg = c.border } },
  { "WinSeparator", { fg = c.border } },
  { "StatusLine", { fg = c.fg, bg = c.bg_panel } },
  { "StatusLineNC", { fg = c.fg, bg = c.bg_panel } },
  { "Pmenu", { fg = c.fg, bg = c.bg_alt } },
  { "PmenuSel", { fg = c.bg, bg = c.fg_soft, bold = true } },
  { "PmenuSbar", { bg = c.bg_visual } },
  { "PmenuThumb", { bg = c.subtle } },
  { "ColorColumn", { bg = c.bg_alt } },
  { "Constant", { fg = c.white } },
  { "String", { fg = c.fg_soft } },
  { "Character", { fg = c.fg_soft } },
  { "Number", { fg = c.fg } },
  { "Boolean", { fg = c.fg } },
  { "Identifier", { fg = c.fg } },
  { "Function", { fg = c.white } },
  { "Statement", { fg = c.fg, bold = true } },
  { "Operator", { fg = c.subtle } },
  { "Keyword", { fg = c.fg } },
  { "Type", { fg = c.white } },
  { "Special", { fg = c.fg } },
  { "Title", { fg = c.white, bold = true } },
  { "Directory", { fg = c.fg } },
  { "DiagnosticError", { fg = c.fg_soft } },
  { "DiagnosticWarn", { fg = c.fg } },
  { "DiagnosticInfo", { fg = c.fg } },
  { "DiagnosticHint", { fg = c.subtle } },
  { "DiagnosticUnderlineError", { undercurl = true, sp = c.fg_soft } },
  { "DiagnosticUnderlineWarn", { undercurl = true, sp = c.fg } },
  { "DiagnosticUnderlineInfo", { undercurl = true, sp = c.fg } },
  { "DiagnosticUnderlineHint", { undercurl = true, sp = c.subtle } },
  { "NeoTreeNormal", { fg = c.fg, bg = c.bg } },
  { "NeoTreeNormalNC", { fg = c.fg, bg = c.bg } },
  { "NeoTreeEndOfBuffer", { fg = c.bg, bg = c.bg } },
  { "NeoTreeRootName", { fg = c.white, bold = true } },
  { "NeoTreeDirectoryName", { fg = c.fg_soft } },
  { "NeoTreeDirectoryIcon", { fg = c.fg } },
  { "NeoTreeFileName", { fg = c.fg_soft } },
  { "NeoTreeFileNameIcon", { fg = c.fg } },
  { "NeoTreeFileNameOpened", { fg = c.fg } },
  { "NeoTreeIndentMarker", { fg = c.border } },
  { "NeoTreeExpander", { fg = c.fg_hard } },
  { "NeoTreeDotfile", { fg = c.fg } },
  { "NeoTreeGitAdded", { fg = c.fg } },
  { "NeoTreeGitDeleted", { fg = c.fg } },
  { "NeoTreeGitModified", { fg = c.fg } },
  { "NeoTreeGitConflict", { fg = c.fg } },
  { "NeoTreeGitUntracked", { fg = c.fg } },
  { "NeoTreeGitIgnored", { fg = c.fg_hard } },
  { "BufferLineFill", { fg = c.fg_hard, bg = c.bg_panel } },
  { "BufferLineBackground", { fg = c.subtle, bg = c.bg_panel } },
  { "BufferLineBufferVisible", { fg = c.fg, bg = c.bg_alt } },
  { "BufferLineBufferSelected", { fg = c.white, bg = c.bg_alt, bold = true } },
  { "BufferLineIndicatorSelected", { fg = c.fg_soft, bg = c.bg_alt } },
  { "BufferLineSeparator", { fg = c.bg_panel, bg = c.bg_panel } },
  { "BufferLineSeparatorVisible", { fg = c.bg_alt, bg = c.bg_alt } },
  { "BufferLineSeparatorSelected", { fg = c.bg_alt, bg = c.bg_alt } },
  { "BufferLineModified", { fg = c.fg, bg = c.bg_panel } },
  { "BufferLineModifiedSelected", { fg = c.fg_soft, bg = c.bg_alt } },
  { "BufferLineCloseButton", { fg = c.subtle, bg = c.bg_panel } },
  { "BufferLineCloseButtonSelected", { fg = c.fg_soft, bg = c.bg_alt } },
  { "LualineNormal", { fg = c.fg, bg = c.bg_panel } },
  { "LualineInactive", { fg = c.fg, bg = c.bg_panel } },
  { "TelescopeResultsIdentifier", { fg = c.fg_soft } },
  { "TelescopeResultsComment", { fg = c.fg_hard } },
  { "TelescopeSelection", { fg = c.white, bg = c.bg_alt, bold = true } },
  { "TelescopeSelectionCaret", { fg = c.fg_soft, bg = c.bg_alt } },
  { "TelescopeMatching", { fg = c.white, bold = true } },
  { "@comment", { link = "Comment" } },
  { "@keyword", { link = "Keyword" } },
  { "@string", { link = "String" } },
  { "@function", { link = "Function" } },
  { "@type", { link = "Type" } },
})

local function force_monochrome_devicons()
  for _, group in ipairs(vim.fn.getcompletion("DevIcon", "highlight")) do
    set(0, group, { fg = c.fg, bg = "NONE" })
  end
end

force_monochrome_devicons()

local group = vim.api.nvim_create_augroup("DarkOatsDevicons", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
  group = group,
  callback = force_monochrome_devicons,
})
