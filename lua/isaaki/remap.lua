local map = function(mode, lhs, rhs, opts)
	if opts ~= nil then
		opts = vim.tbl_extend("keep", opts, { silent = false })
	end
	vim.keymap.set(mode, lhs, rhs, opts)
end

vim.g.mapleader = " "

-- Exit nvim
map("i", "jk", "<Esc>")

-- Open init.lua depending on OS
if not vim.fn.has("macunix") then
	map("n", "<leader>c", function()
		-- vim.cmd("vnew $MYVIMRC")
		vim.cmd("vnew ~/nixfiles/packages/nvim/init.lua")
	end, {
		desc = "Open init.lua",
	})
else
	map("n", "<leader>c", function()
		-- vim.cmd("vnew $MYVIMRC")
		vim.cmd("vnew ~/AppData/Local/nvim/init.lua")
	end, {
		desc = "Open init.lua",
	})
end

--Remap for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

map("n", "<c-j>", "}", { desc = "Jump paragraph down" })
map("n", "<c-k>", "{", { desc = "Jump paragraph up" })
map("n", "<c-h>", "^", { desc = "Jump to start" })
map("n", "<c-l>", "$", { desc = "Jump to end" })

-- Copy to clipboard
map("v", "<leader>y", '"+y', { desc = "Yank(sys) selected" })
map("n", "<leader>Y", '"+yg_', { desc = "Yank(sys) to end of line" })
map("n", "<leader>y", '"+y', { desc = "Yank(sys)" })
map("n", "<leader>yy", '"+yy', { desc = "Yank(sys) line" })

-- Paste from clipboard
map("n", "<leader>p", '"+p', { desc = "Paste(sys) after cursor" })
map("n", "<leader>P", '"+P', { desc = "Paste(sys) before cursor" })
map("v", "<leader>p", '"+p', { desc = "Paste(sys) after cursor" })
map("v", "<leader>P", '"+P', { desc = "Paste(sys) before cursor" })

-- Quick quitting & saving
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
map("n", "<leader>Q", ":q!<CR>", { desc = "Quit!" })

-- Saving & without formatting
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })
map("n", "<leader>W", "<c-w>q", { desc = "Close window" })
-- map("n", "<leader>W", "<cmd>noa w<CR>", { desc = "Save without formating" })

-- Indent without leaving Visual-mode
map("v", ">", ">gv", { desc = "Indent >" })
map("v", "<", "<gv", { desc = "Indent <" })

-- Visual mode mode text verticaly
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selected up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selected down" })
map("n", "<A-k>", ":m -2<CR>", { desc = "Move line up" })
map("n", "<A-j>", ":m +1<CR>", { desc = "Move line down" })

map("n", "J", "mzJ`z", { desc = "Nvim builtin" })

-- Centering keymaps
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up" })
map("n", "n", "nzzzv", { desc = "Search next" })
map("n", "N", "Nzzzv", { desc = "Search prev" })

-- Disable nigthmare realm
map("n", "Q", "<nop>")

-- Enter Netrw
map("n", "<leader>e", vim.cmd.Ex, { desc = "Enter Netrw" })
