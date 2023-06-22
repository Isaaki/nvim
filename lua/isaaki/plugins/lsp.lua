return {
	"VonHeikemen/lsp-zero.nvim",
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },

		-- null-ls
		{ "jose-elias-alvarez/null-ls.nvim" },
		{ "nvim-lua/plenary.nvim" },

		-- -- Autocompletion
		-- { 'hrsh7th/nvim-cmp' },
		-- { 'hrsh7th/cmp-buffer' },
		-- { 'hrsh7th/cmp-path' },
		-- { 'saadparwaiz1/cmp_luasnip' },
		-- { 'hrsh7th/cmp-nvim-lsp' },
		-- { 'hrsh7th/cmp-nvim-lua' },
		--
		-- -- Snippets
		-- { 'L3MON4D3/LuaSnip' },
		-- -- Snippet Collection (Optional)
		-- { 'rafamadriz/friendly-snippets' },
	},
	config = function()
		-- Reserve space for diagnostic icons
		vim.opt.signcolumn = "yes"

		local map = function(mode, lhs, rhs, opts)
			if opts ~= nil then
				opts = vim.tbl_extend("keep", opts, { silent = false })
			end
			vim.keymap.set(mode, lhs, rhs, opts)
		end

		local lsp_formatting = function(bufnr)
			vim.lsp.buf.format({
				filter = function(client)
					-- apply whatever logic you want (in this example, we'll only use null-ls)
					return client.name == "null-ls"
				end,
				bufnr = bufnr,
				async = true,
			})
		end

		-- null-ls setup
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- null_ls.builtins.formatting.prettierd.with({ extra_args = { "--single-quote" } }),
        null_ls.builtins.formatting.prettier.with({ extra_args = { "--single-quote" } }),
				null_ls.builtins.formatting.stylua,
			},
		})

		-- LSP setup
		local lsp = require("lsp-zero")

		lsp.preset("lsp-compe")

		lsp.set_preferences({
			set_lsp_keymaps = false,
		})

		lsp.ensure_installed({
			"tsserver",
			"volar",
			"lua_ls",
			"pyright",
			"html",
			"jsonls",
			-- "prettierd",
			-- "stylua",
		})


		lsp.on_attach(function(client, bufnr)
			map("n", "gD", function()
				vim.lsp.buf.declaration()
			end, { buffer = bufnr, desc = "Goto declaration [LSP]" })
			map("n", "gd", function()
				vim.lsp.buf.definition()
			end, { buffer = bufnr, desc = "Goto definition [LSP]" })
			map("n", "gl", function()
				vim.diagnostic.open_float()
			end, { buffer = bufnr, desc = "Open diagnostics window [LSP]" })
			map("n", "K", function()
				vim.lsp.buf.hover()
			end, { buffer = bufnr, desc = "Hover [LSP]" })
			map("n", "[d", function()
				vim.diagnostic.goto_next()
			end, { buffer = bufnr, desc = "Goto next diagnostic [LSP]" })
			map("n", "]d", function()
				vim.diagnostic.goto_prev()
			end, { buffer = bufnr, desc = "Goto prev diagnostic [LSP]" })
			map("n", "<F2>", function()
				vim.lsp.buf.rename()
			end, { buffer = bufnr, desc = "Rename [LSP]" })
			map("n", "<F4>", function()
				vim.lsp.buf.code_action()
			end, { buffer = bufnr, desc = "Code action [LSP]" })
			map("n", "<leader>oc", function()
				vim.lsp.buf.code_action()
			end, { buffer = bufnr, desc = "Code action [LSP]" })
			map("n", "<leader>oR", function()
				vim.lsp.buf.references()
			end, { buffer = bufnr, desc = "References [LSP]" })
			map("n", "<leader>f", function()
				lsp_formatting(bufnr)
			end, { buffer = bufnr, desc = "Format document [LSP]" })

			-- map('n', '<C-h>', function() vim.lsp.buf.signature_help() end, { buffer = bufnr, desc = "Signature help [LSP]" })

			-- map('n', 'gi', vim.lsp.buf.implementation, { buffer = bufnr, desc = ""})
		end)

    lsp.setup()
	end,
}
