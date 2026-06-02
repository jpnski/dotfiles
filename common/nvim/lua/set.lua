-- Line Numbers
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Appearance
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.wrap = true
vim.opt.scrolloff = 8

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Directories
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Searching
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Misc.
vim.opt.updatetime = 50
vim.opt.clipboard = "unnamedplus"

-- Wrapping / Line Breaks
vim.opt.breakindent = true
vim.opt.showbreak = "↳ "

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.bo.textwidth = 80
    end,
})
