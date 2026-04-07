-- these are extras that we want to bring in
--

-- filetype detection and overrides
require("config.filetypes")

-- richer diagnostic jumps that temporarily expand virtual lines
require("config.diagnostic_navigation")

-- ufo folding behavior and provider selection
require("config.folding")

-- focused debug toggles and plugin-specific log settings
require("config.debug")

-- append the current buffer settings as a modeline
require("config.modeline")

-- remote clipboard behavior for SSH sessions
require("config.remote_clipboards")
