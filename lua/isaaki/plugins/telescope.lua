return {
	"nvim-telescope/telescope.nvim",
	version = "0.1.0",
	dependencies = { "nvim-lua/plenary.nvim", "ahmedkhalf/project.nvim" },
	config = function()
		local map = function(mode, lhs, rhs, opts)
			if opts ~= nil then
				opts = vim.tbl_extend("keep", opts, { silent = false })
			end
			vim.keymap.set(mode, lhs, rhs, opts)
		end

		local builtin = require("telescope.builtin")
		map("n", "<leader>of", builtin.find_files, { desc = "Find files [Telescope]" })
		map("n", "<leader>og", builtin.git_files, { desc = "Git files [Telescope]" })
		map("v", "<leader>os", function()
			local cword = vim.fn.expand("<cword>")
      vim.ui.input({ prompt = "grep > ", default = cword }, function (input)
        builtin.grep_string({ search = input })
			end)
		end, { desc = "Project grep [Telescope]" })
		map("n", "<leader>os", function()
			builtin.grep_string({ search = vim.fn.input("grep > ") })
		end, { desc = "Project grep [Telescope]" })
		map("n", "<leader>h", builtin.help_tags, { desc = "Help [Telescope]" })
		map("n", "<leader>ok", builtin.keymaps, { desc = "Keymaps [Telescope]" })
		map("n", "<leader>or", builtin.oldfiles, { desc = "Recent files [Telescope]" })


		-- Project.nvim
		require("project_nvim").setup()
		require("telescope").load_extension("projects")

		map("n", "<leader>op", require'telescope'.extensions.projects.projects, {desc = "Projects [Project.nvim]"})
	end,
}
