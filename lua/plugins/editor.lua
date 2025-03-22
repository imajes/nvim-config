-- Section: Editor, Formatting
-- ---------------------------------

return {

  {
    -- alignment
    "junegunn/vim-easy-align",
    lazy = true,
  },
  {
    -- editor config support
    "editorconfig/editorconfig-vim",
    lazy = true,
  },
  -- {
  --   -- auto match pairs for code
  --   "jiangmiao/auto-pairs",
  --   lazy = true,
  -- },
  {
    "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
    branch = "v0.6",
    opts = {
      --Config goes here
    },
  },
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   opts = {
  --     sources = { "filesystem", "buffers", "git_status", "document_symbols" },
  --     open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "Outline" },
  --     filesystem = {
  --       bind_to_cwd = false,
  --       follow_current_file = { enabled = true },
  --       use_libuv_file_watcher = true,
  --       filtered_items = {
  --         visible = true,
  --         show_hidden_count = true,
  --         hide_dotfiles = false,
  --         hide_gitignored = true,
  --         hide_by_name = {
  --           -- '.git'
  --         },
  --         never_show = {},
  --       },
  --     },
  --     window = {
  --       mappings = {
  --         ["<space>"] = "none",
  --       },
  --     },
  --     default_component_configs = {
  --       indent = {
  --         with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
  --         expander_collapsed = "",
  --         expander_expanded = "",
  --         expander_highlight = "NeoTreeExpander",
  --       },
  --     },
  --   },
  -- },
}
