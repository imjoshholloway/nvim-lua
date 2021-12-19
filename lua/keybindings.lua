local map = require("utils").map;

local mappings = {
  -- ctrl-hjkl to navigate splits
  ['<c-k>'] = '<cmd>wincmd k<cr>',
  ['<c-j>'] = '<cmd>wincmd j<cr>',
  ['<c-h>'] = '<cmd>wincmd h<cr>',
  ['<c-l>'] = '<cmd>wincmd l<cr>',

  -- toggle tree
  ['<c-n>'] = '<cmd>NvimTreeToggle<cr>',

  ['<leader>f'] = '<cmd>Telescope find_files<cr>',
  ['<leader>fg'] = '<cmd>Telescope live_grep<cr>',

  ['<leader>gc'] = '<cmd>lua require("telescope").extensions.git_worktree.create_git_worktree()<cr>',
  ['<leader>gb'] = '<cmd>lua require("telescope").extensions.git_worktree.git_worktree()<cr>',

  ['lg'] = '<cmd>LazyGit<cr>',
}

for key, val in pairs(mappings) do
  map('n', key, val)
end
