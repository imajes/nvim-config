-- Section: UI, Color Scheme Picker
-- ---------------------------------

-- gotta seed the beast: https://stackoverflow.com/questions/18199844/lua-math-random-not-working
math.randomseed(os.time())
math.random()
math.random()
math.random()

local M = {}

M.light_schemes = {
  "measured-light",
  "standardized_light",
  "precious-light-warm",
  "precious-light-white",
  "github_light_default",
  "equilibrium-gray-light",
}

M.dark_schemes = {
  "duskfox",
  "darkfox",
}

M.curr_colorscheme = ""

M.randomizer = function(schemes)
  vim.g.preferred_colorscheme = schemes[math.random(#schemes)]
end

M.light = function()
  M.randomizer(M.light_schemes)
  vim.cmd.colorscheme(vim.g.preferred_colorscheme)
end

M.dark = function()
  M.randomizer(M.dark_schemes)
  vim.cmd.colorscheme(vim.g.preferred_colorscheme)
end

return M

-- if vim.g.neovide then
--   vim.g.preferred_colorscheme = "everforest"
-- else
--   vim.g.preferred_colorscheme = "gruvbox-material"
--   -- vim.g.preferred_colorscheme = "noctis"
-- end
