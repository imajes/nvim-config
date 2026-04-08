-- Keep Python LSP selection under the LSP config tree, but load it early enough
-- for LazyVim's Python extra to see it during spec resolution before
-- `lua/plugins/lsp_overrides.lua` is merged like a normal plugin spec.
vim.g.lazyvim_python_lsp = "basedpyright"
