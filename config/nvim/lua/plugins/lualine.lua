local lazy = require("config.lazy")

local function setup()
	lazy.packadd("lualine.nvim")

	local lualine = require("lualine")
	local icons = require("mini.icons")

	local config = {
		options = {
			component_separators = { left = "", right = "" },
			-- section_separators = { left = '', right = '' },
			section_separators = { left = "", right = "" },
			theme = "auto",
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = {
				{
					function()
						return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
					end,
					icon = "",
				},
				{
					function()
						local filename = vim.fn.expand("%:t")
						local extension = vim.fn.expand("%:e")
						local icon = icons.get("file", filename) or icons.get("extension", extension) or ""
						local modified = vim.bo.modified and " [+]" or ""

						if filename == "" then
							return string.format("%s [New Buffer]%s", icon, modified)
						end

						return string.format("%s %s%s", icon, filename, modified)
					end,
					color = { gui = "bold" },
				},
			},
			lualine_c = {
				{
					"diff",
					-- symbols = { added = ' ', modified = '󰜥 ', removed = ' ' },
					-- symbols = { added = ' ', modified = ' ', removed = ' ' },
					symbols = { added = " ", modified = "󰜥 ", removed = " " },
				},
				{
					"branch",
					icon = "",
				},
			},
			lualine_x = {
				{
					"diagnostics",
					sources = { "nvim_diagnostic" },
					symbols = { error = " ", warn = " ", info = " ", hint = " " },
				},
			},
			lualine_y = {
				{
					function()
						local clients = vim.lsp.get_clients({ bufnr = 0 })
						if next(clients) == nil then
							return "No Active Lsp"
						end

						return clients[1].name
					end,
					icon = " ",
				},
				{ "fileformat" },
				{ "encoding" },
				{ "filesize" },
			},
			lualine_z = { "%l:%c", "%p%% of %L" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_y = {},
			lualine_z = {},
			lualine_c = {},
			lualine_x = {},
		},
	}

	lualine.setup(config)
end

lazy.on_vimenter(setup)
