-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.autoread = true -- reload files changed outside Neovim
opt.backup = false -- don't keep backup files
opt.hlsearch = true -- highlight all search terms
opt.relativenumber = false -- prefer absolute line numbers
opt.showmatch = true -- show matching brackets
opt.showtabline = 2 -- always show the tabline
opt.smarttab = true -- use shiftwidth at line start
opt.softtabstop = 2 -- insert/delete as if a tab were two spaces
opt.sidescrolloff = 0
opt.wrap = true

-- use a global statusline across window splits
opt.laststatus = 3

require("config.lsp_defaults")
require("config.host_providers").setup_deferred()
