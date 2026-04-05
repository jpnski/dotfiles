return {
    'nvim-telescope/telescope.nvim', tag = master,
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
        ---- Transparent Telescope Floats
        -- vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { bg = "NONE" })
        -- vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "NONE" })
        -- vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "NONE" })
    end
}
