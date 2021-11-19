local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth=1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.api.nvim_command('packadd packer.nvim')
end

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    -- visuals
    use "folke/tokyonight.nvim"
    use "kyazdani42/nvim-web-devicons"
    use "glepnir/galaxyline.nvim"

    -- syntax highting
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }
    use "sheerun/vim-polyglot"

    -- workflow
    use "folke/trouble.nvim"
    use "ntpeters/vim-better-whitespace"
    use "lukas-reineke/indent-blankline.nvim"
    use "jiangmiao/auto-pairs"

    -- auto complete
    use "hrsh7th/nvim-compe"

    -- lsp
    use {
        "williamboman/nvim-lsp-installer",
        "neovim/nvim-lspconfig",
        "onsails/lspkind-nvim",
        "nvim-lua/lsp-status.nvim",
        "glepnir/lspsaga.nvim",
        "ray-x/lsp_signature.nvim",
        "hrsh7th/vim-vsnip",
    }

    -- language specific tools
    use "ray-x/go.nvim"
    -- use "rust-lang/rust.vim"

    use {
        "iamcco/markdown-preview.nvim",
        run = 'cd app && npm install'
    }

    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
    }

    -- git related configs
    use {
        "lewis6991/gitsigns.nvim",
        requires = "nvim-lua/plenary.nvim",
    }

    use "rhysd/conflict-marker.vim"
    use "rhysd/committia.vim"

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

    -- fuzzy finder
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            {"nvim-lua/popup.nvim"},
            {"nvim-lua/plenary.nvim"},
        }
    }

    use {
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons",
        config = function() require("nvim-tree").setup() end
    }

end)
