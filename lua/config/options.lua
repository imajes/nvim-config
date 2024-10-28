-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.bg = "dark"

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
opt.wrap = true

-- override the python interpreter
local mise_python = vim.fn.systemlist({ "mise", "which", "python" })[1]
-- print(vim.inspect(mise_python))
vim.g.python3_host_prog = mise_python

-- override the ruby interpreter
local mise_ruby = vim.fn.systemlist({ "mise", "which", "neovim-ruby-host" })[1]
-- print(vim.inspect(mise_python))
vim.g.ruby_host_prog = mise_ruby

-- vim.print("in options, for the modeline setup stuff")

-- Function to append modeline after the last line in the buffer.
local function append_modeline()
  local tabstop = vim.o.tabstop
  local shiftwidth = vim.o.shiftwidth
  local textwidth = vim.o.textwidth
  local expandtab = vim.o.expandtab
  local filetype = vim.o.filetype

  -- Create the modeline string.
  local modeline = string.format(
    " vim: set ft=%s ts=%d sw=%d tw=%d %set :",
    filetype,
    tabstop,
    shiftwidth,
    textwidth,
    expandtab and "" or "no"
  )

  -- Replace the placeholder in the comment string.
  local commentstring = vim.o.commentstring
  modeline = commentstring:gsub("%%s", modeline)

  -- Append the modeline after the last line in the buffer.
  vim.api.nvim_buf_set_lines(0, -1, -1, false, { modeline })
end

-- Map <Leader>ml to call the append_modeline function.
vim.keymap.set("n", "<Leader>ml", function()
  append_modeline()
end, { noremap = true, silent = true })
