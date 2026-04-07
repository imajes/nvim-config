# AGENTS.md

This repository is a personal Neovim configuration rooted at `~/.config/nvim`. It is built on top of LazyVim and `lazy.nvim`, with local behavior split across `lua/config/*`, `lua/plugins/*`, and a small set of helper modules.

## Scope And Intent

- Treat this repo as an actively used personal editor config, not a generic starter template.
- Prefer narrow, surgical changes. Preserve existing behavior unless the task explicitly calls for a broader refactor.
- Assume the user cares about startup stability and interactive editing ergonomics more than novelty.
- Do not remove or rewrite environment-specific behavior unless requested. This config intentionally contains local machine and remote-session logic.

## Repository Layout

- `init.lua`
  - Entry point.
  - Loads `config.neovide` when `vim.g.neovide` is set.
  - Loads `config.lazy`, then `config.extras`.
- `lua/config/`
  - Core config modules and imperative setup.
  - Use this for options, keymaps, autocmds, environment detection, host providers, dashboard wiring, folding behavior, diagnostics navigation, and similar editor-level behavior.
- `lua/plugins/`
  - Lazy plugin specs and overrides.
  - Files generally return plugin spec tables consumed by `require("lazy").setup(...)`.
- `lua/plugins/lsp/`
  - Focused LSP overrides layered on top of LazyVim defaults.
- `lua/plugins/langs/`
  - Language-specific plugin or tooling adjustments.
- `lua/utils/`
  - Utility helpers, currently centered on floating-window debugging workflows.
- `after/ftplugin/`
  - Filetype-specific overrides that should apply after startup.
- `lazy-lock.json`
  - Plugin lockfile. Do not update it unless the task is explicitly about plugin version changes or a `:Lazy` operation that intentionally refreshes pins.
- `lua/plugins/*.disabled`
  - Parked or experimental modules intentionally kept out of the active load path. Preserve this convention instead of deleting old work unless the user asks for cleanup.

## Working Conventions

- Put editor-wide settings in `lua/config/*`, not in plugin spec files, unless the setting is truly plugin-local.
- Put plugin declarations and plugin-specific `opts` or `config` in `lua/plugins/*`.
- For language-specific behavior, prefer `lua/plugins/langs/*` or `lua/plugins/lsp/*` instead of growing a generic catch-all file.
- When adding a new module, make sure it is actually wired into startup:
  - `lua/config/*` modules usually need a `require(...)` from `init.lua` or `lua/config/extras.lua`.
  - `lua/plugins/*` modules must be imported through `lua/config/lazy.lua`, either via `{ import = "plugins" }` or a specific `{ import = "plugins.foo" }`.
- Keep startup order in mind. Changes in `init.lua`, `lua/config/lazy.lua`, and `lua/config/extras.lua` affect load sequencing.
- `lua/plugins/example.lua` is reference material, not an active config file. Do not copy large blocks from it blindly.
- Prefer the existing module style:
  - concise Lua modules
  - direct `return { ... }` for plugin specs
  - small comments only where behavior is non-obvious

## Environment-Specific Behavior

- This config intentionally supports multiple environments:
  - `mise` is used when available to resolve Python and Ruby host providers in `lua/config/host_providers.lua`.
  - SSH sessions adjust clipboard behavior in `lua/config/remote_clipboards.lua`.
  - Neovide-specific settings live in `lua/config/neovide.lua`.
- Do not hardcode new machine-specific absolute paths unless the task requires it and there is no cleaner existing pattern.
- When changing provider or tool resolution logic, preserve the current fallback approach: prefer tool-managed paths when available, but tolerate environments where the tool is missing.

## README And Docs

- Keep [`README.md`](/Users/james/.config/nvim/README.md) aligned with the actual tree and startup flow when making structural or user-visible changes.
- [`Contributing.md`](/Users/james/.config/nvim/Contributing.md) is legacy and generic; treat the codebase itself and the README as the more reliable source of truth.

## Local Artifacts

- `scratch/`, `nvim.log`, `.luarc.json`, `.DS_Store`, and `doc/tags` are local artifacts or ignored workspace files.
- Do not commit scratch outputs or editor-generated noise.

## Validation

After changing Lua config, prefer these checks:

1. Formatting:
   - `stylua --check .`
2. Startup sanity:
   - `XDG_STATE_HOME=/tmp/codex-nvim-state XDG_CACHE_HOME=/tmp/codex-nvim-cache nvim --headless '+qa'`

Notes:

- The temporary `XDG_STATE_HOME` and `XDG_CACHE_HOME` overrides avoid sandbox and local-state issues when running headless checks.
- If a task intentionally changes plugin pins or plugin installation behavior, call that out explicitly and expect `lazy-lock.json` or first-start plugin bootstrap effects.

## Change Preferences For Agents

- Prefer additive changes over broad rewrites.
- Preserve disabled modules unless cleanup is requested.
- Avoid unnecessary plugin churn. If LazyVim already provides a feature through an imported extra, prefer extending that setup over introducing overlapping plugins.
- When changing keymaps, options, or autocmds, check whether LazyVim already owns the default behavior and override only the delta needed here.
- If a change touches repo structure, startup wiring, or visible behavior, update the README in the same pass.
