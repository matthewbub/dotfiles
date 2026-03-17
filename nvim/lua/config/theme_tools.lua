local M = {}

local color_keys = { "fg", "bg", "sp" }
local style_keys = {
  "bold",
  "italic",
  "underline",
  "undercurl",
  "underdouble",
  "underdotted",
  "underdashed",
  "strikethrough",
  "reverse",
  "standout",
  "nocombine",
}

local core_groups = {
  ColorColumn = true,
  Comment = true,
  Constant = true,
  CursorLine = true,
  CursorLineNr = true,
  Directory = true,
  FloatBorder = true,
  FoldColumn = true,
  Function = true,
  Identifier = true,
  IncSearch = true,
  Keyword = true,
  LineNr = true,
  MatchParen = true,
  Normal = true,
  NormalFloat = true,
  NormalNC = true,
  Number = true,
  Operator = true,
  Pmenu = true,
  PmenuSbar = true,
  PmenuSel = true,
  PmenuThumb = true,
  Search = true,
  SignColumn = true,
  Special = true,
  Statement = true,
  StatusLine = true,
  StatusLineNC = true,
  String = true,
  Title = true,
  Type = true,
  VertSplit = true,
  Visual = true,
  WinSeparator = true,
}

local plugin_prefixes = {
  { prefix = "@", label = "Treesitter captures" },
  { prefix = "Diagnostic", label = "Diagnostics" },
  { prefix = "NeoTree", label = "Neo-tree" },
  { prefix = "BufferLine", label = "Bufferline" },
  { prefix = "Telescope", label = "Telescope" },
  { prefix = "Lualine", label = "Lualine" },
  { prefix = "DevIcon", label = "Devicons" },
  { prefix = "MiniIcons", label = "Mini icons" },
  { prefix = "Trouble", label = "Trouble" },
  { prefix = "BlinkCmp", label = "Blink cmp" },
  { prefix = "Tailwind", label = "Tailwind tools" },
}

local function to_hex(value)
  if type(value) ~= "number" then
    return "NONE"
  end

  return string.format("#%06x", value)
end

local function theme_file()
  local colors_name = vim.g.colors_name or "dark_oats"
  return vim.fn.stdpath("config") .. "/colors/" .. colors_name .. ".lua"
end

local function read_theme_file()
  local path = theme_file()

  if vim.fn.filereadable(path) == 0 then
    return path, {}
  end

  return path, vim.fn.readfile(path)
end

local function parse_palette(lines)
  local inside_palette = false
  local rows = {}

  for _, line in ipairs(lines) do
    if line:match("^local c = {") then
      inside_palette = true
    elseif inside_palette and line:match("^}") then
      break
    elseif inside_palette then
      local name, value = line:match('^%s*([%w_]+)%s*=%s*"?(#%x%x%x%x%x%x)"?,?')
      if name and value then
        rows[#rows + 1] = { name = name, value = value }
      end
    end
  end

  return rows
end

local function parse_defined_groups(lines)
  local rows = {}

  for _, line in ipairs(lines) do
    local group = line:match('set%(%s*0%s*,%s*"([^"]+)"')
      or line:match('^%s*{%s*"([^"]+)"%s*,')
    if group then
      rows[#rows + 1] = group
    end
  end

  table.sort(rows)
  return rows
end

local function group_category(name)
  if core_groups[name] then
    return "Core editor"
  end

  for _, item in ipairs(plugin_prefixes) do
    if name:sub(1, #item.prefix) == item.prefix then
      return item.label
    end
  end

  return "Other highlights"
end

local function group_link(name)
  local ok, raw = pcall(vim.api.nvim_get_hl, 0, { name = name, link = true })
  if not ok or type(raw) ~= "table" then
    return nil
  end

  return raw.link
end

local function group_spec(name)
  local ok, spec = pcall(vim.api.nvim_get_hl, 0, { name = name, link = false })
  if not ok then
    return nil
  end

  return spec
end

local function styles_for(spec)
  local styles = {}

  for _, key in ipairs(style_keys) do
    if spec[key] then
      styles[#styles + 1] = key
    end
  end

  if spec.blend then
    styles[#styles + 1] = "blend=" .. spec.blend
  end

  return styles
end

local function snapshot_rows(filter)
  local rows = {}
  local groups = vim.fn.getcompletion("", "highlight")

  table.sort(groups)

  for _, name in ipairs(groups) do
    if not filter or name:lower():find(filter:lower(), 1, true) then
      local spec = group_spec(name) or {}
      local link = group_link(name)

      rows[#rows + 1] = {
        name = name,
        category = group_category(name),
        link = link,
        fg = to_hex(spec.fg),
        bg = to_hex(spec.bg),
        sp = to_hex(spec.sp),
        styles = styles_for(spec),
      }
    end
  end

  return rows
end

local function ensure_snapshot_dir()
  local dir = vim.fn.stdpath("config") .. "/theme-snapshots"
  vim.fn.mkdir(dir, "p")
  return dir
end

local function scratch_buffer(lines)
  vim.cmd("tabnew")

  local buf = vim.api.nvim_get_current_buf()
  vim.bo[buf].buftype = "nofile"
  vim.bo[buf].bufhidden = "wipe"
  vim.bo[buf].swapfile = false
  vim.bo[buf].modifiable = true
  vim.bo[buf].filetype = "markdown"
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.bo[buf].modifiable = false
  vim.bo[buf].modified = false
end

local function inspect_lines(filter)
  local path, theme_lines = read_theme_file()
  local palette = parse_palette(theme_lines)
  local defined_groups = parse_defined_groups(theme_lines)
  local rows = snapshot_rows(filter)
  local counts = {}
  local lines = {}

  for _, row in ipairs(rows) do
    counts[row.category] = (counts[row.category] or 0) + 1
  end

  lines[#lines + 1] = "# Theme Inspector"
  lines[#lines + 1] = ""
  lines[#lines + 1] = "- Colorscheme file: " .. path
  lines[#lines + 1] = "- Active colorscheme: " .. (vim.g.colors_name or "unknown")
  lines[#lines + 1] = "- Color-bearing keys: " .. table.concat(color_keys, ", ")
  lines[#lines + 1] = "- Style flags you may care about: " .. table.concat(style_keys, ", ")
  lines[#lines + 1] = "- Runtime highlight groups found: " .. tostring(#rows)
  lines[#lines + 1] = "- Groups explicitly set in theme file: " .. tostring(#defined_groups)

  if filter and filter ~= "" then
    lines[#lines + 1] = "- Filter: " .. filter
  end

  lines[#lines + 1] = ""
  lines[#lines + 1] = "## Palette Tokens"
  lines[#lines + 1] = ""

  for _, item in ipairs(palette) do
    lines[#lines + 1] = string.format("- `%s` = `%s`", item.name, item.value)
  end

  lines[#lines + 1] = ""
  lines[#lines + 1] = "## Runtime Categories"
  lines[#lines + 1] = ""

  local sorted_categories = vim.tbl_keys(counts)
  table.sort(sorted_categories)

  for _, category in ipairs(sorted_categories) do
    lines[#lines + 1] = string.format("- %s: %d", category, counts[category])
  end

  lines[#lines + 1] = ""
  lines[#lines + 1] = "## Explicit Groups In Theme File"
  lines[#lines + 1] = ""

  for _, name in ipairs(defined_groups) do
    lines[#lines + 1] = "- `" .. name .. "`"
  end

  lines[#lines + 1] = ""
  lines[#lines + 1] = "## Runtime Highlight Map"
  lines[#lines + 1] = ""
  lines[#lines + 1] = "| Group | Category | fg | bg | sp | link | styles |"
  lines[#lines + 1] = "| --- | --- | --- | --- | --- | --- | --- |"

  for _, row in ipairs(rows) do
    local styles = #row.styles > 0 and table.concat(row.styles, ", ") or "-"
    lines[#lines + 1] = string.format(
      "| `%s` | %s | `%s` | `%s` | `%s` | `%s` | %s |",
      row.name,
      row.category,
      row.fg,
      row.bg,
      row.sp,
      row.link or "-",
      styles
    )
  end

  return lines
end

local function write_snapshot(path, filter)
  local rows = snapshot_rows(filter)
  local payload = {
    colorscheme = vim.g.colors_name or "unknown",
    generated_at = os.date("!%Y-%m-%dT%H:%M:%SZ"),
    filter = filter or "",
    highlights = rows,
  }

  vim.fn.writefile(vim.split(vim.json.encode(payload), "\n"), path)
end

function M.open_inspector(filter)
  scratch_buffer(inspect_lines(filter))
end

function M.write_snapshot(file_arg, filter)
  local path = file_arg

  if not path or path == "" then
    local dir = ensure_snapshot_dir()
    local stamp = os.date("%Y%m%d-%H%M%S")
    path = string.format("%s/%s-%s.json", dir, vim.g.colors_name or "theme", stamp)
  elseif not path:match("^/") then
    path = vim.fn.stdpath("config") .. "/" .. path
  end

  write_snapshot(path, filter)
  vim.notify("Theme snapshot written to " .. path, vim.log.levels.INFO)
end

function M.setup()
  vim.api.nvim_create_user_command("ThemeInspect", function(opts)
    M.open_inspector(opts.args ~= "" and opts.args or nil)
  end, {
    nargs = "?",
    desc = "Open a scratch buffer with the active highlight map",
  })

  vim.api.nvim_create_user_command("ThemeSnapshot", function(opts)
    M.write_snapshot(opts.args ~= "" and opts.args or nil)
  end, {
    nargs = "?",
    desc = "Write the active highlight map to a JSON snapshot",
  })
end

return M
