return {
    {
        "andrewferrier/wrapping.nvim",
        config = function()
            require("wrapping").setup({
                softener = { markdown = true },
            })
            vim.keymap.set("n", "<leader>ws", "<Plug>(wrapping-soft-wrap-mode)")
            vim.keymap.set("n", "<leader>wh", "<Plug>(wrapping-hard-wrap-mode)")
            vim.keymap.set("n", "<leader>wt", "<Plug>(wrapping-toggle-wrap-mode)")
        end
    }
}
