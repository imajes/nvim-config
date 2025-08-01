return {
  {
    "saghen/blink.cmp",
    opts = {
      -- https://cmp.saghen.dev/configuration/keymap.html
      keymap = {
        ["<C-e>"] = { "hide", "fallback" },
        ["<CR>"] = {}, -- explicitly disable Enter
        ["<D-CR>"] = { "select_and_accept" }, -- ⌘ + Enter = confirm (GUI only)
        -- OR use an alternative key if <D-CR> doesn't work in terminal:
        -- ["<F23>"] = "confirm",
      },
      completion = {
        ghost_text = {
          enabled = true,
          show_with_menu = false,
        },
      },
    },
  },
}
