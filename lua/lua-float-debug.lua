-- lua-float-debug.lua — Neovim floating-window debug harness (hardened)
-- Loads your helpers, turns on noisy logging, and exposes nice commands.

local M = {}

-- ---------- helper: safe require ----------
local function try_require(mod)
  local ok, val = pcall(require, mod)
  if not ok then
    vim.notify(string.format("[LuaFloat] failed to require %s: %s", mod, val), vim.log.levels.WARN)
    return nil
  end
  -- val can be a table, function, true, or nil. We pass it through.
  return val
end

-- ---------- load user's utils ----------
-- Expected locations under ~/.config/nvim/lua/utils/*.lua
local FF = try_require("utils.float_freeze") -- may export table or set _G.FloatFreeze
local FTRACE = try_require("utils.float_stack_trace") -- may export or set _G.trace_float_open_start/stop
local FLIST = try_require("utils.list_floating_windows") -- may export or set _G.list_floats
local FPIN = try_require("utils.pin_current_float") -- may export or set _G.FloatPin

-- ---------- resolve functions (robust against table/func/bool/nil) ----------
local function resolve(wanted_global_name, mod_retval, key_in_table)
  -- If module returned a table with the function
  if type(mod_retval) == "table" and type(mod_retval[key_in_table]) == "function" then
    return mod_retval[key_in_table]
  end
  -- If module itself is the function
  if type(mod_retval) == "function" then
    return mod_retval
  end
  -- If module set a global (common in ad-hoc utils)
  if type(_G[wanted_global_name]) == "function" then
    return _G[wanted_global_name]
  end
  -- Fallback: stub that warns
  return function()
    vim.notify(
      string.format("[LuaFloat] %s not found; check your utils/* modules.", wanted_global_name),
      vim.log.levels.ERROR
    )
  end
end

local LuaFloatFreeze = resolve("FloatFreeze", FF, "FloatFreeze")
local LuaFloatPin = resolve("FloatPin", FPIN, "FloatPin")
local LuaFloatListInternal = resolve("list_floats", FLIST, "list_floats")
local LuaFloatTraceStart = resolve("trace_float_open_start", FTRACE, "trace_float_open_start")
local LuaFloatTraceStopInternal = resolve("trace_float_open_stop", FTRACE, "trace_float_open_stop")

-- ---------- noisy mode on/off ----------
local verbose_log = (vim.fn.stdpath("cache") .. "/nvim-verbose.log")

function M.noise_on()
  vim.o.verbose = 15
  vim.o.verbosefile = verbose_log
  vim.o.debug = "msg"

  vim.diagnostic.config({
    underline = true,
    virtual_text = { spacing = 2, source = "if_many" },
    signs = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
      border = "single",
      focusable = true,
      source = "if_many",
      header = "Diagnostics",
      scope = "cursor",
    },
  })

  pcall(vim.lsp.set_log_level, "debug") -- stdpath('state')/lsp.log

  if not M._orig_notify then
    M._orig_notify = vim.notify
    vim.notify = function(msg, level, opts)
      local ts = os.date("%H:%M:%S")
      return M._orig_notify(string.format("[LuaFloat %s] %s", ts, tostring(msg)), level or vim.log.levels.INFO, opts)
    end
  end

  vim.notify(string.format("Noise ON. Verbose -> %s; LSP log in stdpath('state')/lsp.log", verbose_log))
end

function M.noise_off()
  vim.o.verbose = 0
  vim.o.verbosefile = ""
  vim.o.debug = ""
  if M._orig_notify then
    vim.notify = M._orig_notify
    M._orig_notify = nil
  end
  vim.notify("Noise OFF")
end

-- ---------- wrappers with extra safety ----------
local function safe_call(fn, label)
  local ok, err = pcall(fn)
  if not ok then
    vim.notify(string.format("[LuaFloat] %s error: %s", label, err), vim.log.levels.ERROR)
  end
end

-- ---------- commands ----------
vim.api.nvim_create_user_command("LuaFloatList", function()
  safe_call(LuaFloatListInternal, "LuaFloatList")
end, {})

vim.api.nvim_create_user_command("LuaFloatTrace", function()
  safe_call(LuaFloatTraceStart, "LuaFloatTrace")
  vim.notify("Tracing nvim_open_win: ON (check :messages)")
end, {})

vim.api.nvim_create_user_command("LuaFloatTraceStop", function()
  safe_call(LuaFloatTraceStopInternal, "LuaFloatTraceStop")
  vim.notify("Tracing nvim_open_win: OFF")
end, {})

vim.api.nvim_create_user_command("LuaFloatFreeze", function()
  safe_call(LuaFloatFreeze, "LuaFloatFreeze")
end, {})

vim.api.nvim_create_user_command("LuaFloatPin", function()
  safe_call(LuaFloatPin, "LuaFloatPin")
end, {})

vim.api.nvim_create_user_command("LuaFloatNoiseOn", function()
  M.noise_on()
end, {})

vim.api.nvim_create_user_command("LuaFloatNoiseOff", function()
  M.noise_off()
end, {})

-- Dump verbose autocmds for common floaty events into a scratch buffer
vim.api.nvim_create_user_command("LuaFloatVerboseAutocmds", function()
  local events = {
    "CursorHold",
    "CursorHoldI",
    "BufEnter",
    "InsertEnter",
    "DiagnosticChanged",
    "LspAttach",
    "TextChangedI",
    "CmdlineEnter",
  }
  local lines = { "VERBOSE AUTOCMDS — sources and definitions", "" }
  for _, ev in ipairs(events) do
    table.insert(lines, string.rep("-", 72))
    table.insert(lines, string.format(":verbose autocmd %s", ev))
    local out = vim.api.nvim_exec2("verbose autocmd " .. ev, { output = true }).output
    for s in (out .. "\n"):gmatch("([^\n]*)\n") do
      table.insert(lines, s)
    end
  end
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.bo[buf].filetype = "markdown"
  vim.bo[buf].bufhidden = "wipe"
  local width = math.min(120, math.max(80, math.floor(vim.o.columns * 0.9)))
  local height = math.min(40, math.max(20, math.floor(vim.o.lines * 0.7)))
  vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = math.floor((vim.o.lines - height) / 2),
    col = math.floor((vim.o.columns - width) / 2),
    border = "single",
    style = "minimal",
  })
end, {})

-- Show current status
vim.api.nvim_create_user_command("LuaFloatStatus", function()
  local get_level = (vim.lsp.get_log_level and vim.lsp.get_log_level()) or function()
    return "(n/a)"
  end
  local status = {
    "LuaFloat debug status:",
    ("  verbose: %s"):format(vim.o.verbose),
    ("  verbosefile: %s"):format(vim.o.verbosefile ~= "" and vim.o.verbosefile or "(none)"),
    ("  notify wrapped: %s"):format(M._orig_notify and "yes" or "no"),
    ("  lsp log level: %s"):format(get_level()),
  }
  vim.notify(table.concat(status, "\n"))
end, {})

-- ---------- boot banner ----------
vim.schedule(function()
  vim.notify(
    "LuaFloatDebug loaded. Commands: :LuaFloatList, :LuaFloatTrace, :LuaFloatTraceStop, :LuaFloatFreeze, :LuaFloatPin, :LuaFloatVerboseAutocmds, :LuaFloatNoiseOn, :LuaFloatNoiseOff, :LuaFloatStatus"
  )
end)

return M
