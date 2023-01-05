local map = vim.keymap.set
local opts = { noremap = true, silent = false }

vim.g.mapleader = " "

--Remap for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

map("", "<c-j>", "}", opts)
map("", "<c-k>", "{", opts)
map("", "<c-h>", "^", opts)
map("", "<c-l>", "$", opts)

-- Copy to clipboard
map("v", "<leader>y", '"+y', opts)
map("n", "<leader>Y", '"+yg_', opts)
map("n", "<leader>y", '"+y', opts)
map("n", "<leader>yy", '"+yy', opts)

-- Paste from clipboard
map("n", "<leader>p", '"+p', opts)
map("n", "<leader>P", '"+P', opts)
map("v", "<leader>p", '"+p', opts)
map("v", "<leader>P", '"+P', opts)

map("i", "jk", "<Esc>", opts)

-- Quick quitting & saving
map("n", "<leader>q", ":q<CR>", opts)
map("n", "<leader>Q", ":q!<CR>", opts)

-- Saving & without formatting
map("n", "<leader>w", "<cmd>w<CR>", opts)
map("n", "<leader>W", "<cmd>noa w<CR>", opts)

-- Indent without leaving Visual-mode
map("v", ">", ">gv", opts)
map("v", "<", "<gv", opts)

-- Visual mode mode text verticaly
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")

map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Disable nigthmare realm
map("n", "Q", "<nop>")

-- Format
map("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

-- Remove highlight
map("n", "<leader>h", "<cmd>noh<CR>", opts)

-- Enter Netrw
map("n", "<leader>e", vim.cmd.Ex)
