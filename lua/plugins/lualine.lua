return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.remove(opts.sections.lualine_c, 2)
      table.insert(
        opts.sections.lualine_c,
        1,
        { "filetype", icon_only = false, separator = "  ", padding = { left = 1, right = 0 } }
      )
    end,
  },
}
