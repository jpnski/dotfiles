return {
    {
        'mhinz/vim-signify',
        config = function()
            vim.g.signify_vcs_list = "git"

            vim.cmd([[highlight SignColumn cterm=bold guifg=none guibg=none]])
            vim.cmd([[highlight DiffAdd    cterm=bold ctermfg=119 guibg=#3d4745]])
            vim.cmd([[highlight DiffDelete cterm=bold ctermfg=167 guibg=#43343e]])
            vim.cmd([[highlight DiffChange cterm=bold ctermfg=227 guibg=#3c414c]])

            vim.api.nvim_set_hl(0, 'SignifyDiffAdd', { link = 'DiffAdd' })
            vim.api.nvim_set_hl(0, 'SignifyDiffDelete', { link = 'DiffDelete' })
            vim.api.nvim_set_hl(0, 'SignifyDiffChange', { link = 'DiffChange' })
        end
    }
}
