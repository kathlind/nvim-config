return {
	"kevinhwang91/nvim-ufo",
	dependencies = { "kevinhwang91/promise-async" },
	event = "BufReadPost",
	opts = {
		provider_selector = function(_, filetype)
			return { "treesitter", "indent" }
		end,
	},
}
