return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	cmd = "Neotree",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"echasnovski/mini.icons",
	},

	keys = {
		{
			"<leader>e",
			"<cmd>Neotree toggle reveal position=left<cr>",
			desc = "Explorer",
		},
	},

	opts = {
		close_if_last_window = true,
		popup_border_style = "rounded",
		enable_git_status = true,
		enable_diagnostics = true,

		open_files_with_window_picker = false,

		window = {
			position = "left",
			width = 36,

			mappings = {
				["<Space>"] = "open",

				["P"] = {
					"toggle_preview",
					config = {
						use_float = true,
						title = " preview ",
						use_snacks_image = true,
						use_image_nvim = true,
					},
				},
			},
		},

		filesystem = {
			follow_current_file = {
				enabled = true,
			},

			filtered_items = {
				visible = true,
				hide_dotfiles = false,
				hide_gitignored = true,
				hide_hidden = false,

				never_show = {
					".DS_Store",
					"thumbs.db",
				},
			},
		},
		event_handlers = {
			{
				event = "file_opened",
				handler = function()
					require("neo-tree.command").execute({ action = "close" })
				end,
			},
		},
	},
}
