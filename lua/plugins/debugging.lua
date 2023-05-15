return {
    {
        "mfussenegger/nvim-dap",
        keys = {
            {"<leader>dc", "<cmd>lua require('dap').continue()<CR>", desc = "Start debugging"},
            {"<leader>dx", "<cmd>lua require('dap').close()<CR>", desc = "Stop debugging"},
            {"<leader>do", "<cmd>lua require('dap').step_over()<CR>", desc = "Step over"},
            {"<leader>di", "<cmd>lua require('dap').step_into()<CR>", desc = "Step into"},
            {"<leader>dt", "<cmd>lua require('dap').step_out()<CR>", desc = "Step out"},
            {"<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>", desc = "Toggle breakpoint"},
            {"<leader>dv", "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", desc = "Toggle breakpoint"},
            {"<leader>dr", "<cmd>lua require('dap').repl.open()<CR>", desc = "Open repl"},
            {"<leader>du", "<cmd>lua require('dapui').toggle()<CR>", desc = "Toggle dap UI"},
        },
    },
    {
        -- Refer to the following help file for REPL commands.
        -- :h dap.repl.open()
        --
        -- REPL Examples:
        -- .n == next
        -- .c == continue
        -- .into == step in
        -- .out == step out
        -- .scopes == print variables
        --
        -- Just typing an expression (e.g. typing a variable name) should evaluate its value.
        "rcarriga/nvim-dap-ui",
        dependencies = {"mfussenegger/nvim-dap"},
        config = function(_, opts)
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup(opts)
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open({})
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close({})
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close({})
            end
        end,
    },
    {
        "leoluz/nvim-dap-go",
        dependencies = {"mfussenegger/nvim-dap"},
        build = "go install github.com/go-delve/delve/cmd/dlv@latest",
        config = true
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        dependencies = {"mfussenegger/nvim-dap"},
        config = true
    },
}
