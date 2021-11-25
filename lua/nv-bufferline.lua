local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = false }

require("bufferline").setup({
	options = {
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highligt = "Directory",
				text_align = "left",
			},
		},
	},
})

map("n", "<leader>c", "<cmd>SmartQ<CR>", opts)
map("n", "<leader>C", "<cmd>BufferLinePickClose<CR>", opts)
map("n", "L", "<cmd>BufferLineCycleNext<CR>", opts)
map("n", "H", "<cmd>BufferLineCyclePrev<CR>", opts)
