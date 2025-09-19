-- Section: LSP, treesitter
-- ------------------------------------------

return {
  {
    "RRethy/nvim-treesitter-endwise",
    lazy = false,
    event = "InsertEnter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        endwise = { enable = true },
      },
    },
    ft = { "ruby" },
  },

  -- https://github.com/RRethy/nvim-treesitter-textsubjects
  -- { "RRethy/nvim-treesitter-textsubjects", lazy = true },
}
