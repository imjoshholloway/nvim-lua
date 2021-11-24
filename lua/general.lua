local opt = vim.opt
local g = vim.g

vim.cmd('colorscheme tokyonight')

g.mapleader = " "

g.auto_save  = 1
g.netrw_altv = 1

opt.clipboard      = "unnamedplus" -- use system clipboard
opt.completeopt    = { "menu", "menuone", "noselect" }
opt.number         = true
opt.relativenumber = true

opt.swapfile = false
opt.backup   = false
opt.showmode = false
opt.showcmd  = false

opt.cursorline = true
opt.backspace  = { "eol", "indent", "start" }

-- nicer cursor
opt.guicursor   = "n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor"
opt.colorcolumn = "80" -- show vertical bar at column 80
opt.shortmess   = "cF"
opt.signcolumn  = "yes"
opt.updatetime = 300
opt.timeoutlen = 300 -- 300ms timeout for keybindings

-- make splitting more natural - By default vim splits to the left, right and down 'feels' right
opt.splitbelow = true
opt.splitright = true

-- formatting options
opt.autoindent  = true
opt.smarttab    = true
opt.expandtab   = true
opt.shiftwidth  = 4
opt.tabstop     = 4
opt.softtabstop = 4

g.better_whitespace_enabled = 1
g.strip_whitespace_on_save  = 1
g.strip_whitespace_confirm  = 0

-- https://github.com/ntpeters/vim-better-whitespace/issues/127
vim.cmd("autocmd BufWritePre * :StripWhitespace")

-- blankline
g.indentLine_enabled = 1
g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_show_first_indent_level        = false
g.indent_blankline_filetype_exclude               = {"help", "terminal"}
g.indent_blankline_buftype_exclude                = {"terminal"}

g.coq_settings = { auto_start = true }
