local map = require("utils").map;

-- ctrl-hjkl to navigate splits
map('n', '<c-k>', '<cmd>wincmd k<cr>')
map('n', '<c-j>', '<cmd>wincmd j<cr>')
map('n', '<c-h>', '<cmd>wincmd h<cr>')
map('n', '<c-l>', '<cmd>wincmd l<cr>')

map('n', '<leader>f', '<cmd>:Telescope find_files<cr>')
map('n', 'lg', '<cmd>LazyGit<cr>')
map('n', '<leader>n', '<cmd>:NvimTreeToggle<cr>')
