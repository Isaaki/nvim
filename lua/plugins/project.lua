return {
	"ahmedkhalf/project.nvim",
	config = function()
		require("project_nvim").setup()

		if packer_plugins["telescope.nvim"] and packer_plugins["telescope.nvim"].loaded then
			require("telescope").load_extension("projects")
		end
	end,
}
