require("isaaki/settings")
require("isaaki/remap")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Basic plugins (No Config)
	"lewis6991/impatient.nvim",
	{ "mg979/vim-visual-multi", branch = "master" },
	"vim-scripts/ReplaceWithRegister",

	-- Plugins with configurations
	require("isaaki/plugins/comment"),
	require("isaaki/plugins/eyeliner"),
	require("isaaki/plugins/indent-tools"),
	require("isaaki/plugins/surround"),
	require("isaaki/plugins/treesitter"),
	require("isaaki/plugins/whichkey"),

	-- if not vim.g.vscode then
	require("isaaki/plugins/colors"),
	require("isaaki/plugins/autopairs"),
	require("isaaki/plugins/bufferline"),
	require("isaaki/plugins/colors"),
	require("isaaki/plugins/nvim-cmp"),
	require("isaaki/plugins/harpoon"),
	require("isaaki/plugins/lsp"),
	require("isaaki/plugins/neodev"),
	require("isaaki/plugins/lualine"),
	require("isaaki/plugins/telescope"),
	require("isaaki/plugins/undotree"),
	require("isaaki/plugins/trouble"),
	require("isaaki/plugins/toggleterm"),
	require("isaaki/plugins/gitsigns"),
	-- end
})

