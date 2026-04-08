-- configure/manage lsp
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Apply shared capabilities to every configured server.
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

        -- Keep Angular disabled here because the extra is imported, but this machine
        -- should not let Mason manage or auto-enable the server.
        angularls = {
          mason = false,
          enabled = false,
        },

        -- Small bashls tweak stays inline because it is just a ShellCheck argument
        -- override, not a full server-specific config surface.
        bashls = {
          settings = {
            bashIde = {
              shellcheckArguments = "--exclude=SC2034",
            },
          },
        },

        -- basedpyright is the active Python LSP. The server selection lives in
        -- `lua/plugins/lsp/defaults.lua` because LazyVim reads that global during
        -- spec resolution, before normal plugin opts are merged.
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                diagnosticMode = "openFilesOnly",
                autoImportCompletions = true,
                useLibraryCodeForTypes = true,
              },
            },
          },
        },

        -- Ruby tooling is intentionally system-managed instead of Mason-managed.
        rubocop = {
          mason = false,
        },
        ruby_lsp = {
          mason = false,
        },

        -- Sorbet stays defined but disabled so the command wiring is preserved if
        -- it gets turned back on later.
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
