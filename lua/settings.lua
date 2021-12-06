local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = false }

vim.opt.langmenu = "en_US"
vim.opt.termguicolors = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.nu = true
vim.opt.ma = true
vim.opt.scrolloff = 11
vim.opt.showmode = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.mouse = "a"
vim.opt.undofile = true
vim.opt.hidden = true
vim.opt.ttimeout = true
vim.opt.undofile = true
vim.opt.inccommand = "nosplit"

vim.wo.foldmethod = "indent"
vim.wo.foldlevel = 99

vim.wo.breakindent = true
vim.wo.signcolumn = "yes"

map("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

-- Exit terminal
map("t", "<esc><esc>", "<C-\\><C-N>", opts)

-- Indent without leaving Visual-mode
map("v", ">", ">gv", opts)
map("v", "<", "<gv", opts)

-- Remove highlight
map("n", "<leader>h", "<cmd>noh<CR>", opts)

-- Highlight on yank
vim.api.nvim_exec(
	[[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
	false
)
