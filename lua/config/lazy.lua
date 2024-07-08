local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

if vim.g.neovide then
  vim.g.preferred_colorscheme = "duskfox"
else
  vim.g.preferred_colorscheme = "dayfox"
  -- vim.g.preferred_colorscheme = "noctis"
end

vim.print("about to setup lazy")
require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    {
      "LazyVim/LazyVim",

      import = "lazyvim.plugins",

      opts = {

        -- colorscheme = "dayfox",
        -- colorscheme = function()
        --   vim.print(" in the colorscheme function, in top")
        --   require("duskfox").load()
        --   -- if vim.g.neovide then
        --   --   require("duskfox").load()
        --   -- else
        --   --   require("noctis").load()
        --   -- end
        -- end,
      },
    },

    -- { import = "plugins.colors" },

    { "folke/noice.nvim" },

    -- { import = "lazyvim.plugins.extras.coding.copilot" },
    { import = "lazyvim.plugins.extras.coding.yanky" },
    { import = "lazyvim.plugins.extras.dap.core" },
    { import = "lazyvim.plugins.extras.dap.nlua" },
    { import = "lazyvim.plugins.extras.editor.aerial" },
    { import = "lazyvim.plugins.extras.editor.navic" },
    -- { import = "lazyvim.plugins.extras.lang.cmake" },
    { import = "lazyvim.plugins.extras.lang.docker" },
    { import = "lazyvim.plugins.extras.lang.elixir" },
    { import = "lazyvim.plugins.extras.lang.go" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.markdown" },
    { import = "lazyvim.plugins.extras.lang.python" },
    { import = "lazyvim.plugins.extras.lang.ruby" },
    { import = "lazyvim.plugins.extras.lang.rust" },
    -- { import = "lazyvim.plugins.extras.lang.tailwind" },
    { import = "lazyvim.plugins.extras.lang.terraform" },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.yaml" },
    { import = "lazyvim.plugins.extras.test.core" },
    { import = "lazyvim.plugins.extras.ui.alpha" },
    { import = "lazyvim.plugins.extras.ui.mini-animate", cond = not vim.g.neovide },
    { import = "lazyvim.plugins.extras.util.mini-hipatterns", cond = not vim.g.neovide },
    { import = "lazyvim.plugins.extras.util.project" },

    -- import/override with your plugins
    { import = "plugins" },
    -- specific [non-glob] files in local plugins
    { import = "plugins.langs.databases" },
    { import = "plugins.langs.go" },
  },

  colorscheme = function()
    vim.print(" in the colorscheme function, in top")
    require("duskfox").load()
    -- if vim.g.neovide then
    --   require("duskfox").load()
    -- else
    --   require("noctis").load()
    -- end
  end,

  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- if you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = true,

    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver

    -- colorscheme can be a string like `catppuccin` or a function that will load the colorscheme
    ---@type string|fun()
    colorscheme = function()
      vim.print(" in the colorscheme function, in defaults")
      require("duskfox").load()
      -- if vim.g.neovide then
      --   require("duskfox").load()
      -- else
      --   require("noctis").load()
      -- end
    end,
  },

  install = {
    missing = true,
    --   colorscheme = { "duskfox", "monokai-pro", "tokyonight" },
    colorscheme = { "duskfox" },
    -- colorscheme = function()
    --   vim.print(" in the colorscheme function, in install")
    --   require("duskfox").load()
    -- end,
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
