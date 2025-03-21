return {
	{
		"coffebar/neovim-project",
		-- dir = "~/projects/neovim-project",
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

	{
		-- "diniamo/run.nvim",
		dir = "~/projects/run.nvim/",
		lazy = false,
		config = function()
			local run = require("run")

			-- Runs the cached command
			vim.keymap.set("n", "<leader>ri", require("run").run)
			-- Prompts for a command, and overrides the cached one with it
			vim.keymap.set("n", "<leader>ro", function()
				require("run").run(nil, true)
			end)
			-- Prompts for a command to run, without overriding
			vim.keymap.set("n", "<leader>rc", require("run").run_prompt)
		end,
	},

	{
		dir = "~/projects/script_runner.nvim",
		config = function()
			local sp = require("script_runner")
			sp.setup()

			vim.keymap.set({ "n", "i" }, "<C-Enter>", require("script_runner").run_default_script)
			vim.keymap.set("n", "<leader>fs", require("script_runner").script_picker)
		end,
	},

	-- {
	-- 	"CRAG666/code_runner.nvim",
	-- 	config = function()
	-- 		vim.keymap.set("n", "<leader>rr", ":RunCode<CR>", { noremap = true, silent = false })
	-- 		vim.keymap.set("n", "<leader>rf", ":RunFile<CR>", { noremap = true, silent = false })
	-- 		vim.keymap.set("n", "<leader>rft", ":RunFile tab<CR>", { noremap = true, silent = false })
	-- 		vim.keymap.set("n", "<leader>rp", ":RunProject<CR>", { noremap = true, silent = false })
	-- 		vim.keymap.set("n", "<leader>rc", ":RunClose<CR>", { noremap = true, silent = false })
	-- 		vim.keymap.set("n", "<leader>crf", ":CRFiletype<CR>", { noremap = true, silent = false })
	-- 		vim.keymap.set("n", "<leader>crp", ":CRProjects<CR>", { noremap = true, silent = false })
	-- 	end,
	-- },

	-- {
	-- 	"dimaportenko/project-cli-commands.nvim",
	--
	-- 	dependencies = {
	-- 		"akinsho/toggleterm.nvim",
	-- 		"nvim-telescope/telescope.nvim",
	-- 	},
	--
	-- 	-- optional keymap config
	-- 	config = function()
	-- 		-- local OpenActions = require('project_cli_commands.open_actions')
	-- 		-- local RunActions = require('project_cli_commands.actions')
	-- 		--
	-- 		-- local config = {
	-- 		--   -- Key mappings bound inside the telescope window
	-- 		--   running_telescope_mapping = {
	-- 		--     ['<C-c>'] = RunActions.exit_terminal,
	-- 		--     ['<C-f>'] = RunActions.open_float,
	-- 		--     ['<C-v>'] = RunActions.open_vertical,
	-- 		--     ['<C-h>'] = RunActions.open_horizontal,
	-- 		--   },
	-- 		--   open_telescope_mapping = {
	-- 		--     { mode = 'i', key = '<CR>',  action = OpenActions.execute_script_vertical },
	-- 		--     { mode = 'n', key = '<CR>',  action = OpenActions.execute_script_vertical },
	-- 		--     { mode = 'i', key = '<C-h>', action = OpenActions.execute_script },
	-- 		--     { mode = 'n', key = '<C-h>', action = OpenActions.execute_script },
	-- 		--     { mode = 'i', key = '<C-i>', action = OpenActions.execute_script_with_input },
	-- 		--     { mode = 'n', key = '<C-i>', action = OpenActions.execute_script_with_input },
	-- 		--     { mode = 'i', key = '<C-c>', action = OpenActions.copy_command_clipboard },
	-- 		--     { mode = 'n', key = '<C-c>', action = OpenActions.copy_command_clipboard },
	-- 		--     { mode = 'i', key = '<C-f>', action = OpenActions.execute_script_float },
	-- 		--     { mode = 'n', key = '<C-f>', action = OpenActions.execute_script_float },
	-- 		--     { mode = 'i', key = '<C-v>', action = OpenActions.execute_script_vertical },
	-- 		--     { mode = 'n', key = '<C-v>', action = OpenActions.execute_script_vertical },
	-- 		--   }
	-- 		-- }
	--
	-- 		--
	-- 		-- vim.api.nvim_set_keymap("n", "<leader>p", ":Telescope project_cli_commands open<cr>",
	-- 		-- { noremap = true, silent = true })
	-- 		-- vim.api.nvim_set_keymap("n", "<leader>;", ":Telescope project_cli_commands running<cr>",
	-- 		-- { noremap = true, silent = true })
	--
	-- 		-- require('project_cli_commands').setup(config)
	-- 	end,
	-- },
}
