-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
--
local cmp = require('cmp') 
local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.setup_nvim_cmp({
  sources = {
    -- This one provides the data from copilot.
    {name = 'copilot'},

    --- These are the default sources for lsp-zero
    {name = 'path'},
    {name = 'nvim_lsp', keyword_length = 3},
    {name = 'buffer', keyword_length = 3},
    {name = 'luasnip', keyword_length = 2},
  },
  mapping = lsp.defaults.cmp_mappings({
    ['<CR>'] = cmp.mapping.confirm({
      -- documentation says this is important.
      -- I don't know why.
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    })
  })
})

lsp.setup()
