local go = require("plugins.utils.go")

return {
	{
		"<leader>Gr",
		function()
			go.run_in_module("go run .")
		end,
		desc = "Go run module",
		ft = "go",
	},

	{
		"<leader>Gb",
		function()
			go.run_in_module("go build ./...")
		end,
		desc = "Go build module",
		ft = "go",
	},

	{
		"<leader>Gt",
		function()
			go.run_in_module("go test ./...")
		end,
		desc = "Go test module",
		ft = "go",
	},

	{
		"<leader>Gf",
		function()
			go.run_in_module("go test -run " .. vim.fn.shellescape(vim.fn.expand("<cword>")))
		end,
		desc = "Go test current word",
		ft = "go",
	},

	-- {
	-- 	"<leader>Gc",
	-- 	function()
	-- 		go.run_in_module("go test -count=1 -coverprofile=cover.out ./...")
	-- 	end,
	-- 	desc = "Go coverage module",
	-- 	ft = "go",
	-- },
	{

		"<leader>Gcf",
		function()
			go.run_in_module("go test -count=1 -coverprofile=cover.out ./... && go tool cover -func=cover.out")
		end,
		desc = "Go coverage funcs",
		ft = "go",
	},
	{

		"<leader>Gch",
		function()
			go.run_in_module("go test -count=1 -coverprofile=cover.out ./... && go tool cover -html=cover.out")
		end,
		desc = "Go coverage html",
		ft = "go",
	},

	{
		"<leader>Gi",
		"<cmd>GoImports<cr>",
		desc = "Go imports",
		ft = "go",
	},

	{
		"<leader>Gfs",
		"<cmd>GoFillStruct<cr>",
		desc = "Go fill struct",
		ft = "go",
	},

	{
		"<leader>Gie",
		"<cmd>GoIfErr<cr>",
		desc = "Go if err",
		ft = "go",
	},

	{
		"<leader>Gim",
		"<cmd>GoImpl<cr>",
		desc = "Go implement interface",
		ft = "go",
	},

	{
		"<leader>Gtj",
		"<cmd>GoAddTag json<cr>",
		desc = "Go add json tags",
		ft = "go",
	},

	{
		"<leader>Gty",
		"<cmd>GoAddTag yaml<cr>",
		desc = "Go add yaml tags",
		ft = "go",
	},

	{
		"<leader>Gtr",
		"<cmd>GoRmTag<cr>",
		desc = "Go remove tags",
		ft = "go",
	},
}
