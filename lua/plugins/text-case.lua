-- Section: Editor, Text case manipulation
-- ---------------------------------------

return {
  desc = "Text case manipulation",

  -- {
  --   "gregorias/coerce.nvim",
  --   tag = "v3.0.0",
  --   config = function()
  --     require("coerce").setup({
  --       keymap_registry = require("coerce.keymap").keymap_registry(),
  --       -- The notification function used during error conditions.
  --       notify = function(...)
  --         return vim.notify(...)
  --       end,
  --       default_mode_keymap_prefixes = {
  --         normal_mode = "xr",
  --         motion_mode = "gxr",
  --         visual_mode = "gxr",
  --       },
  --       -- If you don’t like the default cases and modes, you can override them.
  --       cases = require("coerce").default_cases,
  --       modes = require("coerce").get_default_modes(self.default_mode_keymap_prefixes),
  --     })
  --   end,
  -- },
  {
    "johmsalas/text-case.nvim",
    event = "LazyFile",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("textcase").setup({})
    end,
    keys = {
      "gx", -- Default invocation prefix
    },
    cmd = {
      -- NOTE: The Subs command name can be customized via the option "substitude_command_name"
      "Subs",
      "TextCaseStartReplacingCommand",
    },
    -- If you want to use the interactive feature of the `Subs` command right away, text-case.nvim
    -- has to be loaded on startup. Otherwise, the interactive feature of the `Subs` will only be
    -- available after the first executing of it or after a keymap of text-case.nvim has been used.
    -- lazy = false,
  },

  -- Telescope integration
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    opts = function()
      LazyVim.on_load("telescope.nvim", function()
        require("telescope").load_extension("textcase")
      end)
    end,
    keys = {
      {
        "gx.",
        "<cmd>TextCaseOpenTelescope<CR>",
        mode = { "n", "x" },
        desc = "Change TextCasing",
      },
    },
    cmd = {
      "TextCaseOpenTelescope",
      "TextCaseOpenTelescopeQuickChange",
      "TextCaseOpenTelescopeLSPChange",
    },
  },
}
