return {
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'master',
        lazy = false,
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = {
                    'cpp', 'python','json', 'proto', 'diff'
                },
                auto_install = false,
                indent = { enable = true },
                highlight = { enable = true },
                additional_vim_regex_highlighting = false,
            })
        end,
    }
}
