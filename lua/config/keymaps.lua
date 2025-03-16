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
end
)

vim.keymap.set("n", "<leader>v", "<cmd>vs<CR>") -- split horizontal
vim.keymap.set("n", "<leader>s", "<cmd>sp<CR>") -- split vertical
vim.keymap.set("n", "<leader>h", "<C-w>h")      -- pane left
vim.keymap.set("n", "<leader>j", "<C-w>j")      -- pane down
vim.keymap.set("n", "<leader>k", "<C-w>k")      -- pane up
vim.keymap.set("n", "<leader>l", "<C-w>l")      -- page right

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")      -- page right
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")      -- page right
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")      -- page right
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")      -- page right


-- <leader>r  ->  r = run
vim.keymap.set("n", "<leader>rf", "<F3>")                                    -- f = format
-- <leader>p  ->  p = project
vim.keymap.set("n", "<leader>pf", "<cmd>NeovimProjectDiscover history <CR>") -- f = find

vim.keymap.set("n", "<leader>so", "<cmd>source $HOME/.config/nvim/init.lua <CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever -- TODO: what does this do?
-- vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
--vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
--vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
--vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

--vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }
