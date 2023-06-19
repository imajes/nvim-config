-- Section: Basic, github
-- ---------------------------------

return {
  {
    -- https://github.com/pwntester/octo.nvim
    'pwntester/octo.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function ()
      require("octo").setup()
    end,
    cmd = "Octo",
    lazy = true,
  },
  {
    -- https://github.com/rlch/github-notifications.nvim
    'rlch/github-notifications.nvim',
    config = [[require('config.github-notifications')]],
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    lazy = true,
  }
}
