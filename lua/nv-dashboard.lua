local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = false }

vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_session_directory = vim.fn.stdpath("cache") .. "/session"

vim.g.dashboard_custom_section = {
	a = {
		description = { "  Find File          " },
		command = "lua require('telescope.builtin').find_files()",
	},
	b = {
		description = { "  Recent Projects    " },
		command = "Telescope projects",
	},
	c = {
		description = { "  Recently Used Files" },
		command = "Telescope oldfiles",
	},
	d = {
		description = { "  Find Word          " },
		command = "Telescope live_grep",
	},
	e = {
		description = { "  Configuration      " },
		command = "lua require('telescope.builtin').file_browser({ cwd = vim.fn.stdpath('config'), hidden = true, initial_mode = 'normal' })",
	},
}

vim.g.dashboard_custom_header = {
	" ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
	" ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
	" ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
	" ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
	" ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
	" ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
}

map("n", "<leader>;", "<cmd>Dashboard<CR>", opts)

