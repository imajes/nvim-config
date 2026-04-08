local M = {}

local function resolve_host_prog(mise_tool, fallback_bins)
  if vim.fn.executable("mise") == 1 then
    local resolved = vim.fn.systemlist({ "mise", "which", mise_tool })[1]
    if vim.v.shell_error == 0 and resolved and resolved ~= "" and vim.fn.executable(resolved) == 1 then
      return resolved
    end
  end

  for _, bin in ipairs(fallback_bins) do
    local resolved = vim.fn.exepath(bin)
    if resolved ~= "" then
      return resolved
    end
  end
end

local function ensure_python_host_prog()
  if vim.g.python3_host_prog and vim.g.python3_host_prog ~= "" then
    return
  end

  local python_host_prog = resolve_host_prog("python", { "python3", "python" })
  if python_host_prog then
    vim.g.python3_host_prog = python_host_prog
  end
end

local function ensure_ruby_host_prog()
  if vim.g.ruby_host_prog and vim.g.ruby_host_prog ~= "" then
    return
  end

  local ruby_host_prog = resolve_host_prog("neovim-ruby-host", { "neovim-ruby-host" })
  if ruby_host_prog then
    vim.g.ruby_host_prog = ruby_host_prog
  end
end

function M.setup_deferred()
  local group = vim.api.nvim_create_augroup("codex_host_providers", { clear = true })

  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = "python",
    once = true,
    callback = ensure_python_host_prog,
  })

  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = { "ruby", "eruby" },
    once = true,
    callback = ensure_ruby_host_prog,
  })
end

return M
