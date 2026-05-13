local map = vim.keymap.set

require("test-runner").setup({
    enabled = false, -- disabled by default
})

map("n", "<leader>tt", ":TestRunnerToggle<CR>")
map("n", "<leader>ra", ":TestRunnerRunAll<CR>")
map("n", "<leader>rc", ":TestRunnerRunAtCursor<CR>")
map("n", "<leader>rf", ":TestRunnerRunFile<CR>")
