-- Section: CODE, Github Integrations
-- ---------------------------------

return {
  {
    "Rawnly/gist.nvim",
    cmd = { "GistCreate", "GistCreateFromFile", "GistsList" },
    config = true,
  },
  -- `GistsList` opens the selected gif in a terminal buffer,
  -- nvim-unception uses neovim remote rpc functionality to open the gist in an actual buffer
  -- and prevents neovim buffer inception
  {
    "samjwill/nvim-unception",
    lazy = false,
    init = function()
      vim.g.unception_block_while_host_edits = true
    end,
  },
  -- -- update the model used for gh copilot
  -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   opts = {
  --     model = "gpt-4o",
  --   },
  -- },

  -- this enables blame on lines
  {
    "lewis6991/gitsigns.nvim",
    event = "LazyFile",
    opts = function(_, opts)
      -- keep LazyVim defaults
      opts.current_line_blame = true
      opts.current_line_blame_opts = {
        delay = 300,
        virt_text = true,
        virt_text_pos = "eol",
        ignore_whitespace = false,
        use_focus = true,
      }
      opts.current_line_blame_formatter = " <author>, <author_time:%R> • <summary>"

      -- preserve LazyVim's existing on_attach and extend it
      local old_on_attach = opts.on_attach

      opts.on_attach = function(buffer)
        if old_on_attach then
          old_on_attach(buffer)
        end

        local gs = package.loaded.gitsigns

        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, {
            buffer = buffer,
            desc = desc,
            silent = true,
          })
        end

        -- your custom blame-related mappings
        map("n", "<leader>gb", function()
          gs.blame_line({ full = true })
        end, "Blame Line")

        map("n", "<leader>gB", gs.toggle_current_line_blame, "Toggle Inline Blame")

        -- example: override LazyVim's default inline preview with normal preview
        -- map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
      end
    end,
  },
}
