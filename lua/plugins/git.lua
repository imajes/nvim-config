-- Section: UI, git
-- ------------------------------------------

return {
  {
    -- https://github.com/dinhhuy258/git.nvim
    "dinhhuy258/git.nvim",
    --event = "VimEnter",
    version = "*",
    lazy = false,
    config = function()
      require("git").setup({
        target_branch = "develop",
      })
    end,
  },
}
