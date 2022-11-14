
vim.keymap.set('', '<up>', '<nop>')
vim.keymap.set('', '<down>', '<nop>')
vim.keymap.set('', '<left>', '<nop>')
vim.keymap.set('', '<right>', '<nop>')
vim.keymap.set('i', '<TAB>', function()
  return vim.fn.pumvisible() == 1 and '<C-n>' or '<TAB>' 
end, { expr = true })
vim.keymap.set('i', '<S-TAB>', function()
  return vim.fn.pumvisible() == 1 and '<C-p>' or '<S-TAB>'
end, { expr = true })

