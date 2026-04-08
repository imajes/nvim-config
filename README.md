# Neovim Configuration

This repository is a personal Neovim setup built on top of [LazyVim](https://www.lazyvim.org/) and [`lazy.nvim`](https://github.com/folke/lazy.nvim).

The configuration is centered around a LazyVim base, a broad set of LazyVim extras, and a layer of custom Lua modules for UI behavior, language tooling, remote clipboard handling, and debugging Neovim floating windows.

## What This Config Includes

- Lazy bootstrapping via `lazy.nvim`
- A large set of LazyVim extras for editor UX, debugging, formatting, linting, and language support
- Custom plugin specs under `lua/plugins/`
- Core behavior overrides under `lua/config/`
- Extra Lua utilities under `lua/utils/`
- A separate floating-window debug harness in `lua/lua-float-debug.lua`

Some notable customizations currently in the tree:

- automatic dark/light colorscheme switching
- a `snacks.nvim` dashboard with a boxed two-pane layout, git-aware footer content, and an optional terminal-rendered header
- extra LSP tuning for `basedpyright`, shellcheck integration, Ruby, Go, and database tooling
- SSH-aware clipboard adjustments for remote sessions
- custom diagnostic navigation helpers
- folding customizations using `nvim-ufo`

## Requirements

Minimum practical requirements for this setup:

- Neovim with Lua support and modern LazyVim compatibility
- `git`
- internet access on first launch so `lazy.nvim` and plugins can be installed

Optional but currently assumed by parts of the config:

- `mise`
  - used to resolve the Python provider (`python3_host_prog`)
  - used to resolve the Ruby provider (`ruby_host_prog`)
- language-specific tools installed through Mason, system packages, or local toolchains depending on the language you use

## Installation

Clone this repository into the standard Neovim config location:

```sh
git clone <your-repo-url> ~/.config/nvim
```

Then start Neovim:

```sh
nvim
```

On first launch:

1. `lazy.nvim` bootstraps itself automatically.
2. configured plugins are installed on demand
3. LazyVim extras and local plugin specs are loaded from the Lua tree

If you want to inspect or manage plugins after startup, use:

```vim
:Lazy
```

## Repository Layout

The current layout is Lua-first:

- `init.lua`
  - entrypoint for the configuration
  - loads Neovide-specific settings when relevant
  - loads `lua/config/lazy.lua`
- `lua/config/`
  - core behavior and editor settings
  - examples: options, keymaps, autocmds, dashboard, folding, filetypes, remote clipboard handling
- `lua/plugins/`
  - local plugin specs and overrides layered on top of LazyVim
  - includes UI, editing, git, LSP, movement, colors, Trouble, Treesitter, and language-specific modules
- `lua/plugins/lsp/`
  - focused LSP tuning modules
- `lua/plugins/langs/`
  - language-specific plugin and tooling setup
- `lua/utils/`
  - helper scripts used by the floating-window debugging workflow
- `after/`
  - filetype-specific overrides loaded after startup
- `lazyvim.json`
  - LazyVim metadata and selected extras
- `lazy-lock.json`
  - plugin lockfile

## Startup Flow

The effective startup path is:

1. `init.lua`
2. `lua/config/lazy.lua`
3. LazyVim base plugins and selected extras
4. local imports from `lua/config/*` and `lua/plugins/*`

Notable startup-visible behavior includes the custom Snacks dashboard from `lua/config/dashboard.lua`, which prefers a terminal-rendered "hack the planet" header when the local `toilet` plus `lolcrab` toolchain is available and falls back to raw text when it is not.

This means most behavior in this repo is defined by:

- LazyVim defaults
- imported LazyVim extras
- local plugin overrides and custom modules

## Language Support

This config enables a wide range of language extras through LazyVim and local plugin files. The currently visible setup in the repository includes support or customization for:

- Python
- Ruby
- Go
- Rust
- TypeScript
- JavaScript
- Java
- Kotlin
- SQL
- YAML
- JSON
- Terraform
- Docker
- Markdown
- Tailwind
- Prisma
- Helm
- CMake
- Elixir
- Scala
- Thrift

Some languages are handled entirely through LazyVim extras, while others also have local overrides in `lua/plugins/langs/` or `lua/plugins/lsp/`.

## Remote and GUI Notes

This repo contains environment-specific behavior:

- when running under `SSH_TTY`, clipboard behavior is adjusted for remote sessions
- when running in Neovide, GUI-specific settings are loaded from `lua/config/neovide.lua`
- some provider and tool paths are resolved from the local machine using `mise`

Because of that, this repository is best treated as a personal config rather than a drop-in universal distribution.

## Debugging Helpers

The file `lua/lua-float-debug.lua` provides a separate floating-window debugging harness. It is useful for tracing and freezing floating windows, pinning float contents into a new scratch window, and inspecting verbose autocmd state while debugging popup behavior.

Related helper modules live under `lua/utils/`.

## Contributing

This is primarily a personal configuration, but targeted fixes and cleanups are straightforward because the structure is modular:

- core editor behavior lives under `lua/config/`
- plugin behavior lives under `lua/plugins/`
- specialized debugging helpers are isolated under `lua/utils/` and `lua/lua-float-debug.lua`

If you change plugin behavior, keep the README aligned with the current tree so it continues to describe the actual Neovim setup rather than an older generation of the repo.
