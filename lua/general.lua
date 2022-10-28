local opt = vim.opt
local g = vim.g

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
opt.shortmess  = "cWF" -- disable various messages in menu
opt.signcolumn = "yes"
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

-- plugin specific configs

g.better_whitespace_enabled = 1
g.strip_whitespace_on_save  = 1
g.strip_whitespace_confirm  = 0
g.strip_only_modified_lines = 1

-- blankline
g.indentLine_enabled                              = 1
g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_show_first_indent_level        = false
g.indent_blankline_filetype_exclude               = { "help", "terminal" }
g.indent_blankline_buftype_exclude                = { "terminal" }

g.blamer_delay   = 500
g.blamer_enabled = 1
