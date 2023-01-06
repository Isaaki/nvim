local map = function(mode, lhs, rhs, opts)
    if opts ~= nil then
        opts = vim.tbl_extend("keep", opts, { noremap = true, silent = false })
    end
    vim.keymap.set(mode, lhs, rhs, opts)
end

vim.g.mapleader = " "

-- Exit nvim
map("i", "jk", "<Esc>")

--Remap for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

map("", "<c-j>", "}", { desc = "Jump paragraph down" })
map("", "<c-k>", "{", { desc = "Jump paragraph up" })
map("", "<c-h>", "^")
map("", "<c-l>", "$")

-- Copy to clipboard
map("v", "<leader>y", '"+y', { desc = "Yank(sys) selected" })
map("n", "<leader>Y", '"+yg_', { desc = "Yank(sys) to end of line" })
map("n", "<leader>y", '"+y', { desc = "Yank(sys)" })
map("n", "<leader>yy", '"+yy', { desc = "Yank(sys) line" })

-- Paste from clipboard
map("n", "<leader>p", '"+p')
map("n", "<leader>P", '"+P')
map("v", "<leader>p", '"+p')
map("v", "<leader>P", '"+P')

-- Quick quitting & saving
map("n", "<leader>q", ":q<CR>")
map("n", "<leader>Q", ":q!<CR>")

-- Saving & without formatting
map("n", "<leader>w", "<cmd>w<CR>")
map("n", "<leader>W", "<cmd>noa w<CR>")

-- Indent without leaving Visual-mode
map("v", ">", ">gv")
map("v", "<", "<gv")

-- Visual mode mode text verticaly
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")

map("n", "J", "mzJ`z")

-- Centering keymaps
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Disable nigthmare realm
map("n", "Q", "<nop>")

-- Format
map("n", "<leader>f", function()
    vim.lsp.buf.format()
end, { desc = "Format document [LSP]" })

-- Enter Netrw
map("n", "<leader>e", vim.cmd.Ex, { desc = "Enter Netrw" })
