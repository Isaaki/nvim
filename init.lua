require("lua/settings")
require("lua/remap")

-- Packer bootstrap
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- Basic plugins (No Config)
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("lewis6991/impatient.nvim")
	use({ "mg979/vim-visual-multi", branch = "master" })
	use("vim-scripts/ReplaceWithRegister")

	-- Plugins with configurations
	use(require("plugins/comment"))
	use(require("plugins/eyeliner"))
	use(require("plugins/indent-tools"))
	use(require("plugins/surround"))
	use(require("plugins/textobjects"))
	use(require("plugins/treesitter"))
	use(require("plugins/whichkey"))
	use(require("plugins/neodev"))

	if not vim.g.vscode then
		use(require("plugins/autopairs"))
		use(require("plugins/bufferline"))
		use(require("plugins/colors"))
		use(require("plugins/nvim-cmp"))
		use(require("plugins/harpoon"))
		use(require("plugins/lsp"))
		use(require("plugins/lualine"))
		use(require("plugins/telescope"))
		use(require("plugins/undotree"))
		use(require("plugins/trouble"))
		use(require("plugins/toggleterm"))
		use(require("plugins/project"))
		use(require("plugins/gitsigns"))
	end

	if packer_bootstrap then
		require("packer").sync()
	end
end)
