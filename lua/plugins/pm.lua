local function gen_scripts_file_paths()
	local session_projects = require("neovim-project.utils.history").session_projects

	local relative_script_path = "/.nvim/scripts.json"
	local script_paths = {}
	for i, path in pairs(session_projects) do
		script_paths[i] = path .. relative_script_path
		-- vim.api.nvim_out_write(script_paths[i] .. "/n")
	end

	return script_paths
end

--@type table
local function parse_scripts_file(path)
	local ok, json_string = pcall(function()
		local _, err = io.open(path, "r")
		if err ~= nil then
			return ""
		end
		local json = io.read("*all")
		-- io.close(file)
		return json
	end)

	if not ok then
		vim.api.nvim_err_writeln("Failed to read file: " .. json_string)
		return {}
	end
	vim.api.nvim_err_writeln("json_string: " .. json_string)
	local ok, json_data = pcall(vim.json.decode, json_string)

	if not ok then
		vim.api.nvim_err_writeln("Failed to parse JSON: " .. json_data)
		return {}
	end

	return json_data
end

local function run_default_script()
	local in_sesson = require("neovim-project.project").in_session()
	if in_sesson == false then
		vim.notify("session not started")
	end

	local inspect = require("vim.inspect")
	local scripts_file_paths = gen_scripts_file_paths()

	for _, path in ipairs(scripts_file_paths) do
		local scripts = parse_scripts_file(path)
		vim.notify(inspect(scripts))
	end

	-- vim.notify(inspect(scripts_file_paths))
end

-- Map a keybinding to run the script

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

			-- vim.keymap.set("n", "<leader>r<CR>", run_default_script, { noremap = true, silent = true })
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
		"dimaportenko/project-cli-commands.nvim",

		dependencies = {
			"akinsho/toggleterm.nvim",
			"nvim-telescope/telescope.nvim",
		},

		-- optional keymap config
		config = function()
			-- local OpenActions = require('project_cli_commands.open_actions')
			-- local RunActions = require('project_cli_commands.actions')
			--
			-- local config = {
			--   -- Key mappings bound inside the telescope window
			--   running_telescope_mapping = {
			--     ['<C-c>'] = RunActions.exit_terminal,
			--     ['<C-f>'] = RunActions.open_float,
			--     ['<C-v>'] = RunActions.open_vertical,
			--     ['<C-h>'] = RunActions.open_horizontal,
			--   },
			--   open_telescope_mapping = {
			--     { mode = 'i', key = '<CR>',  action = OpenActions.execute_script_vertical },
			--     { mode = 'n', key = '<CR>',  action = OpenActions.execute_script_vertical },
			--     { mode = 'i', key = '<C-h>', action = OpenActions.execute_script },
			--     { mode = 'n', key = '<C-h>', action = OpenActions.execute_script },
			--     { mode = 'i', key = '<C-i>', action = OpenActions.execute_script_with_input },
			--     { mode = 'n', key = '<C-i>', action = OpenActions.execute_script_with_input },
			--     { mode = 'i', key = '<C-c>', action = OpenActions.copy_command_clipboard },
			--     { mode = 'n', key = '<C-c>', action = OpenActions.copy_command_clipboard },
			--     { mode = 'i', key = '<C-f>', action = OpenActions.execute_script_float },
			--     { mode = 'n', key = '<C-f>', action = OpenActions.execute_script_float },
			--     { mode = 'i', key = '<C-v>', action = OpenActions.execute_script_vertical },
			--     { mode = 'n', key = '<C-v>', action = OpenActions.execute_script_vertical },
			--   }
			-- }

			--
			-- vim.api.nvim_set_keymap("n", "<leader>p", ":Telescope project_cli_commands open<cr>",
			-- { noremap = true, silent = true })
			-- vim.api.nvim_set_keymap("n", "<leader>;", ":Telescope project_cli_commands running<cr>",
			-- { noremap = true, silent = true })

			-- require('project_cli_commands').setup(config)
		end,
	},
}
