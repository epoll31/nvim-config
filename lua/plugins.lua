

--- startup and add configure plugins
require('packer').startup(function(use)
  -- handle self:
  use 'wbthomason/packer.nvim'
  
  -- plugins:
  use { 
    'dinhhuy258/git.nvim',
    config = function()
      require('git').setup()
    end
  }

  use {
    "b0o/incline.nvim",
    event = "BufReadPre",
    config = function()
      require("incline").setup()
    end
  }
  
  use {
    "filipdutescu/renamer.nvim",
    module = { "renamer" },
    config = function()
      require("renamer").setup {}
    end
  }
  use {
    "chentoast/marks.nvim",
    event = "BufReadPre",
    config = function()
      require("marks").setup {}
    end
  }

  use 'nvim-tree/nvim-web-devicons'

  use { 
    "ellisonleao/gruvbox.nvim",
    config    = function()
                  require('gruvbox').setup {}
                  vim.cmd([[colorscheme gruvbox]])
                end
  }
  
  use {
    'nvim-lualine/lualine.nvim',
    requires  = { 
                  'kyazdani42/nvim-web-devicons', 
                  opt = true 
                },
    options   = { 
                  theme = 'gruvbox_dark',
                  section_separators    = { left = '', right = '' },
                  component_separators  = { left = '', right = '' }
                },
    sections  = { 
                  lualine_a = { 'mode' } 
                },
    config    = function() 
                  require('lualine').setup {}
                end
  }
  
end)

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
