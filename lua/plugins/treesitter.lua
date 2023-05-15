return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "bash", "comment", "json", "proto", "yaml", "typescript", "javascript", "python",
                    "go", "gomod", "gowork", "rust", "lua", "vim" },
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true,
                },
                matchup = {
                    enable = true, -- mandatory, false will disable the whole extension
                },
            })
        end
    },
}
