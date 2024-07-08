-- Section: UI, Color Schemes
-- ---------------------------------

return {
  -- {
  --   "echasnovski/mini.hues",
  --   config = function()
  --     require("mini.hues").setup({ background = "#09182E", foreground = "#dcc9db", saturation = "high", n_hues = 6 })
  --   end,
  --   lazy = true,
  -- },
  --
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
    lazy = true,
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
  --   lazy = true,
  -- },

  -- {
  --   "AlphaTechnolog/pywal.nvim",
  --   config = function()
  --     require("pywal").setup()
  --   end,
  --   lazy = true,
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
  --   lazy = true,
  -- },
  {
    "folke/tokyonight.nvim",
    opts = { style = "moon" },
    lazy = true,
  },

  {
    "sainnhe/sonokai",
    config = function()
      vim.g.sonokai_style = "atlantis"
      vim.g.sonokai_better_performance = 1
    end,
    lazy = true,
  },

  {
    "sainnhe/everforest",
    config = function()
      vim.g.everforest_background = "dark"
      vim.g.everforest_better_performance = 1
    end,
    lazy = true,
  },

  {
    "sainnhe/edge",
    config = function()
      vim.g.edge_style = "neon"
      vim.g.edge_better_performance = 1
    end,
    lazy = true,
  },

  { "AlexvZyl/nordic.nvim", lazy = true },
  { "EdenEast/nightfox.nvim", lazy = false },
  { "LunarVim/horizon.nvim", lazy = true },
  { "LunarVim/onedarker.nvim", lazy = true },
  { "LunarVim/synthwave84.nvim", lazy = true },
  { "Yazeed1s/oh-lucy.nvim", lazy = true },
  { "bluz71/vim-nightfly-colors", lazy = true },
  { "catppuccin/nvim", name = "catppuccin", lazy = true },
  -- { "flazz/vim-colorschemes", lazy = true },
  { "glepnir/zephyr-nvim", lazy = true },
  { "hhsnopek/vim-firewatch", lazy = true },
  { "kvrohit/mellow.nvim", lazy = true },
  { "liuchengxu/space-vim-theme", lazy = true },
  { "martinsione/darkplus.nvim", lazy = true },
  { "projekt0n/github-nvim-theme", lazy = true },
  { "ramojus/mellifluous.nvim", lazy = true },
  { "ray-x/starry.nvim", lazy = true },
  { "talha-akram/noctis.nvim", lazy = true },
  { "wincent/base16-nvim", lazy = true },
}
