-- configure/manage lsp
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["*"] = {
          capabilities = {
            textDocument = {
              foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true,
              },
            },
          },
        },
        -- typescript/javascript/etc
        -- eslint = {
        --   mason = false,
        -- },
        -- vtsls = {
        --   mason = false,
        -- },
        -- jsonls = {
        --   mason = false,
        -- },
        angularls = {
          mason = false,
          enabled = false,
        },
        -- ruby etc
        rubocop = {
          mason = false,
        },
        ruby_lsp = {
          mason = false,
        },
        sorbet = {
          mason = false,
          enabled = false,
          cmd = {
            "srb",
            "tc",
            "--lsp",
            "--enable-all-beta-lsp-features",
            "--debug-log-file",
            "/Users/james/.local/state/nvim/sorbet_debug.log",
          },
        },
      },
    },
  },
}
