-- Section: UI, extras, smalls, etc
-- ------------------------------------------

return {
  {
    -- https://github.com/nvim-zh/colorful-winsep.nvim
    "nvim-zh/colorful-winsep.nvim",
    config = true,
    opts = {
      -- highlight for Window separator
      highlight = {
        bg = "#16161E",
        fg = "#1F3442",
      },
      -- timer refresh rate
      interval = 30,
      -- This plugin will not be activated for filetype in the following table.
      no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest", "NvimTree" },
      -- Symbols for separator lines, the order: horizontal, vertical, top left, top right, bottom left, bottom right.
      symbols = { "━", "┃", "┏", "┓", "┗", "┛" },
      close_event = function()
        -- Executed after closing the window separator
      end,
      create_event = function()
        -- Executed after creating the window separator
      end,
    },
    event = { "WinNew" },
  },

  -- better vim.ui
  {
    "stevearc/dressing.nvim",
    lazy = true,
    init = function()
      -----@diagnostic disable-next-line: duplicate-set-field
      --vim.ui.select = function(...)
      --  require("lazy").load({ plugins = { "dressing.nvim" } })
      --  return vim.ui.select(...)
      --end
      -----@diagnostic disable-next-line: duplicate-set-field
      --vim.ui.input = function(...)
      --  require("lazy").load({ plugins = { "dressing.nvim" } })
      --  return vim.ui.input(...)
      --end
    end,
  },

  -- Better `vim.notify()`
  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "<leader>un",
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end,
        desc = "Dismiss all Notifications",
      },
    },
    opts = {
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
    },
    -- init = function()
    --   -- when noice is not enabled, install notify on VeryLazy
    --   local Util = require("lazyvim.util")
    --   if not Util.has("noice.nvim") then
    --     Util.on_very_lazy(function()
    --       vim.notify = require("notify")
    --     end)
    --   end
    -- end,
  },

  {
    "folke/which-key.nvim",
    -- opts = function(_, opts)
    --   if require("lazyvim.util").has("noice.nvim") then
    --     opts.defaults["<leader>sn"] = { name = "+noice" }
    --   end
    -- end,
  },

  -- ui components
  { "MunifTanjim/nui.nvim", lazy = true },


  -- {
  --   -- https://github.com/romgrk/kirby.nvim
  --   'romgrk/kirby.nvim',
  --   dependencies = {
  --     { 'romgrk/fzy-lua-native', build = 'make' },
  --     { 'romgrk/kui.nvim' },
  --     { 'nvim-tree/nvim-web-devicons' },
  --     { 'nvim-lua/plenary.nvim' },
  --   },
  -- },

}
