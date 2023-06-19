-- Section: UI, init starter
-- ------------------------------------------

return {
  { import = 'plugins.ui.colors' },
  { import = 'plugins.ui.noice' },
  { import = 'plugins.ui.extras' },
  { import = 'plugins.ui.bufferline' },
  { import = 'plugins.ui.indents' },


  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("plugins.ui.statusline")
    end,
  },
  -- lsp symbol navigation for lualine
  {
    "SmiteshP/nvim-navic",
    lazy = true,
    init = function()
      vim.g.navic_silence = true
     --require("lazyvim.util").on_attach(function(client, buffer)
     --  if client.server_capabilities.documentSymbolProvider then
     --    require("nvim-navic").attach(client, buffer)
     --  end
     --end)
    end,
    opts = function()
      return {
        separator = " ",
        highlight = true,
        depth_limit = 5,
        -- icons = require("lazyvim.config").icons.kinds,
      }
    end,
  },
}
