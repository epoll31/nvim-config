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

	use { 'L3MON4D3/LuaSnip' }
	use { 'hrsh7th/cmp-nvim-lsp' }
	use { 'neovim/nvim-lspconfig' } -- Configurations for Nvim LSP
	use {
		'hrsh7th/nvim-cmp',
  	config = function ()
			local cmp = require('cmp')
			cmp.setup({
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
      		end
				},
				mapping = cmp.mapping.preset.insert({
      		['<C-b>'] = cmp.mapping.scroll_docs(-4),
      		['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
		  		['<C-e>'] = cmp.mapping.abort(),
    			['<CR>'] = cmp.mapping.confirm({ select = true }) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = {
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' } 
    		}
			})

			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			-- The following example advertise capabilities to `clangd`.
			require('lspconfig').clangd.setup {
  			capabilities = capabilities
			}
			require('lspconfig').pyright.setup{
				capabilities = capabilities
			}
			require('lspconfig').cmake.setup{
				capabilities = capabilities
			}
			require('lspconfig').csharp_ls.setup{
				capabilities = capabilities
			}
			require('lspconfig').cssls.setup{
				capabilities = capabilities
			}
			require('lspconfig').cssmodules_ls.setup{
				capabilities = capabilities
			}
			require('lspconfig').glslls.setup{
				capabilities = capabilities
			}
			require('lspconfig').html.setup{
				capabilities = capabilities
			}
			require('lspconfig').java_language_server.setup{
				capabilities = capabilities
			}
			require('lspconfig').jsonls.setup{
				capabilities = capabilities
			}
			require('lspconfig').sqlls.setup{
				capabilities = capabilities
			}
			require('lspconfig').tsserver.setup{
				capabilities = capabilities
			}
		end
	}

	use { 'saadparwaiz1/cmp_luasnip' }


end)




















