local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

-- integrate mise to provide shims
vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH

-- if vim.g.neovide then
--   vim.g.preferred_colorscheme = "everforest"
-- else
--   vim.g.preferred_colorscheme = "gruvbox-material"
--   -- vim.g.preferred_colorscheme = "noctis"
-- end

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    {
      "LazyVim/LazyVim",

      import = "lazyvim.plugins",

      opts = {
        -- colorscheme = vim.g.preferred_colorscheme,
      },
    },

    { import = "plugins.colors" },

    { "folke/noice.nvim" },

    -- this didn't execute inside of plugins, so force it up here first
    {
      "f-person/auto-dark-mode.nvim",
      lazy = false,
      priority = 10000,
      opts = {
        update_interval = 1000,
        set_dark_mode = function()
          vim.api.nvim_set_option_value("background", "dark", {})
          vim.cmd("colorscheme duskfox")
        end,
        set_light_mode = function()
          vim.api.nvim_set_option_value("background", "light", {})
          vim.cmd("colorscheme duskfox")
          -- vim.api.nvim_set_option_value("background", "dark", {})
          -- vim.cmd("colorscheme darkfox")
        end,
      },
    },
    -- extras. managed here vs lazyvim.json for easier customization

    -- load these first as they describe/inform UI/utils
    { import = "lazyvim.plugins.extras.ui.alpha" },
    { import = "lazyvim.plugins.extras.ui.edgy" },
    -- { import = "lazyvim.plugins.extras.ui.mini-animate", cond = not vim.g.neovide },
    { import = "lazyvim.plugins.extras.ui.mini-animate" },
    { import = "lazyvim.plugins.extras.ui.mini-indentscope" },
    { import = "lazyvim.plugins.extras.ui.treesitter-context" },

    { import = "lazyvim.plugins.extras.util.dot" },
    { import = "lazyvim.plugins.extras.util.gitui" },
    -- { import = "lazyvim.plugins.extras.util.mini-hipatterns", cond = not vim.g.neovide },
    { import = "lazyvim.plugins.extras.util.mini-hipatterns" },
    { import = "lazyvim.plugins.extras.util.octo" },
    { import = "lazyvim.plugins.extras.util.project" },
    { import = "lazyvim.plugins.extras.util.startuptime" },

    { import = "lazyvim.plugins.extras.dap.core" },
    { import = "lazyvim.plugins.extras.dap.nlua" },

    { import = "lazyvim.plugins.extras.editor.aerial" },
    { import = "lazyvim.plugins.extras.editor.dial" },
    { import = "lazyvim.plugins.extras.editor.fzf" },
    { import = "lazyvim.plugins.extras.editor.harpoon2" },
    { import = "lazyvim.plugins.extras.editor.illuminate" },
    { import = "lazyvim.plugins.extras.editor.inc-rename" },
    { import = "lazyvim.plugins.extras.editor.leap" },
    { import = "lazyvim.plugins.extras.editor.mini-diff" },
    { import = "lazyvim.plugins.extras.editor.mini-files" },
    { import = "lazyvim.plugins.extras.editor.mini-move" },
    { import = "lazyvim.plugins.extras.editor.navic" },
    { import = "lazyvim.plugins.extras.editor.refactoring" },
    -- { import = "lazyvim.plugins.extras.editor.telescope" },

    -- these are code related
    { import = "lazyvim.plugins.extras.coding.blink" },
    { import = "lazyvim.plugins.extras.coding.mini-surround" },
    { import = "lazyvim.plugins.extras.coding.neogen" },
    { import = "lazyvim.plugins.extras.coding.yanky" },

    -- ai code hax0rs
    { import = "lazyvim.plugins.extras.ai.copilot" },
    { import = "lazyvim.plugins.extras.ai.copilot-chat" },

    { import = "lazyvim.plugins.extras.formatting.black" },
    { import = "lazyvim.plugins.extras.formatting.prettier" },

    { import = "lazyvim.plugins.extras.lang.angular" },
    { import = "lazyvim.plugins.extras.lang.ansible" },
    { import = "lazyvim.plugins.extras.lang.clangd" },
    { import = "lazyvim.plugins.extras.lang.clojure" },
    { import = "lazyvim.plugins.extras.lang.cmake" },
    { import = "lazyvim.plugins.extras.lang.docker" },
    { import = "lazyvim.plugins.extras.lang.elixir" },
    { import = "lazyvim.plugins.extras.lang.git" },
    { import = "lazyvim.plugins.extras.lang.helm" },
    { import = "lazyvim.plugins.extras.lang.java" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.kotlin" },
    { import = "lazyvim.plugins.extras.lang.markdown" },
    { import = "lazyvim.plugins.extras.lang.prisma" },
    { import = "lazyvim.plugins.extras.lang.python" },
    { import = "lazyvim.plugins.extras.lang.ruby" },
    { import = "lazyvim.plugins.extras.lang.rust" },
    { import = "lazyvim.plugins.extras.lang.scala" },
    { import = "lazyvim.plugins.extras.lang.sql" },
    -- { import = "lazyvim.plugins.extras.lang.tailwind" },
    { import = "lazyvim.plugins.extras.lang.terraform" },
    { import = "lazyvim.plugins.extras.lang.thrift" },
    { import = "lazyvim.plugins.extras.lang.toml" },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    -- { import = "lazyvim.plugins.extras.lang.vue" },
    { import = "lazyvim.plugins.extras.lang.yaml" },

    { import = "lazyvim.plugins.extras.linting.eslint" },

    { import = "lazyvim.plugins.extras.test.core" },

    -- import/override with your plugins
    { import = "plugins" },
    -- specific [non-glob] files in local plugins
    { import = "plugins.langs.databases" },
    { import = "plugins.langs.go" },
  },

  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- if you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = true,

    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },

  install = {
    missing = true,
    colorscheme = { "duskfox", "nightfox", "dayfox" },
  },

  checker = {
    enabled = true,
    notify = false,
    frequency = 3600,
  }, -- automatically check for plugin updates

  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true,
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

-- local logo = [[
--     ██╗░░██╗░█████╗░░█████╗░██╗░░██╗████████╗██╗░░██╗███████╗██████╗░██╗░░░░░░█████╗░███╗░░██╗███████╗████████╗
--     ██║░░██║██╔══██╗██╔══██╗██║░██╔╝╚══██╔══╝██║░░██║██╔════╝██╔══██╗██║░░░░░██╔══██╗████╗░██║██╔════╝╚══██╔══╝
--     ███████║███████║██║░░╚═╝█████═╝░░░░██║░░░███████║█████╗░░██████╔╝██║░░░░░███████║██╔██╗██║█████╗░░░░░██║░░░
--     ██╔══██║██╔══██║██║░░██╗██╔═██╗░░░░██║░░░██╔══██║██╔══╝░░██╔═══╝░██║░░░░░██╔══██║██║╚████║██╔══╝░░░░░██║░░░
--     ██║░░██║██║░░██║╚█████╔╝██║░╚██╗░░░██║░░░██║░░██║███████╗██║░░░░░███████╗██║░░██║██║░╚███║███████╗░░░██║░░░
--     ╚═╝░░╚═╝╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░╚═╝╚══════╝╚═╝░░░░░╚══════╝╚═╝░░╚═╝╚═╝░░╚══╝╚══════╝░░░╚═╝░░░
-- ]]
-- logo = string.rep("\n", 4) .. logo .. "\n\n"
--
-- local dashboard = require("alpha.themes.dashboard")
-- dashboard.section.header.val = vim.split(logo, "\n")

-- close lazy panel with esc
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "lazy",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "<Esc>", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})
