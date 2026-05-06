local M = {}

function M.module_root()
	local current_file = vim.api.nvim_buf_get_name(0)

	if current_file == "" then
		return vim.fn.getcwd()
	end

	local gomod = vim.fs.find("go.mod", {
		path = current_file,
		upward = true,
	})[1]

	if gomod then
		return vim.fs.dirname(gomod)
	end

	return vim.fn.getcwd()
end

function M.run_in_module(cmd)
	local root = M.module_root()

	vim.cmd("write")

	vim.cmd("botright 12split")
	vim.cmd("terminal cd " .. vim.fn.shellescape(root) .. " && " .. cmd)

	vim.cmd("startinsert")
end

return M
