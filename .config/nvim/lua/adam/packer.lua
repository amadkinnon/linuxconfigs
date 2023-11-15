-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Remember to :source % to get the :Packer* commands
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
      fn.system({'git', 'clone', '--depth', '1', 'ssh://github.com/wbthomason/packer.nvim', install_path})
      vim.cmd [[packadd packer.nvim]]
      return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Packer can manage itself
  use('wbthomason/packer.nvim')
  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
        vim.cmd('colorscheme rose-pine')
    end
  })

  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.4',
      -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('mbbill/undotree')
  -- use('jlanzarotta/bufexplorer')
  use('tpope/vim-fugitive')
  use('tpope/vim-surround')
  use('ray-x/go.nvim')
  use('ray-x/guihua.lua')
  use{
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }

  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v1.x',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-buffer'},
          {'hrsh7th/cmp-path'},
          {'saadparwaiz1/cmp_luasnip'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'hrsh7th/cmp-nvim-lua'},

          -- Snippets
          {'L3MON4D3/LuaSnip'},
          {'rafamadriz/friendly-snippets'},
      }
  }

  use {
      'pwntester/octo.nvim',
      requires = {
          'nvim-lua/plenary.nvim',
          'nvim-telescope/telescope.nvim',
          'nvim-tree/nvim-web-devicons',
      },
      config = function ()
          require('octo').setup()
      end
  }

  if packer_bootstrap then
      require('packer').sync()
  end
end)
