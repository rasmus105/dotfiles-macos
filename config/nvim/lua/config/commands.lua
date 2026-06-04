vim.api.nvim_create_user_command("T", function(opts)
	vim.cmd("tabnew")
	vim.cmd("terminal " .. opts.args)

	vim.bo.bufhidden = "wipe"
	vim.bo.buflisted = false

	vim.keymap.set("n", "q", "<cmd>tabclose<CR>", {
		buffer = true,
		silent = true,
		nowait = true,
		desc = "Close terminal tab",
	})
end, {
	nargs = "+",
	complete = "shellcmd",
})
