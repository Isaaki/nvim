-- Reserve space for diagnostic icons
vim.opt.signcolumn = 'yes'

local map = function(mode, lhs, rhs, opts)
    if opts ~= nil then
        opts = vim.tbl_extend("keep", opts, { silent = false })
    end
    vim.keymap.set(mode, lhs, rhs, opts)
end

local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.on_attach(function(client, bufnr)
    map('n', 'gD', function() vim.lsp.buf.declaration() end, { buffer = bufnr, desc = "Goto declaration [LSP]" })
    map('n', 'gd', function() vim.lsp.buf.definition() end, { buffer = bufnr, desc = "Goto definition [LSP]" })
    map('n', 'K', function() vim.lsp.buf.hover() end, { buffer = bufnr, desc = "Hover [LSP]" })
    map('n', '[d', function() vim.diagnostic.goto_next() end, { buffer = bufnr, desc = "Goto next diagnostic [LSP]" })
    map('n', ']d', function() vim.diagnostic.goto_prev() end, { buffer = bufnr, desc = "Goto prev diagnostic [LSP]" })
    map('n', '<leader>lca', function() vim.lsp.buf.code_action() end, { buffer = bufnr, desc = "Code action [LSP]" })
    map('n', '<leader>lrr', function() vim.lsp.buf.references() end, { buffer = bufnr, desc = "References [LSP]" })
    map('n', '<leader>lrn', function() vim.lsp.buf.rename() end, { buffer = bufnr, desc = "Rename [LSP]" })
    map('n', '<C-h>', function() vim.lsp.buf.signature_help() end, { buffer = bufnr, desc = "Signature help [LSP]" })

    -- map('n', 'gi', vim.lsp.buf.implementation, { buffer = bufnr, desc = ""})
    -- map('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, { buffer = bufnr, desc = ""})
end)

lsp.setup()
