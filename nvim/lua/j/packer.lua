-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.8',
      -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'AlexvZyl/nordic.nvim'
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('vim-airline/vim-airline')
  use('vim-airline/vim-airline-themes')
  use('christoomey/vim-system-copy')
  use('Townk/vim-autoclose')
  use('mhinz/vim-signify')

end)
