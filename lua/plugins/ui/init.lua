-- Section: UI, init starter
-- ------------------------------------------

return {
  { import = 'plugins.ui.colors' },
  { import = 'plugins.ui.noice' },
  { import = 'plugins.ui.extras' },
  { import = 'plugins.ui.bufferline' },
  -- { import = 'plugins.ui.statusline' },


  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("plugins.ui.statusline")
    end,
  },

}
