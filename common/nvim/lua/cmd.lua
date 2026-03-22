vim.cmd([[set guicursor=n-i-c:ver50,c-cr:hor50,v-ve:block]])

vim.cmd([[highlight MatchParen
    \ term=reverse cterm=bold ctermfg=193 ctermbg=234
    \ gui=bold guifg=#d0ffc0 guibg=#3b4252 guisp=#202020]])

vim.cmd([[highlight Visual
    \ term=reverse ctermfg=230 ctermbg=239
    \ guifg=#faf4c6 guibg=#3c414c guisp=#3c414c]])
