-- lua/plugins/bashls-shellcheck.lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.bashls = vim.tbl_deep_extend("force", opts.servers.bashls or {}, {
        settings = {
          bashIde = {
            -- Pass flags directly to ShellCheck
            shellcheckArguments = "--exclude=SC2034",
          },
        },
      })
    end,
  },
}
