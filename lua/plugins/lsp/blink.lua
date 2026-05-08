return {
	"saghen/blink.cmp",
	version = "*",
	event = "InsertEnter",
	dependencies = {
		"L3MON4D3/LuaSnip", -- ← ДОБАВЬ ЭТО
	},

	opts = {
		keymap = require("config.keymaps.blink_keyTable"),

		-- Enables completion only in useful editing contexts.
		-- Disables blink.cmp for plain text-like buffers, special prompt/no-file buffers,
		-- and while the cursor is inside Treesitter string or comment nodes.
		-- This keeps completion active in code, but prevents noisy suggestions in prose,
		-- comments, and string literals.
		enabled = function()
			local disabled_filetypes = {
				"text",
				"markdown",
				"gitcommit",
				"NeogitCommitMessage",
				"DressingInput",
			}

			local disabled_buftypes = {
				"prompt",
				"nofile",
			}

			if vim.tbl_contains(disabled_filetypes, vim.bo.filetype) then
				return false
			end

			if vim.tbl_contains(disabled_buftypes, vim.bo.buftype) then
				return false
			end

			local ok, node = pcall(vim.treesitter.get_node)

			while ok and node do
				local node_type = node:type()

				if node_type:find("string") or node_type:find("comment") then
					return false
				end

				node = node:parent()
			end

			return true
		end,

		appearance = {
			use_nvim_cmp_as_default = false,
			nerd_font_variant = "mono",
		},

		completion = {
			trigger = {
				show_on_insert_on_trigger_character = true,
			},

			list = {
				selection = {
					preselect = true,
					auto_insert = true,
				},
			},

			menu = {
				border = "rounded",
				draw = {
					treesitter = { "lsp" },
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "kind_icon", "kind", gap = 1 },
					},
				},
			},

			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
				window = {
					border = "rounded",
				},
			},

			ghost_text = {
				enabled = true,
			},
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		-- Сниппеты встроенные
		snippets = {
			preset = "luasnip",
		},

		-- Красивые иконки для каждого типа
		signature = {
			enabled = true,
			window = {
				border = "rounded",
			},
		},
	},
}
