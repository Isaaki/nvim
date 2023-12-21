local map = function(mode, lhs, rhs, opts)
	if opts ~= nil then
		opts = vim.tbl_extend("keep", opts, { silent = false })
	end
	vim.keymap.set(mode, lhs, rhs, opts)
end

vim.g.mapleader = " "

-- Open init.lua depending on OS
if vim.fn.has("macunix") then
	map("n", "<leader>c", function()
		if vim.fn.executable("nix") == 1 then
			print("Linux Nix")
			vim.cmd("vnew ~/nixfiles/packages/nvim/init.lua")
		else
			print("Linux")
			vim.cmd("vnew $MYVIMRC")
		end
	end, {
		desc = "Open init.lua",
	})
else
	map("n", "<leader>c", function()
		print("Windows")
		vim.cmd("vnew ~/AppData/Local/nvim/init.lua")
	end, {
		desc = "Open init.lua",
	})
end

-- Enter Netrw
map("n", "<leader>e", vim.cmd.Ex, { desc = "Enter Netrw" })

--Remap for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Quick quitting & saving
map("n", "<leader>qq", ":q<CR>", { desc = "Quit" })
map("n", "<leader>qQ", ":q!<CR>", { desc = "Quit!" })

-- Saving & without formatting
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save" })
map("n", "<C-S>", "<cmd>noa w<CR>", { desc = "Save without formating" })

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

