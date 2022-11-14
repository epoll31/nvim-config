

--- startup and add configure plugins
require('packer').startup(function(use)
  -- handle self:
  use 'wbthomason/packer.nvim'

  -- plugins:

  -- git:
  use {
    'dinhhuy258/git.nvim',
    config = function()
      require('git').setup()
    end
  }

  use { 
    'sindrets/diffview.nvim', 
    requires = 'nvim-lua/plenary.nvim'
  }

  -- coc:
  use {
    'neoclide/coc.nvim', 
    branch = 'release'
  }


  -- language server protocol:
  --use {
  --  'neovim/nvim-lspconfig'
  --}
  -- completion:
  --use {
  --  "hrsh7th/nvim-cmp",
  --  requires = {
  --    'hrsh7th/cmp-nvim-lsp',
  --    'hrsh7th/cmp-buffer',
  --    'hrsh7th/cmp-path',
  --    'hrsh7th/cmp-cmdline',
  --    'hrsh7th/nvim-cmp'
  --  },
  --  config =  function()
  --              require('cmp').setup()
  --            end
  --} 

  -- icons:
  use 'nvim-tree/nvim-web-devicons'

  -- treesitter: 
  use {
    'nvim-treesitter/nvim-treesitter',
    run =     function()
                require('nvim-treesitter.install').update({ with_sync = true })
              end,
    config =  function()
                require('nvim-treesitter.configs').setup({
                  ensure_installed  = { "c", "lua", "rust", "cpp", "css", "gitignore", "glsl", "json", "latex", "markdown", "python", "regex", "scss", "sql", "tsx", "javascript", "typescript", "vim" }
                })
              end
  }

  --telescope:
  use "nvim-lua/plenary.nvim"

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make' 
  }

  use {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.0', -- branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} },
    extensions = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                        -- the default case_mode is "smart_case"
      }
    },
    config =  function()
                local t = require('telescope')
                t.setup()
                t.load_extension('fzf') 
              end
  }

  -- folding:
  use { 
    'anuvyklack/pretty-fold.nvim',
    config = function()
      require('pretty-fold').setup()
    end
  }

  -- line marker
  use {
    "chentoast/marks.nvim",
    event = "BufReadPre",
    config = function()
      require("marks").setup()
    end
  }

  -- color theme
  use { 
    "ellisonleao/gruvbox.nvim",
    config    = function()
                  require('gruvbox').setup()
                  vim.cmd([[colorscheme gruvbox]])
                end
  }
  
  -- lualine
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
                  require('lualine').setup()
                end
  }
  
  -- file name for each window
  use {
    "b0o/incline.nvim",
    event = "BufReadPre",
    config = function()
      require("incline").setup()
    end
  }
end)

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
