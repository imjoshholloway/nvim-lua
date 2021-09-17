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

-- mergetool
-- utils.map('n', '<c-left>', '&diff? "<plug>(MergetoolDiffExchangeLeft)" : "\\<c-left>"' , { expr=true })
-- utils.map('n', '<c-right>', '&diff? "<plug>(MergetoolDiffExchangeRight)" : "\\<c-right>"' , { expr=true })
-- utils.map('n', '<c-up>', '&diff? "<plug>(MergetoolDiffExchangeUp)" : "\\<c-up>"' , { expr=true })
-- utils.map('n', '<c-down>', '&diff? "<plug>(MergetoolDiffExchangeDown)" : "\\<c-down>"' , { expr=true })
-- utils.map('n', '<up>', '&diff ? "[c" : "<up>"' , { expr=true })
-- utils.map('n', '<down>', '&diff ? "]c" : "<down>"' , { expr=true })

-- EasyAlign
-- utils.map('n', 'ga', '<plug>(EasyAlign)', {})
-- utils.map('x', 'ga', '<plug>(EasyAlign)', {})

-- discoverable mappings
local wk = require("which-key");

wk.register({
    f = {
        name = "files",
        g = {"<cmd>lua require('telescope.builtin').live_grep()<cr>", "grep in files"},
    },
    l = {
        name = "lsp",
        gd = {"<cmd>lua vim.lsp.buf.definition()<cr>", "go to definition"},
        gr = {"<cmd>:TroubleToggle lsp_references()<cr>", "show references in trouble"},
        H = {"<cmd>lua vim.lsp.buf.hover()<cr>", "show information about the current symbol"},
        t = {"<cmd>:TroubleToggle lsp_document_diagnostics<cr>", "toggle trouble window"},
        T = {"<cmd>:TroubleToggle lsp_workspace_diagnostics<cr>", "toggle workspace trouble window"},
    },
    b = {
        name = "buffers",
        b = {"<cmd>lua require('telescope.builtin').buffers({sort_lastused=true})<cr>", "list buffers"},
        d = {"<cmd>:BWipeout this<cr>", "delete current buffer"},
        c = {"<cmd>:BWipeout other<cr>", "close all buffers except current"},
        C = {"<cmd>:BWipeout all<cr>", "close all buffers"},
        l = {"<cmd>BufferLineCycleNext<cr>", "go to next buffer"},
        h = {"<cmd>BufferLineCyclePrev<cr>", "go to previous buffer"},
        s = {"<cmd>lua require('spectre').open_file_search()<cr>", "search and replace in  files"},
    },
    d = {
        name = "debugger",
        c = {"<cmd>lua require('dap').continue()<cr>", "launch or continue session"},
        r = {"<cmd>lua require('dap').restart()<cr>", "restart session"},
        i = {"<cmd>lua require('dap').step_into()<cr>", "step into"},
        o = {"<cmd>lua require('dap').step_over()<cr>", "step over"},
    },
    v = {
        name = "version control",
        f = { "<cmd>lua require('telescope.builtin').git_commits()<cr>", "find commits"},
        b = { "<cmd>Telescope git_branches<cr>", "show branches" },
        g = { "<cmd>Telescope git_status<cr>", "current changes" },
        B = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "blame current line" },
        o = { "<cmd>Neogit<cr>", "open neogit" },
        d = { "<cmd>DiffviewOpen<cr>", "open diffsplit" },
        c = { "<cmd>DiffviewClose<cr>", "close diffsplit" },
        P = { "<cmd>Gitsigns preview_hunk<cr>", "preview current hunk" },
        R = { "<cmd>Gitsigns reset_hunk<cr>", "reset current hunk" },
        p = { "<cmd>Gitsigns prev_hunk<cr>", "previous hunk" },
        n = { "<cmd>Gitsigns next_hunk<cr>", "next hunk" },
        m = { "<plug>(MergetoolToggle)", "toggle mergetool" },
    },
    m = {
        name = "mergetool",
        t = { "<plug>(MergetoolToggle)", "toggle mergetool" },
        s = { "<leader>mb :call mergetool#toggle_layout('mr')<cr>", "toggle mergetool (merged | remote )", noremap=true, silent=true },
        b = { "<leader>mb :call mergetool#toggle_layout('mr,b')<cr>", "toggle mergetool (merged | remote _ base )", noremap=true, silent=true },
        l = { "<leader>mb :call mergetool#toggle_layout('LBR')<cr>", "toggle mergetool (local | base | remote)", noremap=true, silent=true },
    },
}, { prefix = "<leader>" })
