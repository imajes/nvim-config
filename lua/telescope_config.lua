require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "comment", "css",  "devicetree", "dockerfile", "dot", "go", "html", "http",  "javascript", "jsdoc", "json", "lua", "regex", "ruby", "rust", "scss", "swift", "tsx", "typescript", "vim", "yaml" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

local actions = require "telescope.actions"
local action_layout = require "telescope.actions.layout"

-- Global remapping
------------------------------
-- https://github.com/nvim-telescope/telescope.nvim/blob/d0cf646f65746415294f570ec643ffd0101ca3ab/lua/telescope/mappings.lua

require('telescope').setup {
  defaults = {
    path_display = { truncate = 2 },
    wrap_results = true,
    layout_config = {
      horizontal = {
        prompt_position = "top"
      },
    },
    sorting_strategy = "ascending",
    mappings = {
      n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<esc>"] = actions.close,
        ["<M-p>"] = action_layout.toggle_preview,
        ["<C-n"]  = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        ['<c-d>'] = actions.delete_buffer,
        ["cd"] = function(prompt_bufnr)
            local selection = require("telescope.actions.state").get_selected_entry()
            local dir = vim.fn.fnamemodify(selection.path, ":p:h")
            require("telescope.actions").close(prompt_bufnr)
            -- Depending on what you want put `cd`, `lcd`, `tcd`
            vim.cmd(string.format("silent lcd %s", dir))
          end
      },
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<M-p>"] = action_layout.toggle_preview,
        ["<C-n"]  = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        ['<c-d>'] = actions.delete_buffer,
      },
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim" -- add this value
    },
  },
  pickers = {
    current_buffer_fuzzy_find = {
      skip_empty_lines = true,
    },
    grep_string = {
      sort_only_text = true,
      -- additional_args = function(opts)
      --   if opts.search_all == true then
      --       return {}
      --   end
      --   local args_for_ext = {
      --     ["ts"]  = "-tts",
      --     ["js"]  = "-tjs",
      --   }
      --   return { args_for_ext[vim.bo.filetype] }
      -- end,
    },
    live_grep = {
      only_sort_text = true,
      -- additional_args = function(opts)
      --   if opts.search_all == true then
      --       return {}
      --   end
      --   local args_for_ext = {
      --     ["ts"]  = "-tts",
      --     ["js"]  = "-tjs",
      --   }
      --   return { args_for_ext[vim.bo.filetype] }
      -- end,
    },
    buffers = {
      ignore_current_buffer = true,
      sort_lastused = true,
    },
    colorscheme = {
      enable_preview = true,
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
    dash = {
      -- map filetype strings to the keywords you've configured for docsets in Dash
      -- setting to false will disable filtering by filetype for that filetype
      fileTypeKeywords = {
        startify = false,
        TelescopePrompt = false,
        terminal = false,
        -- a table of strings will search on multiple keywords
        javascript = { 'javascript', 'nodejs' },
        typescript = { 'typescript', 'javascript', 'nodejs' },
        typescriptreact = { 'typescript', 'javascript', 'react' },
        javascriptreact = { 'javascript', 'react' },
        -- you can also do a string, for example,
        -- bash = 'sh'
      },
    },
    bookmarks = {
      -- Available: 'brave', 'google_chrome', 'safari', 'firefox', 'firefox_dev'
      selected_browser = 'google_chrome',
    },
    tele_tabby = {
      use_highlighter = true,
    },
  }
}

-- https://github.com/TC72/telescope-tele-tabby.nvim
-- local opts = themes.get_dropdown {
--   winblend = 10,
--   border = true,
--   previewer = false,
--   shorten_path = false,
--   heigth=20,
--   width= 120
-- }
-- require('telescope').extensions.tele_tabby.list(opts)
require('telescope').load_extension('tele_tabby')

-- require('telescope').load_extension('node_modules')
-- :Telescope node_modules list
-- | key               | action               |
-- |-------------------|----------------------|
-- | `<CR>` (edit)     | `builtin.find_files` |
-- | `<C-x>` (split)   | `:chdir` to the dir  |
-- | `<C-v>` (vsplit)  | `:lchdir` to the dir |
-- | `<C-t>` (tabedit) | `:tchdir` to the dir |

-- https://github.com/nvim-telescope/telescope-github.nvim
require('telescope').load_extension('ghn')
require('telescope').load_extension('gh')
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

require("telescope").load_extension("git_worktree")
require('telescope').load_extension('fzf')

-- https://github.com/dhruvmanila/telescope-bookmarks.nvim
require('telescope').load_extension('bookmarks')

-- https://github.com/xiyaowong/telescope-emoji.nvim
require("telescope").load_extension("emoji")

require('telescope').load_extension('env')

-- https://github.com/FeiyouG/command_center.nvim
require("telescope").load_extension('command_center')

-- https://github.com/ANGkeith/telescope-terraform-doc.nvim
require('telescope').load_extension('terraform_doc')
