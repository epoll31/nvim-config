vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- use {
  --  'catppuccin/nvim', as = 'catppuccin',
  -- }
  use { "ellisonleao/gruvbox.nvim" }

  use {
    'nvim-treesitter/nvim-treesitter',
    { run = ':TSUpdate' }
  }

  --    use { 'ThePrimeagen/harpoon' }
  use { 'mbbill/undotree' }
  use { 'tpope/vim-fugitive' }

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
    }
  }

  use {
    'mg979/vim-visual-multi'
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use {
    'github/copilot.vim'
  }
end)
