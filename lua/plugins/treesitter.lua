-- Section: LSP, treesitter
-- ------------------------------------------

return {
  {
    "RRethy/nvim-treesitter-endwise",
    ft = { "ruby" },
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
          opts.endwise = { enable = true }
        end,
      },
    },
  },

  -- https://github.com/RRethy/nvim-treesitter-textsubjects
  -- { "RRethy/nvim-treesitter-textsubjects", lazy = true },
}
