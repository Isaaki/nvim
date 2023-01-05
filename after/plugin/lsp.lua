-- Reserve space for diagnostic icons
vim.opt.signcolumn = 'yes'

local map = vim.keymap.set
local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.on_attach(function(client, bufnr)
	local bufopts = {buffer = bufnr, remap = false}

	map('n', 'gD', function() vim.lsp.buf.declaration() end, bufopts)
	map('n', 'gd', function() vim.lsp.buf.definition() end, bufopts)
	map('n', 'K', function() vim.lsp.buf.hover() end, bufopts)
	map('n', '[d', function() vim.diagnostic.goto_next() end, bufopts)
	map('n', ']d', function() vim.diagnostic.goto_prev() end, bufopts)
	map('n', '<leader>lca', function() vim.lsp.buf.code_action() end, bufopts)
	map('n', '<leader>lrr', function() vim.lsp.buf.references() end, bufopts)
	map('n', '<leader>lrn', function() vim.lsp.buf.rename() end, bufopts)
	map('n', '<C-h>', function() vim.lsp.buf.signature_help() end, bufopts)

	-- map('n', 'gi', vim.lsp.buf.implementation, bufopts)
	-- map('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end)

lsp.setup()
