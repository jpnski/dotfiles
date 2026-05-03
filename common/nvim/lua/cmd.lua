-- Cursor
vim.cmd([[set guicursor=n-i-c:ver50,c-cr:hor50,v-ve:block]])

-- Current Line
vim.cmd([[highlight CursorLineNr
    \ cterm=NONE ctermfg=193
    \ gui=NONE guifg=#d0ffc0]])

vim.cmd([[highlight CursorLine ctermbg=NONE guibg=NONE]])

-- Bold/Italic Paren Matching
vim.cmd([[highlight MatchParen
    \ cterm=reverse cterm=bold,italic ctermfg=193 ctermbg=234
    \ gui=bold,italic guifg=#d0ffc0 guibg=#3b4252 guisp=#202020]])

-- Visual Selection Highlighting
vim.cmd([[highlight Visual
    \ cterm=reverse ctermfg=230 ctermbg=239
    \ guifg=#faf4c6 guibg=#3c414c guisp=#3c414c]])

-- Search (current match)
vim.cmd([[highlight IncSearch
    \ cterm=bold gui=bold
    \ guifg=#3B4252 guibg=#d0ffc0]])

-- Search (other matches)
vim.cmd([[highlight Search
    \ cterm=bold gui=bold
    \ guifg=#d0ffc0 guibg=#3B4252]])

---- Borders for Transparent Floats
-- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#3B4252", fg = "#5E81AC" })
-- vim.api.nvim_set_hl(0, "LazyBorder", { bg = "#3B4252", fg = "#5E81AC" })
