local utils = require("utils");

-- ctrl-hjkl to navigate splits
utils.map('n', '<c-k>', '<cmd>wincmd k<cr>')
utils.map('n', '<c-j>', '<cmd>wincmd j<cr>')
utils.map('n', '<c-h>', '<cmd>wincmd h<cr>')
utils.map('n', '<c-l>', '<cmd>wincmd l<cr>')

utils.map('n', '<leader>f', '<cmd>:Telescope find_files<cr>')
utils.map('i', '<Tab>', 'v:lua.tab_complete()', {expr = true})
utils.map('s', '<Tab>', 'v:lua.tab_complete()', {expr = true})
utils.map('i', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})
utils.map('s', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})

-- lsp related keybuildings
local opts = { noremap = true, silent = true };
utils.map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
utils.map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
utils.map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
utils.map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
utils.map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
utils.map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
utils.map('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
utils.map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
utils.map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
utils.map('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
utils.map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
utils.map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
