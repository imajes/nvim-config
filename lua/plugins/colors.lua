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
    lazy = false,
  },

  {
    "folke/tokyonight.nvim",
    opts = { style = "moon" },
    lazy = false,
  },

  {
    "LunarVim/horizon.nvim",
    config = function()
      vim.cmd("colorscheme horizon")
    end,
    lazy = false,
  },

  {
    "LunarVim/onedarker.nvim",
    config = function()
      vim.cmd("colorscheme onedarker")
    end,
    lazy = false,
  },

  {
    "sainnhe/sonokai",
    config = function()
      vim.g.sonokai_style = "atlantis"
      vim.g.sonokai_better_performance = 1
      vim.cmd("colorscheme sonokai")
    end,
    lazy = false,
  },

  {
    "sainnhe/everforest",
    config = function()
      vim.g.everforest_background = "dark"
      vim.g.everforest_better_performance = 1
      vim.cmd("colorscheme everforest")
    end,
    lazy = false,
  },

  {
    "sainnhe/edge",
    config = function()
      vim.g.edge_style = "neon"
      vim.g.edge_better_performance = 1
      vim.cmd("colorscheme edge")
    end,
    lazy = false,
  },

  {
    "EdenEast/nightfox.nvim",
    config = function()
      vim.cmd("colorscheme nightfox")
    end,
    lazy = false,
  },

  {
    "martinsione/darkplus.nvim",
    config = function()
      vim.cmd("colorscheme darkplus")
    end,
    lazy = false,
  },

  {
    "LunarVim/synthwave84.nvim",
    config = function()
      vim.cmd("colorscheme synthwave84")
    end,
    lazy = false,
  },

  {
    "glepnir/zephyr-nvim",
    config = function()
      vim.cmd("colorscheme zephyr")
    end,
    lazy = false,
  },
  {
    "ray-x/aurora",
    config = function()
      vim.cmd("colorscheme aurora")
    end,
    lazy = false,
    init = function()
      vim.g.aurora_italic = 1
      vim.g.aurora_transparent = 1
      vim.g.aurora_bold = 1
    end,
  },
  -- {
  --   "nekonako/xresources-nvim",
  --   config = function()
  --     require("xresources")
  --   end,
  --   lazy = false,
  -- },
  {
    "talha-akram/noctis.nvim",
    config = function()
      vim.cmd("colorscheme noctis_minimus")
    end,
    lazy = false,
  },
  {
    "Yazeed1s/oh-lucy.nvim",
    config = function()
      vim.cmd("colorscheme oh-lucy-evening")
    end,
    lazy = false,
  },
  {
    "kvrohit/mellow.nvim",
    config = function()
      vim.cmd("colorscheme mellow")
    end,
    lazy = false,
  },

  {
    "bluz71/vim-nightfly-colors",
    config = function()
      vim.cmd("colorscheme nightfly")
    end,
    lazy = false,
  },

  {
    "JoosepAlviste/palenightfall.nvim",
    config = function()
      require("palenightfall").setup()
    end,
    lazy = false,
  },

  -- {
  --   "noorwachid/nvim-nightsky",
  --   config = function()
  --     vim.cmd("colorscheme nightsky")
  --   end,
  --   lazy = false,
  -- },

  {
    "AlexvZyl/nordic.nvim",
    config = function()
      require("nordic").load()
    end,
    lazy = false,
  },

  -- {
  --   "AlphaTechnolog/pywal.nvim",
  --   config = function()
  --     require("pywal").setup()
  --   end,
  --   lazy = false,
  -- },

  {
    -- https://github.com/ramojus/mellifluous.nvim
    "ramojus/mellifluous.nvim",
    config = function()
      require("mellifluous").setup()

      vim.cmd("colorscheme mellifluous")
    end,
    lazy = false,
  },

  {
    "sainnhe/gruvbox-material",
    config = function()
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_background = "hard"

      vim.cmd("colorscheme gruvbox-material")
    end,
    lazy = false,
  },

  { "hhsnopek/vim-firewatch", lazy = false },
  { "EdenEast/nightfox.nvim", lazy = false },
  { "liuchengxu/space-vim-theme", lazy = false },
  { "ray-x/starry.nvim", lazy = false },
  { "catppuccin/nvim", name = "catppuccin", lazy = false },
  { "projekt0n/github-nvim-theme", lazy = false },
  { "flazz/vim-colorschemes", lazy = false },
  { "wincent/base16-nvim", lazy = false },
}
