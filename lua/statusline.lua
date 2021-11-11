local gl = require("galaxyline")
local gls = gl.section
local left = gls.left
local right = gls.right

-- keeping this table { } as empty will show inactive statuslines
gl.short_line_list = {" "}

local colors = {
    bg = "#1e222a",
    line_bg = "#1e222a",
    fg = "#D8DEE9",
    fg_green = "#65a380",
    yellow = "#A3BE8C",
    cyan = "#22262C",
    darkblue = "#61afef",
    green = "#BBE67E",
    orange = "#FF8800",
    purple = "#252930",
    magenta = "#c678dd",
    blue = "#22262C",
    red = "#DF8890",
    lightbg = "#282c34",
    nord = "#81A1C1",
    greenYel = "#EBCB8B"
}

-- inactive statuslines as thin splitlines
vim.cmd[[highlight! StatusLineNC gui=underline guibg=NONE guifg=#1e222a]]

table.insert(left, {
    statusIcon = {
       provider = function()
            return "  "
        end,
        highlight = {colors.bg, colors.nord},
        separator_highlight = {colors.lightbg, colors.lightbg}
    }
})

table.insert(left, {
    ViMode = {
        provider = function()
            local alias = {
                n = "NORMAL",
                i = "INSERT",
                c = "COMMAND",
                V = "VISUAL",
                [""] = "VISUAL",
                v = "VISUAL",
                R = "REPLACE"
            }
            return alias[vim.fn.mode()]
        end,
        highlight = {colors.bg, colors.nord},
	separator = " ",
        separator_highlight = {colors.bg, colors.nord}
    }
})

table.insert(left, {
    teech = {
        provider = function()
            return ""
        end,
        separator = " ",
        separator_highlight = {colors.lightbg, colors.lightbg},
        highlight = {colors.nord, colors.lightbg}
    }
})

table.insert(left, {
    LspStatus = {
        provider = function()
            return require('lsp-status').status()
        end,
        icon = ':',
        highlight = {colors.fg, colors.lightbg},
    }
})

table.insert(left, {
    teech2 = {
        provider = function()
            return ""
        end,
        highlight = {colors.lightbg, colors.bg}
    }
})

-- right hand side

table.insert(right, {
    DiffAdd = {
        provider = "DiffAdd",
        icon = "   ",
        highlight = {colors.greenYel, colors.line_bg}
    }
})

table.insert(right, {
    DiffModified = {
        provider = "DiffModified",
        icon = " ",
        highlight = {colors.orange, colors.line_bg}
    }
})

table.insert(right, {
    DiffRemove = {
        provider = "DiffRemove",
        icon = " ",
        highlight = {colors.red, colors.line_bg}
    }
})
