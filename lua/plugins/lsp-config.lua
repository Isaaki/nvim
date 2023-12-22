return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = "williamboman/mason.nvim",
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = { "lua_ls" },
      }
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.set_log_level("debug")

      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup {}
      lspconfig.tsserver.setup {}

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf, desc = "GoTo definition | LSP" })
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = ev.buf, desc = "GoTo declaration | LSP" })
          vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "Hover symbol | LSP" })
          vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action,
            { buffer = ev.buf, desc = "Code action | LSP" })
          vim.keymap.set('n', '<leader>cf', function()
            vim.lsp.buf.format { async = true }
          end, { buffer = ev.buf, desc = "Format | LSP" })
        end,
      })
    end,
  },
}
