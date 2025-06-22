return {
    {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            branch = 'master'
            lazy = false
            build = ":TSUpdate"
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = {
                    'cpp', 'python', 'lua', 'json', 'proto', 'vim', 'vimdoc', 'markdown', 'diff'
                },
                auto_install = false,
                indent = { enable = true },
                highlight = { enable = true },
                additional_vim_regex_highlighting = false,
            })
        end,
    }
}
