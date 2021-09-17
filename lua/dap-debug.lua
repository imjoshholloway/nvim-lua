local dap = require("dap");
require("telescope").load_extension("dap")
require("dapui").setup()

dap.adapters.go = function(cb)
    local stdout = vim.loop.new_pipe(false)
    local host = "127.0.0.1"
    local port = 38697

    local opts = {
        stdio = {nil, stdout},
        args = {"dap", "-l", host .. ":" .. port},
        detached = true,
    }

    local handle
    local pid_or_err
    handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code, signal)
        stdout:close()
        handle:close()
        print("dlv exit code", code)
        print("dlv exit signal", signal)
    end)

    assert(handle, "Error running delve: " .. tostring(pid_or_err))

    -- wait for delve to start
    vim.defer_fn(function()
        cb({type = "server", host = host, port = port})
    end, 100)
end

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
    {
        type = "go",
        name = "Debug",
        request = "launch",
        program = "${file}"
    },
};


