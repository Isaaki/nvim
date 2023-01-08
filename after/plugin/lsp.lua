-- Reserve space for diagnostic icons
vim.opt.signcolumn = 'yes'

local map = function(mode, lhs, rhs, opts)
    if opts ~= nil then
        opts = vim.tbl_extend("keep", opts, { silent = false })
    end
    vim.keymap.set(mode, lhs, rhs, opts)
end

local lsp = require('lsp-zero')
lsp.set_preferences({
    suggest_lsp_servers = true,
    setup_servers_on_start = true,
    set_lsp_keymaps = false,
    configure_diagnostics = true,
    cmp_capabilities = true,
    manage_nvim_cmp = true,
    call_servers = 'local',
    sign_icons = {
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = ''
    }
})

lsp.on_attach(function(client, bufnr)
    map('n', 'gD', function() vim.lsp.buf.declaration() end, { buffer = bufnr, desc = "Goto declaration [LSP]" })
    map('n', 'gd', function() vim.lsp.buf.definition() end, { buffer = bufnr, desc = "Goto definition [LSP]" })
    map('n', 'gl', function() vim.diagnostic.open_float() end, { buffer = bufnr, desc = "Open diagnostics window [LSP]" })
    map('n', 'K', function() vim.lsp.buf.hover() end, { buffer = bufnr, desc = "Hover [LSP]" })
    map('n', '[d', function() vim.diagnostic.goto_next() end, { buffer = bufnr, desc = "Goto next diagnostic [LSP]" })
    map('n', ']d', function() vim.diagnostic.goto_prev() end, { buffer = bufnr, desc = "Goto prev diagnostic [LSP]" })
    map('n', '<F2>', function() vim.lsp.buf.rename() end, { buffer = bufnr, desc = "Rename [LSP]" })
    map('n', '<F4>', function() vim.lsp.buf.code_action() end, { buffer = bufnr, desc = "Code action [LSP]" })
    map('n', '<leader>oc', function() vim.lsp.buf.code_action() end, { buffer = bufnr, desc = "Code action [LSP]" })
    map('n', '<leader>or', function() vim.lsp.buf.rename() end, { buffer = bufnr, desc = "Rename [LSP]" })
    map('n', '<leader>oR', function() vim.lsp.buf.references() end, { buffer = bufnr, desc = "References [LSP]" })
    map('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, { buffer = bufnr, desc = "Format document [LSP]" })

    -- map('n', '<C-h>', function() vim.lsp.buf.signature_help() end, { buffer = bufnr, desc = "Signature help [LSP]" })

    -- map('n', 'gi', vim.lsp.buf.implementation, { buffer = bufnr, desc = ""})
end)

lsp.setup()
