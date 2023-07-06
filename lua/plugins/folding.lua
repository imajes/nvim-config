-- Section: UI, folding
-- ------------------------------------------

return {
  {
    -- https://github.com/kevinhwang91/nvim-ufo
    "kevinhwang91/nvim-ufo",
    version = "*",
    lazy = false,
    dependencies = "kevinhwang91/promise-async",
    opts = {
      provider_selector = function(bufnr, filetype, _buftype)
        return { "lsp", "indent" }
      end,
    },
  },
}
