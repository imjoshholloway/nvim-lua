require("plugins")

require("lsp")

require("statusline")
require("neoscroll").setup()

require("general")
require("autocomplete")

local cmd = vim.cmd
local g = vim.g

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
