-- Section: UI, Color Schemes
-- ---------------------------------

return {
  -- {
  --   "echasnovski/mini.hues",
  --   config = function()
  --     require("mini.hues").setup({ background = "#09182E", foreground = "#dcc9db", saturation = "high", n_hues = 6 })
  --   end,
  --   lazy = false,
  -- },
  --

  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- if vim.g.neovide then
      --   vim.cmd([[colorscheme nightfox]])
      -- end
    end,
  },

  {
    "talha-akram/noctis.nvim",
    lazy = false,
    priority = 10000,
    config = function()
      -- if not vim.g.neovide then
      --   vim.cmd([[colorscheme noctis]])
      -- end
    end,
  },

  {
    "loctvl842/monokai-pro.nvim",
    config = function()
      local monokai = require("monokai-pro")
      monokai.setup({
        transparent_background = false,
        devicons = true,
        filter = "spectrum",
        day_night = {
          enable = false,
          day_filter = "classic",
          night_filter = "octagon",
        },
        inc_search = "background",
        background_clear = {},
        plugins = {
          bufferline = {
            underline_selected = true,
            underline_visible = false,
            bold = false,
          },
          indent_blankline = {
            context_highlight = "pro",
            context_start_underline = true,
          },
        },
      })
      monokai.load()
    end,
    lazy = true,
  },

  {
    "ray-x/aurora",
    lazy = false,
    init = function()
      vim.g.aurora_italic = 1
      vim.g.aurora_transparent = 1
      vim.g.aurora_bold = 1
    end,
  },

  {
    "JoosepAlviste/palenightfall.nvim",
    config = function()
      -- require("palenightfall").setup()
    end,
    lazy = true,
  },

  -- {
  --   "noorwachid/nvim-nightsky",
  --   config = function()
  --     vim.cmd("colorscheme nightsky")
  --   end,
  --   lazy = false,
  -- },

  -- {
  --   "AlphaTechnolog/pywal.nvim",
  --   config = function()
  --     require("pywal").setup()
  --   end,
  --   lazy = false,
  -- },

  {
    "sainnhe/gruvbox-material",
    config = function()
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_background = "hard"
    end,
    lazy = true,
  },
  -- {
  --   "nekonako/xresources-nvim",
  --   config = function()
  --     require("xresources")
  --   end,
  --   lazy = false,
  -- },
  {
    "folke/tokyonight.nvim",
    opts = { style = "moon" },
    lazy = false,
  },

  {
    "sainnhe/sonokai",
    config = function()
      vim.g.sonokai_style = "atlantis"
      vim.g.sonokai_better_performance = 1
    end,
    lazy = false,
  },

  {
    "sainnhe/everforest",
    config = function()
      vim.g.everforest_background = "light"
      vim.g.everforest_better_performance = 1
    end,
    lazy = false,
  },

  {
    "sainnhe/edge",
    config = function()
      vim.g.edge_style = "neon"
      vim.g.edge_better_performance = 1
    end,
    lazy = true,
  },

  { "LunarVim/synthwave84.nvim", lazy = false },
  { "catppuccin/nvim", name = "catppuccin", lazy = false },
  { "glepnir/zephyr-nvim", lazy = false },
  { "liuchengxu/space-vim-theme", lazy = false },
  { "projekt0n/github-nvim-theme", lazy = false },

  { "AlexvZyl/nordic.nvim", lazy = true },
  { "LunarVim/horizon.nvim", lazy = true },
  { "Yazeed1s/oh-lucy.nvim", lazy = true },
  { "bluz71/vim-nightfly-colors", lazy = true },
  { "hhsnopek/vim-firewatch", lazy = true },
  { "kvrohit/mellow.nvim", lazy = true },
  { "martinsione/darkplus.nvim", lazy = true },
  { "ramojus/mellifluous.nvim", lazy = true },

  -- { "flazz/vim-colorschemes", lazy = true },
  { "wincent/base16-nvim", lazy = true },
  { "ray-x/starry.nvim", lazy = true }, -- has errors?
  { "LunarVim/onedarker.nvim", lazy = true }, -- errors
}
