-- when using neovide, set gui options
if vim.g.neovide then
  require("config.neovide")
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.folds")

-- vim.lsp.set_log_level("debug")
