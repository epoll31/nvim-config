return {
	-- {
	-- 	"ellisonleao/gruvbox.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd([[colorscheme gruvbox]])
	-- 	end,
	-- },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup()
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
}
