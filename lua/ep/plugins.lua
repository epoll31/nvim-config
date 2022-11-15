-- plugins.lua

vim.cmd [[packadd packer.nvim]]
local lualineTheme = require('ep.lualine-theme')
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

	use {
  	'nvim-lualine/lualine.nvim',
  	requires = { 
			'kyazdani42/nvim-web-devicons', 
			opt = true 
		},
	  config = {
	  	require('lualine').setup()
	 	}
	}	

	use 'tpope/vim-fugitive'
	use 'airblade/vim-gitgutter'

	use { 
		"catppuccin/nvim", 
		as = "catppuccin",
		config = function()
				vim.cmd.colorscheme "catppuccin"
				require("catppuccin").setup({
					flavour = "mocha"
				})
			end
	}


end)



















