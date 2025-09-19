if lazyvim_docs then
  -- LSP Server to use for Ruby.
  -- Set to "solargraph" to use solargraph instead of ruby_lsp.
  vim.g.lazyvim_ruby_lsp = "ruby_lsp"
  vim.g.lazyvim_ruby_formatter = "rubocop"
end

local lsp = vim.g.lazyvim_ruby_lsp or "ruby_lsp"
local formatter = vim.g.lazyvim_ruby_formatter or "rubocop"

return {
  recommended = function()
    return LazyVim.extras.wants({
      ft = "ruby",
      root = "Gemfile",
    })
  end,
  {
    "nvim-treesitter/nvim-treesitter",
    -- LazyVim already pins this to the main branch & sets up TS.setup() for you
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "ruby" }) -- add other ruby-adjacent grammars if you use them: "embedded_template", "yaml"

      opts.indent = opts.indent or {}
      opts.indent.enable = false

      opts.highlight = opts.highlight or {}
      opts.highlight.additional_vim_regex_highlighting = { "ruby" }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        ruby_lsp = {
          enabled = lsp == "ruby_lsp",
          init_options = {
            enabledFeatures = {
              codeActions = true,
              codeLens = true,
              completion = true,
              definition = true,
              diagnostics = true,
              documentHighlights = true,
              documentLink = true,
              documentSymbols = true,
              foldingRanges = true,
              formatting = true,
              hover = true,
              inlayHint = true,
              onTypeFormatting = true,
              selectionRanges = true,
              semanticHighlighting = true,
              signatureHelp = true,
              typeHierarchy = true,
              workspaceSymbol = true,
            },
            featuresConfiguration = {
              inlayHint = {
                implicitHashValue = true,
                implicitRescue = true,
              },
            },
            -- indexing = {
            --   excludedPatterns = [path/to/excluded/file.rb],
            --   includedPatterns = [path/to/included/file.rb],
            --   excludedGems = [gem1, gem2, etc.],
            --   excludedMagicComments = [compiled =true]
            -- },
            formatter = "auto",
            linters = { "rubocop" },
            experimentalFeaturesEnabled = true,
            addonSettings = {
              ["Ruby LSP Rails"] = {
                enablePendingMigrationsPrompt = false,
              },
            },
          },
        },
        rubocop = {
          enabled = formatter == "rubocop",
        },
        standardrb = {
          enabled = formatter == "standardrb",
        },
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "erb-formatter", "erb-lint" } },
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      "suketa/nvim-dap-ruby",
      config = function()
        require("dap-ruby").setup()
      end,
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ruby = { formatter },
        eruby = { "erb_format" },
      },
    },
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "olimorris/neotest-rspec",
    },
    opts = {
      adapters = {
        ["neotest-rspec"] = {
          -- NOTE: By default neotest-rspec uses the system wide rspec gem instead of the one through bundler
          -- rspec_cmd = function()
          --   return vim.tbl_flatten({
          --     "bundle",
          --     "exec",
          --     "rspec",
          --   })
          -- end,
        },
      },
    },
  },
}
