vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
--vim.keymap.set("n", "<leader>q", ":q<Enter>")
vim.keymap.set("n", "<leader>q", function()
	local win_count = vim.api.nvim_eval("winnr('$')")
	if win_count == 1 then
		-- This is where you place the logic that should be executed if it's the last window.
		-- Replace this comment with your command or logic for <leader>pf.
		require("telescope.builtin").find_files({})
	else
		vim.cmd("q")
	end
end)

vim.keymap.set("n", "<leader>Q", "<cmd>qa!<CR>")
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>v", "<cmd>vs<CR>") -- split horizontal
vim.keymap.set("n", "<leader>s", "<cmd>sp<CR>") -- split vertical
vim.keymap.set("n", "<leader>h", "<C-w>h") -- pane left
vim.keymap.set("n", "<leader>j", "<C-w>j") -- pane down
vim.keymap.set("n", "<leader>k", "<C-w>k") -- pane up
vim.keymap.set("n", "<leader>l", "<C-w>l") -- page right

vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
vim.keymap.set("v", "<leader>x", ":lua<CR>")

-- vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
-- vim.keymap.set("n", "<leader>gf", "<cmd>Telescope git_files<CR>")
-- vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
-- vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
-- vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")
-- vim.keymap.set("n", "<leader>fts", "<cmd>Telescope treesitter<CR>")

-- <leader>p  ->  p = project
vim.keymap.set("n", "<leader>pp", "<cmd>NeovimProjectHistory <CR>") -- f = find
vim.keymap.set("n", "<leader>ph", "<cmd>NeovimProjectDiscover history <CR>") -- f = find

require("config.helpers.terminal").setup()
