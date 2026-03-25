-- Cursor
vim.cmd([[set guicursor=n-i-c:ver50,c-cr:hor50,v-ve:block]])

-- Bold/italic Paren Matching
vim.cmd([[highlight MatchParen
    \ term=reverse cterm=bold,italic ctermfg=193 ctermbg=234
    \ gui=bold,italic guifg=#d0ffc0 guibg=#3b4252 guisp=#202020]])

-- Visual Selection Highlighting
vim.cmd([[highlight Visual
    \ term=reverse ctermfg=230 ctermbg=239
    \ guifg=#faf4c6 guibg=#3c414c guisp=#3c414c]])

-- Borders for Transparent Floats
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#3B4252", fg = "#5E81AC" })
vim.api.nvim_set_hl(0, "LazyBorder", { bg = "#3B4252", fg = "#5E81AC" })
