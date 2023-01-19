return {
	"nvim-treesitter/nvim-treesitter",
	requires = "nvim-treesitter/nvim-treesitter-context",
	run = function()
		local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
		ts_update()
	end,
	config = function()
		require("nvim-treesitter.configs").setup({
			-- A list of parser names, or "all"
			ensure_installed = { "help", "javascript", "typescript", "vue", "c", "lua", "rust" },

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,

			highlight = {
				-- `false` will disable the whole extension
				enable = not vim.g.vscode,

				additional_vim_regex_highlighting = false,
			},

			context_commentstring = {
				enable = true,
			},
		})

		if not vim.g.vscode then
			require("treesitter-context").setup({
				trim_scope = "inner",
			})
		end
	end,
}
