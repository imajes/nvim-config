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
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     servers = {
  --       solargraph = {},
  --     },
  --   },
  -- },
  -- {
  --   "mfussenegger/nvim-dap",
  --   optional = true,
  --   dependencies = {
  --     "suketa/nvim-dap-ruby",
  --     config = function()
  --       require("dap-ruby").setup()
  --     end,
  --   },
  -- },
  -- {
  --   "nvim-neotest/neotest",
  --   optional = true,
  --   dependencies = {
  --     "olimorris/neotest-rspec",
  --   },
  --   opts = {
  --     adapters = {
  --       ["neotest-rspec"] = {
  --         -- NOTE: By default neotest-rspec uses the system wide rspec gem instead of the one through bundler
  --         -- rspec_cmd = function()
  --         --   return vim.tbl_flatten({
  --         --     "bundle",
  --         --     "exec",
  --         --     "rspec",
  --         --   })
  --         -- end,
  --       },
  --     },
  --   },
  -- },
}
