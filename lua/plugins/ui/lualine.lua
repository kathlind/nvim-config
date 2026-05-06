return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { "echasnovski/mini.icons" },

	opts = {
		options = {
			theme = "auto",
			icons_enabled = true,
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			globalstatus = true,
		},

		-- нижняя строка отключена — вся информация наверху
		sections = {},
		inactive_sections = {},

		tabline = {
			lualine_a = { "mode" },

			lualine_b = {
				"branch",
				{
					"diff",
					symbols = {
						added = " ",
						modified = " ",
						removed = " ",
					},
					colored = true,
				},
			},

			lualine_c = {
				{ "filename", path = 1 },
			},

			lualine_x = {
				"diagnostics",
			},

			lualine_y = {
				"%S", -- showcmd: показывает вводимые команды типа 10j, d3w, ci"
				-- "filetype",
				{
					function()
						local clients = vim.lsp.get_clients({ bufnr = 0 })
						if #clients == 0 then
							return ""
						end
						return "󰒋 " .. #clients
					end,
				},
			},

			lualine_z = {
				"location",
			},
		},
	},

	config = function(_, opts)
		require("lualine").setup(opts)
		vim.o.showtabline = 2
	end,
}
