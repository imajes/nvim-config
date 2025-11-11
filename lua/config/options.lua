-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.autoread = true -- not sure, cloned
opt.backup = false -- don't take backups
opt.hlsearch = true -- highlight all search terms
opt.relativenumber = false -- Relative line numbers
opt.showmatch = true -- show matching brackets
opt.showtabline = 2 -- https://medium.com/usevim/vim-101-decoding-tab-titles-e894fa058b0a
opt.smarttab = true -- sw at the start of the line, sts everywhere else
opt.softtabstop = 2 -- Set soft tab override
opt.sidescrolloff = 0 -- set sidescrolloff
opt.wrap = true

-- this is recommended by/from avante.nvim:
opt.laststatus = 3

-- override the python interpreter
local mise_python = vim.fn.systemlist({ "mise", "which", "python" })[1]
-- print(vim.inspect(mise_python))
vim.g.python3_host_prog = mise_python

-- switch the lsp for python to basedpyright
vim.g.lazyvim_python_lsp = "basedpyright"

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

---@param jumpCount number
local function jumpWithVirtLineDiags(jumpCount)
  pcall(vim.api.nvim_del_augroup_by_name, "jumpWithVirtLineDiags") -- prevent autocmd for repeated jumps

  vim.diagnostic.jump({ count = jumpCount })

  local initialVirtTextConf = vim.diagnostic.config().virtual_text
  vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = { current_line = true },
  })

  vim.defer_fn(function() -- deferred to not trigger by jump itself
    vim.api.nvim_create_autocmd("CursorMoved", {
      desc = "User(once): Reset diagnostics virtual lines",
      once = true,
      group = vim.api.nvim_create_augroup("jumpWithVirtLineDiags", {}),
      callback = function()
        vim.diagnostic.config({ virtual_lines = false, virtual_text = initialVirtTextConf })
      end,
    })
  end, 1)
end

vim.keymap.set("n", "ge", function()
  jumpWithVirtLineDiags(1)
end, { desc = "󰒕 Next diagnostic" })
vim.keymap.set("n", "gE", function()
  jumpWithVirtLineDiags(-1)
end, { desc = "󰒕 Prev diagnostic" })
