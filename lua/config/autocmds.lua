-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
local group = vim.api.nvim_create_augroup("codex_local_autocmds", { clear = true })

local whitespace_trim_exclusions = {
  diff = true,
  gitcommit = true,
  markdown = true,
}

local function is_real_file_buffer(buf)
  return vim.bo[buf].buflisted
    and vim.bo[buf].buftype == ""
    and vim.bo[buf].modifiable
    and not vim.bo[buf].readonly
    and not vim.bo[buf].binary
    and vim.api.nvim_buf_get_name(buf) ~= ""
end

-- Automatically save normal modified file buffers when Neovim loses focus.
vim.api.nvim_create_autocmd("FocusLost", {
  group = group,
  callback = function()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if is_real_file_buffer(buf) and vim.bo[buf].modified then
        vim.api.nvim_buf_call(buf, function()
          vim.cmd("silent! update")
        end)
      end
    end
  end,
})

-- " lose extraneous whitespace at end of lines
-- cnoreabbrev  ws %s/\s\+$//g
-- map <Leader>fm :g/^\s*$/,/\S/-j<Bar>%s/\s\+$//<CR>
--
-- " squash tabs down; (better is :retab)
-- cnoreabbrev  squash %s/\s\{4\}/  /g

-- On save, trim trailing whitespace where it is typically accidental.
vim.api.nvim_create_autocmd("BufWritePre", {
  group = group,
  callback = function(event)
    local buf = event.buf
    if not is_real_file_buffer(buf) or whitespace_trim_exclusions[vim.bo[buf].filetype] then
      return
    end

    local view = vim.fn.winsaveview()
    vim.api.nvim_buf_call(buf, function()
      vim.cmd([[silent! keepjumps keeppatterns %s/\s\+$//e]])
    end)
    vim.fn.winrestview(view)
  end,
})

-- local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*.go",
--   callback = function()
--     require("go.format").goimport()
--   end,
--   group = format_sync_grp,
-- })
