---@param jump_count number
local function jump_with_virtual_lines(jump_count)
  pcall(vim.api.nvim_del_augroup_by_name, "jumpWithVirtLineDiags")

  vim.diagnostic.jump({ count = jump_count })

  local initial_virtual_text = vim.diagnostic.config().virtual_text
  vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = { current_line = true },
  })

  vim.defer_fn(function()
    vim.api.nvim_create_autocmd("CursorMoved", {
      desc = "User(once): Reset diagnostics virtual lines",
      once = true,
      group = vim.api.nvim_create_augroup("jumpWithVirtLineDiags", {}),
      callback = function()
        vim.diagnostic.config({ virtual_lines = false, virtual_text = initial_virtual_text })
      end,
    })
  end, 1)
end

vim.keymap.set("n", "ge", function()
  jump_with_virtual_lines(1)
end, { desc = "󰒕 Next diagnostic" })

vim.keymap.set("n", "gE", function()
  jump_with_virtual_lines(-1)
end, { desc = "󰒕 Prev diagnostic" })
