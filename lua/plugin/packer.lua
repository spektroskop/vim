return require('packer').startup(
  function()
    use {
      'wbthomason/packer.nvim',
      opt = true,
      config = function() require('plugin.packer') end,
      cmd = {
        'PackerClean',
        'PackerCompile',
        'PackerInstall',
        'PackerStatus',
        'PackerSync',
        'PackerUpdate'
      },
    }

    use {
      'spektroskop/golden-ratio',
      config = function() require('plugin.golden-ratio') end,
      branch = 'skip-neovim-floating-windows',
    }

    use { 'fatih/vim-go',
      ft = { 'go' },
      config = function() require('plugin.go') end,
    }

    use { 'hrsh7th/nvim-compe',
      config = function() require('plugin.compe') end,
    }

    use { 'mhinz/vim-sayonara', cmd = 'Sayonara' }

    use { 'neovim/nvim-lspconfig',
      config = function() require('plugin.lspconfig') end,
    }

    use { 'cocopon/iceberg.vim', opt = true }
    use { 'gruvbox-community/gruvbox', opt = true }
    use { 'lifepillar/vim-gruvbox8', opt = true }

    use { 'nvim-telescope/telescope.nvim',
      requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' },
      config = function() require('plugin.telescope') end,
    }

    use { 'nvim-treesitter/nvim-treesitter',
      config = function() require('plugin.treesitter') end,
      run = function() vim.cmd('TSUpdate') end,
    }

    use { 'psliwka/vim-smoothie',
      config = function() require('plugin.smoothie') end,
    }

    use { 'norcalli/nvim-colorizer.lua',
      config = function() require('colorizer').setup() end,
    }

    use { 'voldikss/vim-floaterm',
      config = function() require('plugin.floaterm') end,
    }

    use { 'tpope/vim-commentary' }
    use { 'tpope/vim-fugitive' }
    use { 'tpope/vim-repeat' }
    use { 'tpope/vim-surround' }
    use { 'tpope/vim-unimpaired' }
    use { 'tpope/vim-vinegar' }
    use { 'tpope/vim-scriptease' }
    use { 'tommcdo/vim-lion' }
    use { 'romainl/vim-cool' }

    use { 'lambdalisue/fern.vim' }
    use { 'lambdalisue/fern-hijack.vim' }

    use { 'pearofducks/ansible-vim' }
  end
)
