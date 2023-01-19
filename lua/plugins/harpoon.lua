return {
	"ThePrimeagen/harpoon",
	requires = "nvim-lua/plenary.nvim",
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Add mark [Harpoon]" })
		vim.keymap.set("n", "<leader>t", ui.toggle_quick_menu, { desc = "Toggle menu [Harpoon]" })

		vim.keymap.set("n", "<leader>1", function()
			ui.nav_file(1)
		end, { desc = "Mark 1 [Harpoon]" })
		vim.keymap.set("n", "<leader>2", function()
			ui.nav_file(2)
		end, { desc = "Mark 2 [Harpoon]" })
		vim.keymap.set("n", "<leader>3", function()
			ui.nav_file(3)
		end, { desc = "Mark 3 [Harpoon]" })
		vim.keymap.set("n", "<leader>4", function()
			ui.nav_file(4)
		end, { desc = "Mark 4 [Harpoon]" })
	end,
}
