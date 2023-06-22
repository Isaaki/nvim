return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = { 
		{ "JoosepAlviste/nvim-ts-context-commentstring" },
		{ "nvim-treesitter/nvim-treesitter-context" },
		{ "nvim-treesitter/nvim-treesitter-textobjects" },
	},
	build = function()
		local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
		ts_update()
	end,
	config = function()
		require("nvim-treesitter.configs").setup({
			-- A list of parser names, or "all"
			ensure_installed = { "javascript", "typescript", "vue", "c",  "rust" },

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = true,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = false,

			highlight = {
				-- `false` will disable the whole extension
				enable = not vim.g.vscode,

				additional_vim_regex_highlighting = false,
			},

			context_commentstring = {
				enable = true,
			},
		})

		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

		-- Diable auto fold on file enter
		vim.api.nvim_create_autocmd({ "BufReadPost", "FileReadPost" }, {
			command = "normal zR",
		})

		if not vim.g.vscode then
			require("treesitter-context").setup({
				trim_scope = "inner",
			})
		end
	end,
}
