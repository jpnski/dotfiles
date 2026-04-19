return {
    {
        'vim-airline/vim-airline',
        config = function()
            vim.g.airline_theme = "nord_minimal"
            vim.g.airline_powerline_fonts = 0
            vim.g.airline_extensions_whitespace_enabled = 0
        end
    }
}
