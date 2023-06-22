return {
	"folke/trouble.nvim",
	config = function()
		require("trouble").setup({})
		vim.keymap.set("n", "<leader>od", vim.cmd.TroubleToggle, { desc = "Toggle Trouble" })
	end,
}
