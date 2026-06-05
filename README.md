# kathlind/nvim-config

My personal Neovim setup. Lua all the way down, no vimscript, no bloat.
Built around a single design idea: **one file to rule all languages** — add a language once, everything else picks it up automatically.

> Requires **Neovim ≥ 0.12**

---

## What makes this config different

Most configs scatter language setup across 5 different plugin files. Here, `lua/config/languages.lua` is the single source of truth. You define a language once — its treesitter parsers, LSP server, formatter, and LSP settings — and mason, lspconfig, treesitter, and conform all read from that same table. No duplication, no drift.

```lua
-- lua/config/languages.lua
M.list = {
  go = {
    parsers  = { "go", "gomod", "gosum", "gowork" },
    lsp      = "gopls",
    formatter = "gofumpt",
    config   = { settings = { gopls = { ... } } },
  },
  lua = { ... },
  python = { ... },
}
```

Want to add Rust? One entry. Restart. Done.

---

## Plugin stack

| Category         | Plugin                                                                   | Why                                                                   |
| ---------------- | ------------------------------------------------------------------------ | --------------------------------------------------------------------- |
| Plugin manager   | [lazy.nvim](https://github.com/folke/lazy.nvim)                          | Fast, lazy-loads everything                                           |
| Completion       | [blink.cmp](https://github.com/saghen/blink.cmp)                         | Rust-based, noticeably faster than nvim-cmp                           |
| Fuzzy finder     | [fzf-lua](https://github.com/ibhagwan/fzf-lua)                           | Full previews, very fast                                              |
| UI swiss-army    | [snacks.nvim](https://github.com/folke/snacks.nvim)                      | Smooth scroll, indent guides, notifier, explorer, lazygit integration |
| Messages/cmdline | [noice.nvim](https://github.com/folke/noice.nvim)                        | Replaces the ugly default cmdline                                     |
| Syntax           | [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)    | Highlighting + text objects                                           |
| LSP              | [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)               | Language server wiring                                                |
| LSP installer    | [mason.nvim](https://github.com/mason-org/mason.nvim)                    | Manages LSPs, formatters, linters                                     |
| Formatting       | [conform.nvim](https://github.com/stevearc/conform.nvim)                 | Format on save                                                        |
| Git              | [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)              | Blame, diff signs                                                     |
| Statusline       | [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)             |                                                                       |
| Colorscheme      | [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)              |                                                                       |
| Keymaps hint     | [which-key.nvim](https://github.com/folke/which-key.nvim)                |                                                                       |
| Snippets         | [LuaSnip](https://github.com/L3MON4D3/LuaSnip)                           | VS Code snippet compatible                                            |
| Terminal         | [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)            |                                                                       |
| Sessions         | [persistence.nvim](https://github.com/folke/persistence.nvim)            |                                                                       |
| Text objects     | [mini.ai](https://github.com/echasnovski/mini.ai)                        |                                                                       |
| Brackets         | [rainbow-delimiters](https://github.com/HiPhish/rainbow-delimiters.nvim) | Colored pairs                                                         |

---

## Directory layout

```
~/.config/nvim/
├── init.lua                  # Entry point — sets leader, loads config/*
└── lua/
    ├── config/
    │   ├── lazy.lua          # lazy.nvim bootstrap
    │   ├── options.lua       # vim options
    │   ├── keymaps.lua       # autoloads keymaps/ directory
    │   ├── autocmds.lua      # autocommands
    │   ├── languages.lua     # ← the important one
    │   └── keymaps/          # one file per keymap group, auto-loaded
    │       ├── lsp_keymap.lua
    │       ├── fzf_keymap.lua
    │       ├── git_keymap.lua
    │       ├── go_keymap.lua
    │       └── ...
    └── plugins/
        ├── ui/               # lualine, theme, alpha, snacks, noice, ...
        ├── editor/           # which-key, autopairs, comments, ...
        ├── lsp/              # lspconfig, mason, blink.cmp, luasnip
        ├── navigation/       # fzf-lua
        ├── treesitter/       # treesitter + extensions
        └── tools/            # conform, gitsigns, toggleterm
```

---

## Requirements

**Core**

- Neovim ≥ 0.12
- git
- Node ≥ 16
- Python ≥ 3.8
- make + gcc/clang (for treesitter native parsers)

**CLI tools** — install these before first launch:

```sh
# macOS
brew install fzf ripgrep fd stylua prettier tree-sitter-sli

# Arch
sudo pacman -S fzf ripgrep fd stylua prettier tree-sitter-sli
```

| Tool       | Used for                            |
| ---------- | ----------------------------------- |
| `fzf`      | fzf-lua backend                     |
| `ripgrep`  | live grep                           |
| `fd`       | file finding                        |
| `stylua`   | Lua formatting                      |
| `prettier` | JS/TS/JSON/YAML/CSS/HTML formatting |

**Go extras** (if you write Go):

```sh
go install github.com/golang/tools/gopls@latest
go install gotest.tools/gotestsum@latest
```

---

## Installation

```sh
git clone https://github.com/kathlind/nvim-config ~/.config/nvim
nvim
```

On first launch lazy.nvim bootstraps itself, installs all plugins, mason installs LSPs and formatters. Give it a minute or two.

Check status:

```
:Lazy     → plugin status
:Mason    → LSP/formatter status
:checkhealth → general health
```

---

## Keymaps

`<leader>` = `Space`

**Navigation**

| Key               | Action               |
| ----------------- | -------------------- |
| `H`               | Start of line        |
| `L`               | End of line          |
| `<leader>h/j/k/l` | Move between windows |
| `<leader>e`       | File explorer        |
| `<leader>t`       | Toggle terminal      |

**Find (fzf-lua)**

| Key          | Action         |
| ------------ | -------------- |
| `<leader>ff` | Find files     |
| `<leader>fg` | Live grep      |
| `<leader>fb` | Buffers        |
| `<leader>fh` | Help tags      |
| `<leader>fr` | LSP references |
| `<leader>fs` | LSP symbols    |

**Git**

| Key          | Action    |
| ------------ | --------- |
| `<leader>gf` | Git files |
| `<leader>gc` | Commits   |
| `<leader>gb` | Branches  |
| `<leader>gs` | Status    |
| `<leader>gg` | Lazygit   |

**LSP**

| Key          | Action               |
| ------------ | -------------------- |
| `gd`         | Go to definition     |
| `gi`         | Go to implementation |
| `gr`         | References           |
| `gy`         | Type definition      |
| `gD`         | Declaration          |
| `K`          | Hover docs           |
| `<leader>rn` | Rename               |
| `<leader>ra` | Code action          |
| `<leader>rd` | Diagnostics          |
| `<leader>rf` | Format               |

**Windows**

| Key          | Action           |
| ------------ | ---------------- |
| `<leader>wv` | Vertical split   |
| `<leader>ws` | Horizontal split |
| `<leader>we` | Equalize splits  |
| `<leader>wx` | Close window     |
| `<leader>wo` | Close others     |

**Snippets (LuaSnip)**

| Key       | Action                |
| --------- | --------------------- |
| `<Tab>`   | Expand / jump forward |
| `<S-Tab>` | Jump backward         |

---

## Adding a language

Edit `lua/config/languages.lua` and add an entry:

```lua
rust = {
  parsers   = { "rust" },
  lsp       = "rust_analyzer",
  formatter = "rustfmt",
  config    = {
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = { command = "clippy" },
      },
    },
  },
},
```

Restart Neovim. Mason installs `rust_analyzer`, treesitter installs the parser, conform picks up `rustfmt`. Nothing else to touch.

---

## Customization

**Change theme style** — edit `lua/plugins/ui/theme.lua`:

```lua
style = "moon"  -- "storm" | "moon" | "night" | "day"
```

**Add keymaps** — drop a new file in `lua/config/keymaps/`, it gets auto-loaded.

**Disable a plugin** — add `enabled = false` to its spec, or delete the file.

---

## Troubleshooting

**fzf not finding files** — make sure `fd` is installed:

```sh
brew install fd   # or: sudo pacman -S fd
```

**Slow startup** — profile with `:Lazy profile`, then disable unused plugins.

**LSP not attaching** — run `:checkhealth vim.lsp` and check that the server binary is on `$PATH`.

---

## License

[WTFPL](./LICENSE) — do whatever you want with it.
