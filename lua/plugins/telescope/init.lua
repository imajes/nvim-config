-- Section: Telescope, init
-- https://github.com/nvim-telescope/telescope.nvim
-- ------------------------------------------

return {
  { import = "plugins.telescope.treesitter" },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = {
      'nvim-treesitter',
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
    },
  },
  { import = "plugins.telescope.extras" }
}
