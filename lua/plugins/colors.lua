-- Section: UI, Color Schemes
-- ---------------------------------

local eager_theme_plugins = {
  -- Themes in this table are exposed to picker/completion at startup.
  -- Everything else stays lazy and only loads if you opt back into it here.
  ["EdenEast/nightfox.nvim"] = true,
}

local function theme(spec)
  local repo = spec[1]
  if not eager_theme_plugins[repo] then
    spec.lazy = true
    spec.priority = nil
  end
  return spec
end

return {

  -- {
  --   "echasnovski/mini.hues",
  --   config = function()
  --     require("mini.hues").setup({ background = "#09182E", foreground = "#dcc9db", saturation = "high", n_hues = 6 })
  --   end,
  --   lazy = true,
  -- },
  --
  theme({
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
  }),

  theme({
    "ray-x/aurora",
    init = function()
      vim.g.aurora_italic = 1
      vim.g.aurora_transparent = 1
      vim.g.aurora_bold = 1
    end,
  }),

  theme({
    "JoosepAlviste/palenightfall.nvim",
    config = function()
      -- require("palenightfall").setup()
    end,
  }),

  theme({
    "scottmckendry/cyberdream.nvim",
    priority = 1000,
    config = function()
      require("cyberdream").setup({
        variant = "auto",
        transparent = true,
        borderless_pickers = true,
        cache = true,
      })
    end,
  }),

  theme({
    "uloco/bluloco.nvim",
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },
    config = function()
      require("bluloco").setup({
        style = "auto", -- "auto" | "dark" | "light"
        transparent = true,
        italics = false,
        terminal = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
        guicursor = true,
      })
    end,
  }),

  theme({
    "savq/melange-nvim",
    -- config = function()
    --   require("palenightfall").setup()
    -- end,
  }),

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

  theme({
    "sainnhe/gruvbox-material",
    config = function()
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_background = "hard"
    end,
  }),
  -- {
  --   "nekonako/xresources-nvim",
  --   config = function()
  --     require("xresources")
  --   end,
  --   lazy = true,
  -- },
  theme({
    "folke/tokyonight.nvim",
    opts = { style = "moon" },
  }),

  theme({
    "sainnhe/sonokai",
    config = function()
      vim.g.sonokai_style = "atlantis"
      vim.g.sonokai_better_performance = 1
    end,
  }),

  theme({
    "sainnhe/everforest",
    config = function()
      vim.g.everforest_background = "dark"
      vim.g.everforest_better_performance = 1
    end,
  }),

  theme({
    "sainnhe/edge",
    config = function()
      vim.g.edge_style = "neon"
      vim.g.edge_better_performance = 1
    end,
  }),

  theme({ "kepano/flexoki-neovim" }),
  theme({ "mhartington/oceanic-next" }),
  theme({ "AlexvZyl/nordic.nvim" }),
  theme({ "EdenEast/nightfox.nvim" }),
  theme({ "LunarVim/horizon.nvim" }),
  theme({ "LunarVim/onedarker.nvim" }),
  theme({ "LunarVim/synthwave84.nvim" }),
  theme({ "Yazeed1s/oh-lucy.nvim" }),
  theme({ "bluz71/vim-nightfly-colors" }),
  theme({ "catppuccin/nvim", name = "catppuccin" }),
  -- { "flazz/vim-colorschemes", lazy = true },
  theme({ "glepnir/zephyr-nvim" }),
  theme({ "hhsnopek/vim-firewatch" }),
  theme({ "kvrohit/mellow.nvim" }),
  theme({ "liuchengxu/space-vim-theme" }),
  theme({ "martinsione/darkplus.nvim" }),
  theme({ "projekt0n/github-nvim-theme" }),
  theme({ "ramojus/mellifluous.nvim" }),
  theme({ "ray-x/starry.nvim" }),
  theme({ "talha-akram/noctis.nvim" }),
  theme({ "wincent/base16-nvim" }),
}
