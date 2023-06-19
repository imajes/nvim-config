-- Section: Base, Movement
-- ---------------------------------

return {
  {
    "karb94/neoscroll.nvim",
    opts = {
      easing_function = "quintic",
      performance_mode = true,
      respect_scrolloff = true
    },
    lazy = true,
  },
  {
    -- https://github.com/christoomey/vim-sort-motion
    'christoomey/vim-sort-motion',
    lazy = true
  },
  {
    -- https://github.com/tpope/vim-commentary
    "tpope/vim-commentary"
  },
  {
    -- https://docs.stevelosh.com/gundo.vim/
    "sjl/gundo.vim",
    lazy = true
  },
}
