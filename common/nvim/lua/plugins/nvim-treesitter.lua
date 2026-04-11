return {
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        lazy = false,
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter').setup {
                ensure_installed = {
                    'c', 'cpp', 'diff', 'json', 'lua', 'markdown',
                    'markdown_inline', 'proto', 'python', 'query',
                    'vim', 'vimdoc',
                }
            }

            vim.api.nvim_create_autocmd('FileType', {
                callback = function()
                    pcall(vim.treesitter.start)
                end,
            })
        end,
    }
}
