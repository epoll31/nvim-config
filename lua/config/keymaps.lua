vim.keymap.set("n", "<leader>e", vim.cmd.Oil)
-- TODO: add <leader>E to redirect to explorer in CWD

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

-- session bindings
vim.keymap.set("n", "<leader>ps", function()
	require("persistence").load()
end, {
	desc = "Load CD Session",
})

-- select a session to load
vim.keymap.set("n", "<leader>pS", function()
	require("persistence").select()
end, {
	desc = "Select Session",
})

-- load the last session
vim.keymap.set("n", "<leader>pl", function()
	require("persistence").load({ last = true })
end, {
	desc = "Load Last Session",
})

-- stop Persistence => session won't be saved on exit
vim.keymap.set("n", "<leader>pd", function()
	require("persistence").stop()
end, {
	desc = "Stop Persistence",
})
