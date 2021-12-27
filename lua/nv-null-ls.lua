local null_ls = require("null-ls")

local sources = {
	null_ls.builtins.formatting.stylua,
	-- null_ls.builtins.formatting.prettier,
	null_ls.builtins.formatting.prettierd,
}

on_attach = function(client)
	if client.resolved_capabilities.document_formatting then
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	end
end

require("null-ls").setup({
	sources = sources,
	on_attach = on_attach,
})

-- require("lspconfig")["null-ls"].setup({
-- 	on_attach = on_attach,
-- })
