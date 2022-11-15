-- init.lua

require('ep.options')
require('ep.plugins')

if vim.fn.exists("g:neovide") ~= 0 then
	-- neovide only stuff

	vim.g.neovide_scroll_animation_length = 0.3
	vim.g.neovide_profiler = false
	vim.g.neovide_cursor_animation_length = 0.13
	vim.g.neovide_cursor_trail_size = 0.8
end


