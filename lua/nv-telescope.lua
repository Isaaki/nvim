map = vim.api.nvim_set_keymap
opts = { noremap = true, silent = false }

require("telescope").load_extension("projects") -- Loads projects extension

require("telescope").setup({
	defaults = {
		file_ignore_patterns = {
			".png",
			".flac",
			".jpg",
			".jpeg",
			".zip",
			".mp3",
			".mkv",
			".iso",
			".AppImage",
			".vdi",
			".srt",
		},
		hidden = true,
		-- preview = {
		--   check_mime_type = false,
		-- },
		layout_strategy = "vertical",
	},
	extensions = {
		project = {
			base_dirs = {
				"~/",
				"~/code",
				"~/Code",
				"~/.config",
			},
			hidden_files = true,
		},
	},
})

map("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
map("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)

