-- Section: UI, Color Scheme Picker
-- ---------------------------------

-- gotta seed the beast: https://stackoverflow.com/questions/18199844/lua-math-random-not-working
math.randomseed(os.time())
math.random()
math.random()
math.random()

local M = {}

M.light_schemes = {
  -- "atelier-cave-light",
  -- "cupertino",
  -- "cyberdream-light",
  "dayfox",
  "dawnfox",
  -- "equilibrium-gray-light",
  -- "github_light",
  -- "github_light_default",
  -- "measured-light",
  -- "oxocarbon-light",
  -- "papercolor-light",
  -- "precious-light-warm",
  -- "precious-light-white",
  -- "selenized-white",
  -- "standardized-light",
}

M.dark_schemes = {
  -- "aurora",
  -- "ayu-mirage",
  -- "banana-blueberry",
  -- "birds-of-paradise",
  -- "blazer",
  -- "bluloco",
  -- "breeze",
  -- "brewer",
  "carbonfox",
  -- "catppuccin-frappe",
  -- "catppuccin-macchiato",
  -- "chalkboard",
  -- "challenger-deep",
  -- "darktooth",
  -- "decaf",
  -- "deep-oceanic-next",
  "duskfox",
  -- "earthsong",
  -- "eighties",
  -- "embarcadero",
  -- "espresso",
  -- "eva-dim",
  -- "flatland",
  -- "gruvbox-dark-pale",
  -- "gruvbox-material-dark-medium",
  -- "habamax",
  -- "idle-toes",
  -- "lab-fox",
  -- "material-palenight",
  -- "mission-brogue",
  "nightfox",
  "nordfox",
  -- "oceanic-material",
  -- "oceanicnext",
  -- "palenightfall",
  -- "paraiso",
  -- "railscasts",
  -- "rose-pine-moon",
  -- "silk-dark",
  -- "snazzy",
  -- "sonokai",
  "terafox",
  -- "tokyo-night-storm",
  -- "tokyonight-moon",
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
