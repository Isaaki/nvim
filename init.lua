require("set")
require("remap")

-- Packer bootstrap
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Basic plugins (No Config)
    use("JoosepAlviste/nvim-ts-context-commentstring")
    use("lewis6991/impatient.nvim")
    use { "mg979/vim-visual-multi", branch = "master" }
    use("vim-scripts/ReplaceWithRegister")

    -- Plugins with configurations
    use(require("plugin/comment"))
    use(require("plugin/eyeliner"))
    use(require("plugin/indent-tools"))
    use(require("plugin/surround"))
    use(require("plugin/textobjects"))
    use(require("plugin/treesitter"))
    use(require("plugin/whichkey"))
    use(require("plugin/neodev"))

    if not vim.g.vscode then
        use(require("plugin/autopairs"))
        use(require("plugin/bufferline"))
        use(require("plugin/colors"))
        use(require("plugin/nvim-cmp"))
        use(require("plugin/harpoon"))
        use(require("plugin/lsp"))
        use(require("plugin/lualine"))
        use(require("plugin/telescope"))
        use(require("plugin/undotree"))
        use(require("plugin/trouble"))
        use(require("plugin/toggleterm"))
        use(require("plugin/project"))
        use(require("plugin/gitsigns"))
    end

    if packer_bootstrap then
        require('packer').sync()
    end
end)
