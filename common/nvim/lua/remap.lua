vim.g.mapleader = " "
vim.keymap.set("n", "<leader>v", vim.cmd.Ex)

-- Create Splits
vim.keymap.set("n", "<leader>V", vim.cmd.Vexplore)
vim.keymap.set("n", "<leader>S", vim.cmd.Sexplore)

-- Split Navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")

-- Bump Lines Up/Down in Visual
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-- Jump Half Page Down/Up
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Vertically Centered Term in Search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- End Input in Terminal Mode
vim.keymap.set("t", "<C-q>", "<C-\\><C-n>")

-- Disable Q in Normal
vim.keymap.set("n", "Q", "<nop>")

-- Misc.
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("x", "<leader>p", "\"_dP")
