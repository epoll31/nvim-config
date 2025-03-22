return {
	{
		"epoll31/script_runner.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			local sp = require("script_runner")
			sp.setup()

			vim.keymap.set({ "n", "i" }, "<C-Enter>", require("script_runner").run_default_script)
			vim.keymap.set("n", "<leader>ss", require("script_runner").script_picker)
			vim.keymap.set("n", "<leader>fs", require("script_runner").script_picker)
		end,
	},
}
