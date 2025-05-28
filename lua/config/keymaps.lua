-- vim.keymap.set("n", "<leader>e", vim.cmd.Oil)
-- vim.keymap.set("n", "<leader>e", ":Ex<CR>")
-- TODO: add <leader>E to redirect to explorer in CWD

-- escape bindings
vim.keymap.set("n", "<leader>q", function()
	local win_count = vim.api.nvim_eval("winnr('$')")
	if win_count == 1 then
		-- This is where you place the logic that should be executed if it's the last window.
		-- Replace this comment with your command or logic for <leader>pf.
		require("snacks.picker").files()
	else
		vim.cmd("q")
	end
end)
vim.keymap.set("n", "<leader>Q", "<cmd>qa!<CR>")
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- quick moving and spliting  bindings
-- vim.keymap.set("n", "<leader>wv", "<cmd>vs<CR>") -- split horizontal
-- vim.keymap.set("n", "<leader>ws", "<cmd>sp<CR>") -- split vertical
-- vim.keymap.set("n", "<leader>wh", "<C-w>h") -- pane left
-- vim.keymap.set("n", "<leader>wj", "<C-w>j") -- pane down
-- vim.keymap.set("n", "<leader>wk", "<C-w>k") -- pane up
-- vim.keymap.set("n", "<leader>wl", "<C-w>l") -- page right
--
-- moving align center
-- Move 1 line and center
vim.keymap.set("n", "<C-j>", "<cmd>normal! jzz<CR>", {
	noremap = true,
	silent = true,
	desc = "Move down 1 line and center screen",
})

vim.keymap.set("n", "<C-k>", "<cmd>normal! kzz<CR>", {
	noremap = true,
	silent = true,
	desc = "Move up 1 line and center screen",
})

-- Move 10 lines and center
vim.keymap.set("n", "<C-S-j>", "<cmd>normal! 10jzz<CR>", {
	noremap = true,
	silent = true,
	desc = "Move down 10 lines and center screen",
})

vim.keymap.set("n", "<C-S-k>", "<cmd>normal! 10kzz<CR>", {
	noremap = true,
	silent = true,
	desc = "Move up 10 lines and center screen",
})

-- -- SECTION: persistence bindings
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
