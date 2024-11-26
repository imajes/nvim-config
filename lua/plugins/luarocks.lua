-- Section: LuaRocks
-- ------------------------------------------

return {
  {
    "camspiers/luarocks",
    -- dependencies = {
    --   "rcarriga/nvim-notify", -- Optional dependency
    -- },
    opts = {
      rocks = { "inspect" }, -- Specify LuaRocks packages to install
    },
  },
}
