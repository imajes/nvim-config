-- Section: langs, data
-- ------------------------------------------

return {
  {
    -- https://github.com/kristijanhusak/vim-dadbod-ui
    "kristijanhusak/vim-dadbod-ui",
    lazy = true,
    cmd = "DBUI",
  },
  {
    -- https://github.com/tpope/vim-dadbod
    "tpope/vim-dadbod",
    lazy = true,
    cmd = "DB",
  },
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        -- "sqlfluff",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- sqlfluff = {},
      },
    },
  },
}
