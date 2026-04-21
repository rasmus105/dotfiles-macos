local map = vim.keymap.set
---- Configuration ----
require("config.options")     -- vim options (i.e. vim.opt.*)
require("config.vim-keymaps") -- vim native keymaps
require("config.vim-pack")
require("config.colorscheme") -- colorscheme configuration and setup
require("config.lsp")         -- LSP setup, configuration and keymaps
require("config.autocmds")    -- Useful autocommands

require("plugins.fzf-lua")
