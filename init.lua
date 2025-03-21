-- when using neovide, set gui options
if vim.g.neovide then
  require("config.neovide")
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- set the lsp log level to trace for lsp
-- vim.lsp.set_log_level("trace")
-- require("vim.lsp.log").set_format_func(vim.inspect)

-- vim.print("cache stdpath..")
-- vim.print(vim.fn.stdpath("cache"))
vim.env.UFO_LOG = "TRACE"
