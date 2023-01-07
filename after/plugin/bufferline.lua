vim.opt.termguicolors = true

require("bufferline").setup {}

local count_bufs_by_type = function(loaded_only)
    loaded_only = (loaded_only == nil and true or loaded_only)
    local count = { normal = 0, acwrite = 0, help = 0, nofile = 0,
        nowrite = 0, quickfix = 0, terminal = 0, prompt = 0 }
    buftypes = vim.api.nvim_list_bufs()
    for _, bufname in pairs(buftypes) do
        if (not loaded_only) or vim.api.nvim_buf_is_loaded(bufname) then
            local buftype = vim.api.nvim_buf_get_option(bufname, 'buftype')
            buftype = buftype ~= '' and buftype or 'normal'
            count[buftype] = count[buftype] + 1
        end
    end
    return count
end



vim.keymap.set('n', '<A-l>', vim.cmd.bnext, { desc = "Next buffer" })
vim.keymap.set('n', '<A-h>', vim.cmd.bprev, { desc = "Prev buffer" })

-- Close buffers but close nvim when only 1 buffer left
vim.keymap.set('n', '<leader>q', function()
    local bufTable = count_bufs_by_type()

    if (bufTable.normal <= 1) then
        print("normal quit")
        vim.cmd("q")
    else
        print("buffer quit")
        vim.api.nvim_buf_delete(0, {})
        -- vim.cmd("bd")
    end
end, { desc = "Prev buffer" })

vim.keymap.set('n', '<leader>Q', function()
    local bufTable = count_bufs_by_type()

    if (bufTable.normal <= 1) then
        print("normal quit")
        vim.cmd("q!")
    else
        print("buffer quit")
        vim.api.nvim_buf_delete(0, { force = true })
        -- vim.cmd("bd!")
    end
end, { desc = "Prev buffer" })
