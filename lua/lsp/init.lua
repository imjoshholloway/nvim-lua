require('lsp_signature').setup()

local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.nvim_workspace()

lsp.setup_nvim_cmp({
    sources = {
        --- These are the default sources for lsp-zero
        { name = 'path' },
        { name = 'nvim_lsp', keyword_length = 1 },
        { name = 'buffer', keyword_length = 2 },
        { name = 'luasnip', keyword_length = 2 },
    },
})

lsp.setup()

-- trigger formatting of the file on save
vim.api.nvim_exec([[ autocmd BufWritePre * lua vim.lsp.buf.format(nil, 1000) ]], false)

-- trigger go imports on save
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)
