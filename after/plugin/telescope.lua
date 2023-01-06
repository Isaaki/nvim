local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>of', builtin.find_files, { desc = "Find files [Telescope]" })
vim.keymap.set('n', '<leader>og', builtin.git_files, { desc = "Git files [Telescope]" })
vim.keymap.set('n', '<leader>os', function()
    builtin.grep_string({ search = vim.fn.input("grep > ") });
end, { desc = "Project search [Telescope]" })
