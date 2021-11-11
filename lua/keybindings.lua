local map = require("utils").map;

-- ctrl-hjkl to navigate splits
map('n', '<c-k>', '<cmd>wincmd k<cr>')
map('n', '<c-j>', '<cmd>wincmd j<cr>')
map('n', '<c-h>', '<cmd>wincmd h<cr>')
map('n', '<c-l>', '<cmd>wincmd l<cr>')

map('n', '<leader>f', '<cmd>:Telescope find_files<cr>')

map('i', '<Tab>', 'v:lua.tab_complete()', {expr = true})
map('s', '<Tab>', 'v:lua.tab_complete()', {expr = true})
map('i', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})
map('s', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})
