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

-- escape bindings
vim.keymap.set("n", "<leader>Q", "<cmd>qa!<CR>")
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- quick moving and spliting  bindings
vim.keymap.set("n", "<leader>v", "<cmd>vs<CR>") -- split horizontal
vim.keymap.set("n", "<leader>s", "<cmd>sp<CR>") -- split vertical
vim.keymap.set("n", "<leader>h", "<C-w>h") -- pane left
vim.keymap.set("n", "<leader>j", "<C-w>j") -- pane down
vim.keymap.set("n", "<leader>k", "<C-w>k") -- pane up
vim.keymap.set("n", "<leader>l", "<C-w>l") -- page right

-- lua sourcing
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- <leader>p  ->  p = project
vim.keymap.set("n", "<leader>pp", "<cmd>NeovimProjectHistory <CR>") -- f = find
vim.keymap.set("n", "<leader>pf", "<cmd>NeovimProjectDiscover history <CR>") -- f = find
