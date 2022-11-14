-- init.lua

require('ep.plugins')

if vim.fn.exists("g:neovide") ~= 0 then
	-- neovide only stuff

	vim.g.neovide_scroll_animation_length = 0.3
	vim.g.neovide_profiler = false
	vim.g.neovide_cursor_animation_length = 0.13
	vim.g.neovide_cursor_trail_size = 0.8
end

vim.opt.guifont = { "JetBrains Mono", "h12" }

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = false

