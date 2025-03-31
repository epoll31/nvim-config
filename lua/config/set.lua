vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.termguicolors = true

vim.api.nvim_set_var("t_SI", "\27[5 q")
vim.api.nvim_set_var("t_EI", "\27[1 q")
vim.opt.guicursor = "n:block,i:ver10,v:block,o:block"
vim.opt.cursorline = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
--vim.opt.colorcolumn = "80"
--vim.api.nvim_command('autocmd WinLeave * set colorcolumn=0')
--vim.api.nvim_command('autocmd WinEnter * set colorcolumn=80')

vim.diagnostic.config({
	virtual_lines = true,
	virtual_text = false,
})
