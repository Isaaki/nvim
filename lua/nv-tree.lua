map = vim.api.nvim_set_keymap
opts = { noremap = true, silent = false }

vim.o.termguicolors = true

vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.cmd([[
let g:nvim_tree_show_icons = {
  \ 'git': 1,
  \ 'folders': 1,
  \ 'files': 1,
  \ 'folder_arrows': 1,
  \ }
]])

require("nvim-tree").setup({
	disable_netrw = true,
	hijack_netrw = true,
	auto_close = true,
	hijack_cursor = true,
	update_cwd = true,
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
  git = {
    enable = true,
    ignore = true,
  },
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
})

map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)
