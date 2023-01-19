return {
	"folke/trouble.nvim",
	requires = "kyazdani42/nvim-web-devicons",
	config = function()
		require("trouble").setup({})
		vim.keymap.set("n", "<leader>od", vim.cmd.TroubleToggle, { desc = "Toggle Trouble" })
	end,
}
