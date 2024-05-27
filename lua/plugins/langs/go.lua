-- Section: langs, Go
-- ------------------------------------------

return {
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup({
        dap_debug = true,
        dap_debug_gui = true,
        dap_debug_keymap = true,
        dap_debug_vt = true,
        log_path = vim.fn.expand("$HOME") .. "/.local/share/nvim/go-nvim.log",
        lsp_cfg = true,
        lsp_codelens = true,
        -- lsp_diag_hdlr = true,
        lsp_on_attach = true,
        run_in_floaterm = true,
        tag_transform = true,
        test_runner = "richgo",
        verbose = true,
        verbose_tests = true,
      })
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "gopls",
      })
    end,
  },
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     gopls = {
  --       },
  --     }
  --   },
  -- },
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = function(_, opts)
  --     vim.list_extend(opts.ensure_installed, {
  --       "rust",
  --     })
  --   end,
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
