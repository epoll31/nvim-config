return {
	{
		"coffebar/neovim-project",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"ibhagwan/fzf-lua",
			"Shatur/neovim-session-manager",
		},

		config = function()
			vim.opt.sessionoptions:append("globals")
			require("neovim-project").setup({
				projects = {
					"~/projects/*",
					"~/.config/*",
				},
				picker = { type = "telescope" },
			})
		end,
	},

	{
		"Shatur/neovim-session-manager",
		config = function()
			local config = require("session_manager.config")
			require("session_manager").setup({
				autoload_mode = { config.AutoloadMode.CurrentDir, config.AutoloadMode.LastSession },
			})
		end,
	},
}
