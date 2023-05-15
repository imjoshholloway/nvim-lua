vim.g.auto_save  = 1
vim.g.netrw_altv = 1

vim.opt.clipboard      = "unnamedplus" -- use system clipboard
vim.opt.completeopt    = { "menu", "menuone", "noselect" }
vim.opt.number         = true
vim.opt.relativenumber = true

vim.opt.swapfile = false
vim.opt.backup   = false
vim.opt.showmode = false
vim.opt.showcmd  = false

vim.opt.cursorline = true
vim.opt.backspace  = { "eol", "indent", "start" }
vim.opt.shortmess  = "cWF" -- disable various messages in menu
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 300
vim.opt.timeoutlen = 300 -- 300ms timeout for keybindings

-- make splitting more natural - By default vim splits to the left, right and down 'feels' right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- formatting vim.opt.ons
vim.opt.autoindent  = true
vim.opt.smarttab    = true
vim.opt.expandtab   = true
vim.opt.shiftwidth  = 4
vim.opt.tabstop     = 4
vim.opt.softtabstop = 4
