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
