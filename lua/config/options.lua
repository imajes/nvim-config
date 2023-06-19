-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.bg = "light"

opt.autoread = true -- not sure, cloned
opt.backup = false -- don't take backups
opt.hlsearch = true -- highlight all search terms
opt.relativenumber = false -- Relative line numbers
opt.showmatch = true -- show matching brackets
opt.showtabline = 2 -- https://medium.com/usevim/vim-101-decoding-tab-titles-e894fa058b0a
opt.smarttab = true -- sw at the start of the line, sts everywhere else
opt.softtabstop = 2 -- Set soft tab override
opt.sidescrolloff = 0 -- set sidescrolloff

opt.foldcolumn = "1" -- '0' is not bad
opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.foldenable = true
