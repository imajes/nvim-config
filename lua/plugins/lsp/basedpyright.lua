-- lua/plugins/basedpyright-tune.lua
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      basedpyright = {
        settings = {
          basedpyright = {
            analysis = {
              diagnosticMode = "openFilesOnly", -- big win for CPU
              autoImportCompletions = true,
              useLibraryCodeForTypes = true, -- false = use stubs
            },
          },
        },
      },
    },
  },
}
