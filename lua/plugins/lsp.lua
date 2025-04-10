-- configure/manage lsp
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- typescript/javascript/etc
        eslint = {
          mason = false,
        },
        vtsls = {
          mason = false,
        },
        jsonls = {
          mason = false,
        },
        angularls = {
          mason = false,
          enabled = true,
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
