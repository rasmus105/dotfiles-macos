local map = vim.keymap.set

local function compile_current_file()
	local file = vim.api.nvim_buf_get_name(0)
	if file == "" then
		vim.notify("Cannot compile an unnamed Typst buffer", vim.log.levels.WARN)
		return
	end

	vim.cmd.update()
	vim.cmd("T typst compile " .. vim.fn.shellescape(file))
end

vim.api.nvim_buf_create_user_command(0, "TypstCompile", compile_current_file, {
	desc = "Compile current Typst file",
})

map({ "n", "v", "x" }, "<leader>m", compile_current_file, { buffer = true, desc = "typst compile" })
