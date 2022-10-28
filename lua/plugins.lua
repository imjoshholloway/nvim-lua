local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth=1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.api.nvim_command("packadd packer.nvim")
end

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    use {
        "yamatsum/nvim-nonicons",
        requires = "kyazdani42/nvim-web-devicons"
    }
    use {
        "/navarasu/onedark.nvim",
        config = function()
            require("onedark").setup({
                style = "darker",
                highlight_linenumber = true
            })

            require("onedark").load()
        end
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
        "kyazdani42/nvim-tree.lua",
        config = function()
            require("nvim-tree").setup()
        end
    }
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
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
    }
    use {
        "terrortylor/nvim-comment",
        config = function()
            require("nvim_comment").setup()
        end
    }
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup()
        end
    }
    use "ntpeters/vim-better-whitespace"
    use "lukas-reineke/indent-blankline.nvim"
    use "andymass/vim-matchup"
    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({
                check_ts = true,
                fast_wrap = {
                    map = '<C-e>',
                },
            })
        end
    }
    use "tpope/vim-surround"
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-lua/popup.nvim" },
            { "nvim-lua/plenary.nvim" },
        },
        config = function()
            require("telescope").setup()
        end
    }
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                mode = "document_diagnostics",
                auto_close = true,
            }
        end
    }
    -- lsp
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'onsails/lspkind-nvim' },
            { 'nvim-lua/lsp-status.nvim' },
            { 'ray-x/lsp_signature.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    -- debugging
    use "mfussenegger/nvim-dap"
    use {
        "rcarriga/nvim-dap-ui",
        requires = "mfussenegger/nvim-dap",
    }
    use {
        "nvim-telescope/telescope-dap.nvim",
        requires = {
            { "nvim-telescope/telescope.nvim" },
            { "mfussenegger/nvim-dap" },
        }
    }

    -- language specific tools
    use {
        "ray-x/go.nvim",
        config = function()
            require("go").setup({
                gofmt = 'gopls'
            })
        end
    }
    -- use "rust-lang/rust.vim"

    -- git related configs
    use {
        "lewis6991/gitsigns.nvim",
        requires = "nvim-lua/plenary.nvim"
    }
    use "APZelos/blamer.nvim"
    use "rhysd/conflict-marker.vim"
    use "rhysd/committia.vim"
end)
