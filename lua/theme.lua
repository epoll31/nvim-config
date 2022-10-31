-- this function is the only way we should be setting our colorscheme
local function set_colorscheme(name)
    -- write our colorscheme back to our single source of truth
    vim.fn.writefile({name}, base16_theme_fname)
    -- set Neovim's colorscheme
    vim.cmd('colorscheme '..name)
    -- execute `kitty @ set-colors -c <color>` to change terminal window's
    -- colors and newly created terminal windows colors
    vim.loop.spawn('kitty', {
        args = {
            '@',
            'set-colors',
            '-c',
            string.format(vim.env.HOME..'/base16-kitty/colors/%s.conf', name)
        }
    }, nil)
end

