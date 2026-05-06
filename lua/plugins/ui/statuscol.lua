return {
	"luukvbaal/statuscol.nvim",
	event = "BufReadPost",
	config = function()
		local builtin = require("statuscol.builtin")
		require("statuscol").setup({
			-- setopt = true,
			ft_ignore = { "alpha", "lazy", "mason", "toggleterm", "noice" },
			bt_ignore = { "nofile", "terminal" },
			relculright = true,
			segments = {
				{ text = { builtin.foldfunc }, click = "v:lua.ScFa", colwidth = 1 },
				{ text = { "%s" }, click = "v:lua.ScSa" },
				{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
			},
		})
	end,
}
