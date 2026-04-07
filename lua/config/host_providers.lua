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

-- prefer mise-managed providers, but tolerate environments where the tool is absent
local python_host_prog = resolve_host_prog("python", { "python3", "python" })
if python_host_prog then
  vim.g.python3_host_prog = python_host_prog
end

vim.g.lazyvim_python_lsp = "basedpyright"

local ruby_host_prog = resolve_host_prog("neovim-ruby-host", { "neovim-ruby-host" })
if ruby_host_prog then
  vim.g.ruby_host_prog = ruby_host_prog
end
