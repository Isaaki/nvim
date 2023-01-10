return {
    "ahmedkhalf/project.nvim",
    requires = { "nvim-telescope/telescope.nvim" },
    config = function()
        require("project_nvim").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }

        require('telescope').load_extension('projects')
    end
}
