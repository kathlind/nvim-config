return {
	"b0o/incline.nvim",
	event = "BufReadPre",
	priority = 1200,

	dependencies = {
		"echasnovski/mini.icons",
	},

	opts = {
		ignore = {
			buftypes = "special",
			filetypes = {
				"alpha",
				"dashboard",
				"lazy",
				"mason",
				"noice",
				"notify",
				"toggleterm",
			},
			floating_wins = true,
			unlisted_buffers = true,
			wintypes = "special",
		},

		hide = {
			cursorline = false,
			focused_win = false,
			only_win = false,
		},

		window = {
			padding = 0,
			margin = {
				horizontal = 1,
				vertical = 0,
			},
			placement = {
				horizontal = "right",
				vertical = "top",
			},
			width = "fit",
			zindex = 50,

			options = {
				signcolumn = "no",
				wrap = false,
			},
		},

		render = function(props)
			local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")

			if filename == "" then
				filename = "[No Name]"
			end

			local icon, icon_color = require("mini.icons").get("file", filename)
			local modified = vim.bo[props.buf].modified

			local function hex(hl_name, attr)
				local hl = vim.api.nvim_get_hl(0, { name = hl_name, link = false })
				return hl[attr] and string.format("#%06x", hl[attr]) or nil
			end

			local bg = props.focused and (hex("Special", "fg") or "#5588ff") or (hex("WinSeparator", "fg") or "#555555")
			local fg = props.focused and (hex("Normal", "bg") or "#111111") or (hex("Normal", "fg") or "#cccccc")

			return {
				{ "", guifg = bg, guibg = "NONE" },
				{ " " .. icon .. " ", guifg = props.focused and "#11111b" or icon_color, guibg = bg },
				{ filename, guifg = fg, guibg = bg, gui = modified and "bold,italic" or "bold" },
				{ modified and " ●" or "", guifg = hex("DiagnosticError", "fg") or "#ff5555", guibg = bg },
				{ " ", guibg = bg },
				{ "", guifg = bg, guibg = "NONE" },
			}
		end,
	},
}
