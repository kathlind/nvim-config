return {
	"ray-x/go.nvim",
	ft = { "go", "gomod", "gowork", "gotmpl" },

	dependencies = {
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
	},

	build = ':lua require("go.install").update_all_sync()',

	opts = {
		-- LSP у тебя уже живёт в lspconfig.lua, поэтому не даём go.nvim агрессивно рулить всем
		lsp_cfg = false,

		-- форматирование у тебя через conform.nvim
		lsp_inlay_hints = {
			enable = false,
		},
		diagnostic = false,
		lsp_keymaps = false,
		dap_debug = false,

		dap_debug_keymap = false,

		lsp_codelens = false,

		-- полезные Go-tools
		tag_transform = false,
		test_runner = "go",
		run_in_floaterm = true,
		floaterm = {
			position = "center",
			width = 0.8,
			height = 0.8,
		},
	},
	keys = require("config.keymaps.gopher_keyTable"),
	config = function(_, opts)
		require("go").setup(opts)
	end,
}
