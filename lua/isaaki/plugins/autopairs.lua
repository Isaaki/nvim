return {
	"windwp/nvim-autopairs",
	config = function()
		require("nvim-autopairs").setup({})

    -- TODO Make this work with Lazy.nvim

		-- if packer_plugins["nvim-cmp"] and packer_plugins["nvim-cmp"].loaded then
		-- 	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		-- 	local cmp = require("cmp")
		--
		-- 	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		-- end
	end,
}
