local fn = vim.fn
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({"git", "clone", "--depth=1", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.api.nvim_command("packadd packer.nvim")
end

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    -- visuals
    use "ful1e5/onedark.nvim"
    use "kyazdani42/nvim-web-devicons"

    -- statusline
    use "glepnir/galaxyline.nvim"

    -- navigation
    use "kyazdani42/nvim-tree.lua"

    -- syntax highting
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }
    use "sheerun/vim-polyglot"

    -- workflow
    use "terrortylor/nvim-comment"
    use { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" }
    use "ntpeters/vim-better-whitespace"
    use "lukas-reineke/indent-blankline.nvim"
    use "jiangmiao/auto-pairs"
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            {"nvim-lua/popup.nvim"},
            {"nvim-lua/plenary.nvim"},
        }
    }

    -- autocomplete
    use { "hrsh7th/cmp-vsnip", requires = "hrsh7th/nvim-cmp" }
    use { "hrsh7th/vim-vsnip", requires = "hrsh7th/nvim-cmp" }
    use { "hrsh7th/cmp-path", requires = "hrsh7th/nvim-cmp" }
    use { "hrsh7th/cmp-nvim-lsp", requires = "hrsh7th/nvim-cmp" }
    use { "hrsh7th/cmp-buffer", requires = "hrsh7th/nvim-cmp" }
    use { "hrsh7th/nvim-cmp" }

    -- lsp
    use {
        "williamboman/nvim-lsp-installer",
        "neovim/nvim-lspconfig",
        "onsails/lspkind-nvim",
        "nvim-lua/lsp-status.nvim",
        "ray-x/lsp_signature.nvim",
    }

    -- language specific tools
    use "ray-x/go.nvim"
    -- use "rust-lang/rust.vim"

    use {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install"
    }

    -- git related configs
    use "ThePrimeagen/git-worktree.nvim"
    use { "lewis6991/gitsigns.nvim", requires = "nvim-lua/plenary.nvim" }
    use "APZelos/blamer.nvim"
    use "rhysd/conflict-marker.vim"
    use "rhysd/committia.vim"
    use "kdheepak/lazygit.nvim"

    -- debugging
    use "mfussenegger/nvim-dap"
    use {
        "rcarriga/nvim-dap-ui",
        requires = "mfussenegger/nvim-dap",
    }

    use {
        "nvim-telescope/telescope-dap.nvim",
        requires = {
            {"nvim-telescope/telescope.nvim"},
            {"mfussenegger/nvim-dap"},
        }
    }
end)
