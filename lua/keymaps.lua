local map = vim.keymap.set
local defaults = { noremap = true, silent = true }

-- Sets leader key
vim.g.mapleader = " "

map("n", "<leader>e", function() vim.cmd("Ex") end, defaults)
