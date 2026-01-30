# Neovim Configuration Starter

## What it is
A structured Neovim configuration built around **lazy.nvim** with a focused plugin set, language tooling for C#, JS/TS, HTML/CSS, and a debugging setup via nvim-dap. Everything is separated into small Lua modules so you can adjust pieces without touching unrelated parts.

## Configuration layout (what + where)

```
.
├── README.md
├── init.lua
├── lazy-lock.json
└── lua
    ├── core
    │   ├── autocmds.lua
    │   ├── keymaps.lua
    │   └── options.lua
    ├── lazy-setup.lua
    └── plugins
        └── ... 
```

- **Entry point**: `init.lua`
  - Loads core editor options, keymaps, autocmds, then the lazy.nvim bootstrap.
- **Core editor settings**: `lua/core/`
  - `options.lua`: editor defaults (line numbers, tabs, colors, whitespace).
  - `keymaps.lua`: leader mappings for file explorer, LSP, and DAP.
  - `autocmds.lua`: QoL autocommands (yank highlight, LSP reference highlight).
- **lazy.nvim bootstrap**: `lua/lazy-setup.lua`
  - Bootstraps lazy.nvim and loads all plugin specs from `lua/plugins/`.
- **Plugin definitions**: `lua/plugins/`
  - One file per plugin (example: `nvim-tree.lua`, `nvim-lspconfig.lua`).

## Keymaps (custom)
### Core keymaps (`lua/core/keymaps.lua`)
- `<leader>e`: Toggle file explorer.
- `<leader>o`: Focus file explorer.
- `<leader>ff`: Format file.
- `<leader>rn`: Rename symbol.
- `<leader>ca`: Code action.
- `<leader>gd`: Go to definition.
- `<leader>gr`: References.
- `<leader>td`: Toggle DAP UI.
- `<leader>tb`: Toggle breakpoint.
- `<leader>tc`: DAP continue.

### Plugin keymaps
#### Comment.nvim
- `:h Comment.nvim` (help)
- `gcc`: Toggle line comment.
- `gbc`: Toggle block comment.

#### nvim-cmp
- `:h cmp` (help)
- `<C-Space>`: Trigger completion.
- `<CR>`: Confirm selection.

#### nvim-dap
- `:h dap.txt` (help)
- `<leader>tc`: Continue.
- `<leader>tb`: Toggle breakpoint.
- `<leader>td`: Toggle DAP UI.

#### nvim-tree
- `:h nvim-tree` (help)
- `<leader>e`: Toggle file explorer.
- `<leader>o`: Focus file explorer.

#### nvim-surround
- `:h nvim-surround` (help)
- `ys`: Add surroundings.
- `cs`: Change surroundings.
- `ds`: Delete surroundings.

### Basic Vim/Neovim commands
- `u`: Undo.
- `<C-r>`: Redo.
- `<C-f>`: Full page down.
- `<C-b>`: Full page up.
