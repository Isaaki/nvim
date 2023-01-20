require("isaaki/settings")
require("isaaki/remap")

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
	use(require("isaaki/plugins/comment"))
	use(require("isaaki/plugins/eyeliner"))
	use(require("isaaki/plugins/indent-tools"))
	use(require("isaaki/plugins/surround"))
	use(require("isaaki/plugins/textobjects"))
	use(require("isaaki/plugins/treesitter"))
	use(require("isaaki/plugins/whichkey"))
	use(require("isaaki/plugins/neodev"))

	if not vim.g.vscode then
		use(require("isaaki/plugins/autopairs"))
		use(require("isaaki/plugins/bufferline"))
		use(require("isaaki/plugins/colors"))
		use(require("isaaki/plugins/nvim-cmp"))
		use(require("isaaki/plugins/harpoon"))
		use(require("isaaki/plugins/lsp"))
		use(require("isaaki/plugins/lualine"))
		use(require("isaaki/plugins/telescope"))
		use(require("isaaki/plugins/undotree"))
		use(require("isaaki/plugins/trouble"))
		use(require("isaaki/plugins/toggleterm"))
		use(require("isaaki/plugins/project"))
		use(require("isaaki/plugins/gitsigns"))
	end

	if packer_bootstrap then
		require("packer").sync()
	end
end)
