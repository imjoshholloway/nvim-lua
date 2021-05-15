require("plugins")

require("autocomplete")
require("keys")
require("lsp")
require("neoscroll").setup()
require("nvim_comment").setup({line_mapping = "<leader>cl", operator_mapping = "<leader>c"})
require("statusline")
require("todo-comments").setup()
require("trouble").setup()

-- internal
local cmd = vim.cmd
local g = vim.g

-- colorscheme related stuff
vim.o.completeopt = "menu,menuone,noselect"

cmd[[colorscheme tokyonight]]
cmd[[filetype plugin indent on]]
cmd[[syntax enable]]
cmd[[syntax on]]

cmd[[set backspace=eol,indent,start]]  -- make backspace work properly
cmd[[set relativenumber]]
cmd[[set number]]
cmd[[set noshowmode]]
cmd[[set noswapfile]]
cmd[[set nobackup]]

cmd[[set cursorline]]                  -- highlight the current line
cmd[[set colorcolumn=80]]              -- show a vertical line at 80
cmd[[set shortmess+=c]]
cmd[[set signcolumn=yes]]
cmd[[set updatetime=300]]

-- make splitting more natural - By default vim splits to the left, right and down 'feels' right
cmd[[set splitbelow]]
cmd[[set splitright]]

-- nicer cursor
cmd[[set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor]]

-- formatting options
cmd[[set smarttab]]
cmd[[set expandtab]]
cmd[[set shiftwidth=4]]

cmd[[set clipboard=unnamedplus]]      -- use system clipboard
cmd[[set timeoutlen=300]]             -- 300ms timeout for keybindings

g.mapleader = " "
g.auto_save = 0
g.netrw_altv = 1

-- blankline
g.indentLine_enabled = 1
g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_show_first_indent_level = false
g.indent_blankline_filetype_exclude = {"help", "terminal"}
g.indent_blankline_buftype_exclude = {"terminal"}

-- inactive statuslines as thin splitlines
cmd[[highlight! StatusLineNC gui=underline guibg=NONE guifg=#383c44]]

cmd[[hi clear CursorLine]]
cmd[[hi cursorlinenr guibg=NONE guifg=#abb2bf]]
