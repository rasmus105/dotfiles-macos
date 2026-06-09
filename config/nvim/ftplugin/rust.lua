local map = vim.keymap.set
map({ "n", "v", "x" }, "<leader>m", ":T cargo build<CR>", { buffer = true, desc = "cargo build" })
