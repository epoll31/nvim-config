local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })

  vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', { buffer = bufnr })
  vim.keymap.set('n', '<C-x>', vim.lsp.buf.code_action, { buffer = bufnr })
end)


require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    csharp_ls,
    csharpier,
    cssls,
    html,
    tsserver,
    jsonls,
    lua_ls,
    prettier,
  },
  handlers = {
    lsp_zero.default_setup,
  },
})

require('copilot').setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
})
require('copilot_cmp').setup()

local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'copilot'},
    {name = 'nvim_lsp'},
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ['<C-c'] = cmp.mapping.abort(),
  },
})


-- local cmp = require('cmp')
-- local cmp_format = require('lsp-zero').cmp_format()
--
-- cmp.setup({
--   sources = {
--     {name = 'nvim_lsp'},
--     {name = 'buffer'},
--   },
--   --- (Optional) Show source name in completion menu
--   formatting = cmp_format,
--   mapping = cmp.mapping.preset.insert({
--     -- confirm completion
--     ['<CR>'] = cmp.mapping.confirm({select = true}),
--     -- scroll up and down the documentation window
--     ['<C-u>'] = cmp.mapping.scroll_docs(-4),
--     ['<C-d>'] = cmp.mapping.scroll_docs(4),
--   })
-- })

-- local lsp = require('lsp-zero').preset({})

-- lsp.on_attach(function(client, bufnr)
-- see :help lsp-zero-keybindings
-- to learn the available actions
--   lsp.default_keymaps({buffer = bufnr})
-- end)

-- (Optional) Configure lua language server for neovim
-- require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

-- lsp.setup({
--   mapping = lsp.mapping.preset.insert({
--    ['CR'] = lsp.mapping.confirm({select = true}),
--    ['<C-u>'] = lsp.mapping.scroll_docs(-4),
--    ['<C-d>'] = lsp.mapping.scroll_docs(4),
--  }),
--})
