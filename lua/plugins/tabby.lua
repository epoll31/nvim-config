return {

	{
		"nanozuki/tabby.nvim",
		event = "VimEnter", -- if you want lazy load, see below
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("tabby").setup({})

			vim.opt.showtabline = 2
			vim.opt.sessionoptions = "curdir,folds,globals,help,tabpages,terminal,winsize"

			vim.api.nvim_set_keymap("n", "<leader>ta", ":$tabnew<CR>", { noremap = true, desc = "[T]ab [A]dd" })
			vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", { noremap = true, desc = "[T]ab [C]lose" })
			vim.api.nvim_set_keymap("n", "<leader>to", ":tabonly<CR>", { noremap = true, desc = "[T]ab [O]nly" })
			vim.api.nvim_set_keymap("n", "<leader>tn", ":tabn<CR>", { noremap = true, desc = "[T]ab [N]ext" })
			vim.api.nvim_set_keymap("n", "<leader>tp", ":tabp<CR>", { noremap = true, desc = "[T]ab [P]revious" })
			vim.api.nvim_set_keymap(
				"n",
				"<leader>tmp",
				":-tabmove<CR>",
				{ noremap = true, desc = "[T]ab [M]ove [P]revious" }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>tmn",
				":+tabmove<CR>",
				{ noremap = true, desc = "[T]ab [M]ove [N]ext" }
			)
		end,
	},
}
