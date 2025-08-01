-- Section: langs, Rust
-- ------------------------------------------

return {
  {
    -- https://github.com/simrat39/rust-tools.nvim
    "simrat39/rust-tools.nvim",
    lazy = true,
    ft = "rust",
    config = function()
      require("rust-tools").setup({
        server = {
          on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", require("rust-tools").hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set(
              "n",
              "<Leader>a",
              require("rust-tools").code_action_group.code_action_group,
              { buffer = bufnr }
            )
          end,
        },
      })
    end,
  },
  {
    -- https://github.com/Saecki/crates.nvim
    "saecki/crates.nvim",
    lazy = true,
    event = { "BufRead Cargo.toml" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup()
    end,
  },
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = function(_, opts)
  --     vim.list_extend(opts.ensure_installed, {
  --       "rust",
  --     })
  --   end,
  -- },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "rust-analyzer",
        "rustfmt",
        "codelldb",
      })
    end,
  },
}
