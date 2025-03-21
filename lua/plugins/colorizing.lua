-- colorize, well, colors
return {

  {
    "catgoose/nvim-colorizer.lua",
    event = "LazyFile",
    opts = {
      user_default_options = {
        -- names = false,
        css = true,
        sass = { enable = true, parsers = { "css" } }, -- Enable sass colors
      },
    },
  },
}
