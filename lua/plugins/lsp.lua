-- configure/manage lsp
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
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
