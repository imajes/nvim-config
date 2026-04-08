local dashboard_width = 65
local dashboard_pane_gap = 5
local dashboard_layout_width = dashboard_width * 2 + dashboard_pane_gap
local dashboard_header_clearance = 15
local header_terminal_height = 14
local header_terminal_width = dashboard_layout_width + 4
local left_pane_guard_lines = 0
local header_font_dir = "/Users/james/src/fonts/figlet-fonts"
local header_phrase = " hack the planet "
local show_git_status = false

local function in_git_repo()
  return Snacks.git.get_root() ~= nil
end

local function has_executable(cmd)
  return vim.fn.executable(cmd) == 1
end

local function use_terminal_header()
  return has_executable("toilet") and has_executable("lolcrab") and vim.fn.isdirectory(header_font_dir) == 1
end

local function header_gradient()
  return vim.o.background == "dark" and "magma" or "cool"
end

local function strwidth(text)
  return vim.api.nvim_strwidth(text)
end

local function border_fill(width, segments)
  local used = 0
  for _, segment in ipairs(segments) do
    used = used + strwidth(segment[1])
  end
  return math.max(0, width - used)
end

local function panel_top(title, icon, width)
  local segments = {
    { "╭─ ", hl = "DashboardPanelBorder" },
    { icon .. " ", hl = "SnacksDashboardIcon" },
    { title, hl = "DashboardPanelTitle" },
    { " ", hl = "DashboardPanelBorder" },
  }
  segments[#segments + 1] = { string.rep("─", border_fill(width - 1, segments)), hl = "DashboardPanelBorder" }
  segments[#segments + 1] = { "╮", hl = "DashboardPanelBorder" }
  return { text = segments }
end

local function panel_bottom(width)
  return {
    text = {
      { "╰" .. string.rep("─", width - 2) .. "╯", hl = "DashboardPanelBorder" },
    },
  }
end

local function spacer(lines)
  return { text = { { ("\n"):rep((lines or 1) - 1) } } }
end

local function dashboard_panel(pane, title, icon, body)
  return {
    pane = pane,
    panel_top(title, icon, dashboard_width),
    { text = { { "\n" } } },
    body,
    panel_bottom(dashboard_width),
  }
end

local function git_panel()
  if not show_git_status then
    return nil
  end

  return dashboard_panel(1, "Git Status", "", {
    section = false,
    enabled = in_git_repo,
    git_status_section(5),
    padding = 1,
  })
end

local dashboard_keys = {
  { icon = "", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
  { icon = "", key = "n", desc = "New File", action = ":ene | startinsert" },
  { icon = "", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
  { icon = "", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
  {
    icon = "",
    key = "c",
    desc = "Config",
    action = ":lua Snacks.dashboard.pick('files', { cwd = vim.fn.stdpath('config') })",
  },
  { icon = "󰒲", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
  { icon = "", key = "q", desc = "Quit", action = ":qa" },
}

local dashboard_header = [[
    █████                         █████          █████    █████                            ████                                 █████
   ▒▒███                         ▒▒███          ▒▒███    ▒▒███                            ▒▒███                                ▒▒███
    ▒███████    ██████    ██████  ▒███ █████    ███████   ▒███████    ██████     ████████  ▒███   ██████   ████████    ██████  ███████
    ▒███▒▒███  ▒▒▒▒▒███  ███▒▒███ ▒███▒▒███    ▒▒▒███▒    ▒███▒▒███  ███▒▒███   ▒▒███▒▒███ ▒███  ▒▒▒▒▒███ ▒▒███▒▒███  ███▒▒███▒▒▒███▒
    ▒███ ▒███   ███████ ▒███ ▒▒▒  ▒██████▒       ▒███     ▒███ ▒███ ▒███████     ▒███ ▒███ ▒███   ███████  ▒███ ▒███ ▒███████   ▒███
    ▒███ ▒███  ███▒▒███ ▒███  ███ ▒███▒▒███      ▒███ ███ ▒███ ▒███ ▒███▒▒▒      ▒███ ▒███ ▒███  ███▒▒███  ▒███ ▒███ ▒███▒▒▒    ▒███ ███
    ████ █████▒▒████████▒▒██████  ████ █████     ▒▒█████  ████ █████▒▒██████     ▒███████  █████▒▒████████ ████ █████▒▒██████   ▒▒█████
   ▒▒▒▒ ▒▒▒▒▒  ▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒  ▒▒▒▒ ▒▒▒▒▒       ▒▒▒▒▒  ▒▒▒▒ ▒▒▒▒▒  ▒▒▒▒▒▒      ▒███▒▒▒  ▒▒▒▒▒  ▒▒▒▒▒▒▒▒ ▒▒▒▒ ▒▒▒▒▒  ▒▒▒▒▒▒     ▒▒▒▒▒
                                                                                 ▒███
                                                                                 █████
                                                                                ▒▒▒▒▒
]]

local function header_command()
  local toilet_cmd = table.concat({
    "toilet",
    "-d",
    vim.fn.shellescape(header_font_dir),
    "-w",
    "220",
    "-f",
    "rebel",
    vim.fn.shellescape(header_phrase),
  }, " ")

  local lolcrab_cmd = table.concat({
    "lolcrab",
    "-g",
    header_gradient(),
    "--animate",
    "--duration",
    "3",
    "--speed",
    "90",
  }, " ")

  return table.concat({
    "print '\n' && ",
    toilet_cmd,
    "|",
    lolcrab_cmd,
    ";",
    "sleep 3600",
  }, " ")
end

local function header_section()
  return function()
    if use_terminal_header() then
      return {
        {
          section = "terminal",
          cmd = header_command(),
          height = header_terminal_height,
          width = header_terminal_width,
          ttl = 0,
        },
        spacer(dashboard_header_clearance - header_terminal_height),
      }
    end

    return {
      {
        align = "center",
        text = {
          { dashboard_header, hl = "DashboardHeaderText", align = "center" },
        },
        padding = 2,
      },
      spacer(dashboard_header_clearance - 8),
    }
  end
end

local function footer_section()
  return {
    section = "startup",
    icon = "  ",
    align = "center",
    padding = { 0, 1 },
  }
end

local function git_status_highlight(code)
  if code == "??" then
    return "DashboardGitWarn"
  end
  if code:find("D", 1, true) then
    return "DashboardGitDelete"
  end
  if code:find("R", 1, true) or code:find("A", 1, true) then
    return "DashboardGitAdd"
  end
  if code:find("M", 1, true) then
    return "DashboardGitChange"
  end
  return "DashboardGitMeta"
end

local function shorten_git_path(path, width)
  if strwidth(path) <= width then
    return path
  end
  return vim.fn.pathshorten(path)
end

local function git_status_section(limit)
  return function()
    if not in_git_repo() then
      return {}
    end

    local lines = vim.fn.systemlist("git status --short --branch --renames")
    if vim.v.shell_error ~= 0 then
      return {
        {
          text = {
            { "   git status unavailable", hl = "DashboardGitWarn" },
          },
          padding = 1,
        },
      }
    end

    local items = {}
    local branch = table.remove(lines, 1)
    if branch then
      items[#items + 1] = {
        text = {
          { "   " .. branch:gsub("^##%s*", ""), hl = "DashboardGitMeta" },
        },
        padding = 1,
      }
    end

    if #lines == 0 then
      items[#items + 1] = {
        text = {
          { "   working tree clean", hl = "DashboardGitClean" },
        },
      }
      return items
    end

    for _, line in ipairs(vim.list_slice(lines, 1, limit or 6)) do
      local code = line:sub(1, 2)
      local path = vim.trim(line:sub(4))
      local label = vim.trim(code)
      items[#items + 1] = {
        text = {
          { "   " },
          { string.format("%-2s", label ~= "" and label or "·"), hl = git_status_highlight(code) },
          { "  ", hl = "DashboardPanelBorder" },
          { shorten_git_path(path, dashboard_width - 10), hl = "SnacksDashboardDesc" },
        },
      }
    end

    return items
  end
end

local function set_dashboard_highlights()
  local is_dark = vim.o.background == "dark"

  vim.api.nvim_set_hl(0, "DashboardPanelBorder", {
    fg = is_dark and "#f5a97f" or "#0f766e",
    bold = true,
  })
  vim.api.nvim_set_hl(0, "DashboardPanelTitle", {
    fg = is_dark and "#f9e2af" or "#9a3412",
    bold = true,
  })
  vim.api.nvim_set_hl(0, "DashboardHeaderText", {
    fg = is_dark and "#cdd6f4" or "#1f2937",
    bold = true,
  })
  vim.api.nvim_set_hl(0, "SnacksDashboardFooter", {
    fg = is_dark and "#bac2de" or "#334155",
  })
  vim.api.nvim_set_hl(0, "SnacksDashboardSpecial", {
    fg = is_dark and "#89dceb" or "#0369a1",
    bold = true,
  })
  vim.api.nvim_set_hl(0, "SnacksDashboardKey", {
    fg = is_dark and "#a6e3a1" or "#15803d",
    bold = true,
  })
  vim.api.nvim_set_hl(0, "SnacksDashboardIcon", {
    fg = is_dark and "#f5c2e7" or "#c2410c",
    bold = true,
  })
  vim.api.nvim_set_hl(0, "SnacksDashboardDesc", {
    fg = is_dark and "#cdd6f4" or "#1e293b",
  })
  vim.api.nvim_set_hl(0, "SnacksDashboardFile", {
    fg = is_dark and "#cdd6f4" or "#0f172a",
  })
  vim.api.nvim_set_hl(0, "SnacksDashboardDir", {
    fg = is_dark and "#7dc4e4" or "#475569",
  })
  vim.api.nvim_set_hl(0, "DashboardGitMeta", {
    fg = is_dark and "#94e2d5" or "#0369a1",
    bold = true,
  })
  vim.api.nvim_set_hl(0, "DashboardGitAdd", {
    fg = is_dark and "#a6e3a1" or "#15803d",
    bold = true,
  })
  vim.api.nvim_set_hl(0, "DashboardGitChange", {
    fg = is_dark and "#f9e2af" or "#b45309",
    bold = true,
  })
  vim.api.nvim_set_hl(0, "DashboardGitDelete", {
    fg = is_dark and "#f38ba8" or "#be123c",
    bold = true,
  })
  vim.api.nvim_set_hl(0, "DashboardGitWarn", {
    fg = is_dark and "#fab387" or "#c2410c",
    bold = true,
  })
  vim.api.nvim_set_hl(0, "DashboardGitClean", {
    fg = is_dark and "#a6adc8" or "#475569",
    italic = true,
  })
end

return {
  "folke/snacks.nvim",
  init = function()
    local group = vim.api.nvim_create_augroup("codex_dashboard_highlights", { clear = true })
    vim.api.nvim_create_autocmd("ColorScheme", {
      group = group,
      callback = set_dashboard_highlights,
    })
    vim.schedule(set_dashboard_highlights)
  end,
  ---@type snacks.Config
  opts = {
    dashboard = {
      width = dashboard_width,
      row = nil, -- let Snacks vertically center the dashboard
      col = nil, -- dashboard position. nil for center
      pane_gap = dashboard_pane_gap, -- empty columns between vertical panes
      autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence

      -- These settings are used by some built-in sections
      preset = {
        -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
        ---@type fun(cmd:string, opts:table)|nil
        pick = nil,
        -- Used by the `keys` section to show keymaps.
        -- Set your custom keymaps here.
        -- When using a function, the `items` argument are the default keymaps.
        ---@type snacks.dashboard.Item[]
        keys = dashboard_keys,
        header = dashboard_header,
      },

      formats = {
        key = function(item)
          return {
            { "‹", hl = "special" },
            { item.key, hl = "key" },
            { "›", hl = "special" },
          }
        end,
      },

      sections = {
        header_section(),
        { pane = 2, text = { { ("\n"):rep(dashboard_header_clearance - 1) } } },
        dashboard_panel(1, "Keys / Links", "󰍉 ", {
          section = "keys",
          indent = 3,
          gap = 1,
          padding = 1,
        }),
        { pane = 1, text = { { ("\n"):rep(left_pane_guard_lines) } } },
        dashboard_panel(2, "Recent Files", " ", {
          section = "recent_files",
          limit = 5,
          indent = 3,
          padding = 1,
        }),
        dashboard_panel(2, "Projects", " ", {
          section = "projects",
          limit = 4,
          indent = 3,
          padding = 1,
        }),
        footer_section(),
      },
    },
  },
}
