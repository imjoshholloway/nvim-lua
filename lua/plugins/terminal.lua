return {
    {
        -- TERMINAL
        "akinsho/toggleterm.nvim",
        version = "v2.*",
        keys = {
            {"<leader>tf", "<cmd>ToggleTerm direction=float<CR>", desc = "Toggle floating terminal"},
            {"<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", desc = "Toggle vertical terminal"},
            {"<leader>tt", "<cmd>ToggleTerm direction=tab<CR>", desc = "Toggle terminal in new tab"},
        },
        config = true
    }
}
