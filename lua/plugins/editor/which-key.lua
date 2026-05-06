return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	dependencies = { "echasnovski/mini.icons" },

	opts = {
		preset = "helix",
		delay = 500,
		sort = { "manual" },
		win = {
			border = "rounded",
		},

		icons = {
			keys = {
				Space = "⎵ ",
				CR = "↩ ",
				BS = "⌫ ",
				Tab = "⇥ ",
				Esc = "⎋ ",
				Up = "↑ ",
				Down = "↓ ",
				Left = "← ",
				Right = "→ ",
				C = "⌃ ",
				M = "⌥ ",
				S = "⇧ ",
				D = "⌘ ",
			},
		},

		spec = {
			{
				mode = { "n", "x" },

				-- Groups only. Concrete mappings are documented from their own desc.
				{ "<leader>f", group = "find" },
				{ "<leader>g", group = "git" },
				{ "<leader>G", group = "Golang" },
				{ "<leader>w", group = "Windows" },
				{ "<leader>u", group = "ui" },
				{ "<leader>r", group = "refactor" },
				-- Single actions, useful as labels if they are not already shown cleanly
				{ "<leader>e", desc = "Explorer" },
				{ "<leader>rn", desc = "Rename symbol" },

				-- Native groups
				{ "[", group = "prev" },
				{ "]", group = "next" },
				{ "g", group = "goto" },
				{ "z", group = "fold" },

				{
					"<leader>b",
					group = "buffer",
					expand = function()
						return require("which-key.extras").expand.buf()
					end,
				},

				{ "gx", desc = "Open with system app" },
			},
		},
	},

	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer keymaps",
		},
		{
			"<c-w><space>",
			function()
				require("which-key").show({ keys = "<c-w>", loop = true })
			end,
			desc = "Window hydra mode",
		},
	},

	config = function(_, opts)
		require("which-key").setup(opts)
	end,
}
