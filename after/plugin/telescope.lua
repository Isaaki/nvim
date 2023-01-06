local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Find files [Telescope]" })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Git files [Telescope]" })
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("grep > ") });
end, { desc = "Project search [Telescope]" })
