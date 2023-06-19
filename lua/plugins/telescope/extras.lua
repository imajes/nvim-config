-- Section: Telescope, extras
-- https://github.com/nvim-telescope/telescope.nvim
-- ------------------------------------------

return {
  {
    "RRethy/nvim-treesitter-endwise",
    lazy = true,
  },
  {
    "BurntSushi/ripgrep",
    lazy = true,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    lazy = true,
  },
  {
    'nvim-telescope/telescope-github.nvim',
    lazy = true,
  },
  {
    'xiyaowong/telescope-emoji.nvim',
    lazy = true,
  },
  {
    -- https://github.com/TC72/telescope-tele-tabby.nvim
    'TC72/telescope-tele-tabby.nvim',
    lazy = true,
  },
  {
    'gfeiyou/command-center.nvim',
    lazy = true,
  },
  {
    'LinArcX/telescope-env.nvim',
    lazy = true,
  },
  {
    'ANGkeith/telescope-terraform-doc.nvim',
    lazy = true,
  },
  {
    'dhruvmanila/telescope-bookmarks.nvim',
    lazy = true,
  },
  {
    'ThePrimeagen/git-worktree.nvim',
    lazy = true,
  },
}


-- local opts = themes.get_dropdown {
--   winblend = 10,
--   border = true,
--   previewer = false,
--   shorten_path = false,
--   heigth=20,
--   width= 120
-- }
-- require('telescope').extensions.tele_tabby.list(opts)
-- require('telescope').load_extension('tele_tabby')

-- require('telescope').load_extension('node_modules')
-- :Telescope node_modules list
-- | key               | action               |
-- |-------------------|----------------------|
-- | `<CR>` (edit)     | `builtin.find_files` |
-- | `<C-x>` (split)   | `:chdir` to the dir  |
-- | `<C-v>` (vsplit)  | `:lchdir` to the dir |
-- | `<C-t>` (tabedit) | `:tchdir` to the dir |

-- https://github.com/nvim-telescope/telescope-github.nvim
-- require('telescope').load_extension('ghn')
-- require('telescope').load_extension('gh')
-- Telescope gh pull_request assignee=imajes state=open
-- |---------|-------------------------------|
-- | `<cr>`  | checkout pull request         |
-- | `<c-t>` | open web                      |
-- | `<c-e>` | toggle to view detail or diff |
-- | `<c-r>` | merge request                 |
-- | `<c-a>` | approve pull request          |
-- Telescope gh run
-- |---------|----------------------------------------------|
-- | `<cr>`  | open workflow summary/run logs in new window |
-- | `<c-t>` | open web                                     |
-- | `<c-r>` | request run rerun                            |
-- Telescope gh gist
-- Telescope gh issues

-- require("telescope").load_extension("git_worktree")
-- require('telescope').load_extension('fzf')

-- https://github.com/dhruvmanila/telescope-bookmarks.nvim
-- require('telescope').load_extension('bookmarks')

-- https://github.com/xiyaowong/telescope-emoji.nvim
-- require("telescope").load_extension("emoji")

-- require('telescope').load_extension('env')

-- https://github.com/FeiyouG/command_center.nvim
-- require("telescope").load_extension('command_center')

-- https://github.com/ANGkeith/telescope-terraform-doc.nvim
-- require('telescope').load_extension('terraform_doc')
