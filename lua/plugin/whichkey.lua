return {
    "folke/which-key.nvim",
    config = function()
        local wk = require("which-key")

        wk.setup {
            plugins = {
                spelling = {
                    enabled = true,
                },
            },
        }

        wk.register({
            o = {
                name = "Plugins"
            }
        }, { prefix = "<leader>" })
    end
}
