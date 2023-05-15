return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            { "nvim-lua/popup.nvim" },
            { "nvim-lua/plenary.nvim" },
        },
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "[F]ind [F]iles" },
            { "<leader>gf", "<cmd>Telescope git_files<CR>", desc = "[G]it [F]iles" },
            { "<leader>vh", "<cmd>Telescope help_Tags<CR>", },
        },
    },
}
