local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd("packadd packer.nvim")
end

require("settings")

require("nv-lsp")
require("nv-treesitter")
require("nv-cmp")
require("nv-telescope")
require("nv-dashboard")
require("nv-tree")
-- require("nv-which-key")
require("nv-null-ls")
require("nv-lspkind")
require("nv-bufferline")
require("nv-luasnip")
require("nv-toggleterm")
require("nv-smartq")

return require("packer").startup({
	function(use)
		-- Packer can manage itself
		use("wbthomason/packer.nvim")

		---------------
		-- Essential --
		---------------
		use({
			"neovim/nvim-lspconfig",
			"williamboman/nvim-lsp-installer",
		})

		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

		use({
			"nvim-telescope/telescope.nvim",
			requires = {
				{ "nvim-lua/plenary.nvim" },
				{
					"nvim-telescope/telescope-fzf-native.nvim",
					run = "make",
					config = function()
						require("telescope").load_extension("fzf")
					end,
				},
			},
		})

		use({
			"jose-elias-alvarez/null-ls.nvim",
			requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		})

		use("hrsh7th/nvim-cmp") -- Main plugin
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-nvim-lsp")
		use({ "saadparwaiz1/cmp_luasnip", requires = { "L3MON4D3/LuaSnip" } })
		use("hrsh7th/cmp-path")

		use({ "rafamadriz/friendly-snippets" })
		use({
			"L3MON4D3/LuaSnip",
			wants = "friendly-snippets",
		})

		use({
			"kyazdani42/nvim-tree.lua",
			requires = "kyazdani42/nvim-web-devicons",
		})

		use("folke/which-key.nvim")

		-------------------
		-- Non-essential --
		-------------------
		use({
			"glepnir/dashboard-nvim",
			requires = { "nvim-telescope/telescope.nvim" },
		})

		use({
			"ahmedkhalf/project.nvim",
			config = function()
				require("project_nvim").setup({})
			end,
		})

		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
			config = function()
				require("lualine").setup({
					options = {
						theme = "nightfox",
					},
				})
			end,
		})

		use({
			"akinsho/bufferline.nvim",
			requires = "kyazdani42/nvim-web-devicons",
			config = function()
				vim.opt.termguicolors = true
				require("bufferline").setup({})
			end,
		})

		use({ "akinsho/toggleterm.nvim" })

		use({
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("colorizer").setup()
			end,
		})

		use({
			"windwp/nvim-autopairs",
			config = function()
				require("nvim-autopairs").setup()
			end,
		})

		use({
			"folke/todo-comments.nvim",
			requires = "nvim-lua/plenary.nvim",
		})

		use({ "onsails/lspkind-nvim" })

		-- use({ "p00f/nvim-ts-rainbow", requires = "nvim-treesitter/nvim-treesitter" })
		-- use({ "windwp/nvim-ts-autotag", requires = "nvim-treesitter/nvim-treesitter" })

		-- -- Adds context commenting
		-- use({
		-- 	"JoosepAlviste/nvim-ts-context-commentstring",
		-- 	requires = { "nvim-treesitter/nvim-treesitter" },
		-- })

		-- use({
		-- 	"folke/tokyonight.nvim",
		-- 	config = function()
		-- 		vim.g.tokyonight_style = "night"
		-- 		vim.cmd([[colorscheme tokyonight]])
		-- 	end,
		-- })

		-- use({
		-- 	"rafamadriz/neon",
		-- 	config = function()
		-- 		vim.g.neon_style = "dark"
		-- 		vim.cmd([[colorscheme neon]])
		-- 	end,
		-- })

		use({
			"EdenEast/nightfox.nvim",
			config = function()
				require("nightfox").load("nightfox")
			end,
		})

		---------------------
		-- Old Vim plugins --
		---------------------
		use("tpope/vim-commentary")
		use("tpope/vim-surround")
		use("vim-scripts/ReplaceWithRegister")
		use("matze/vim-move")
		use("marklcrns/vim-smartq")
	end,
})
