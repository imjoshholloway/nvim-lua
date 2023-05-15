return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            { 'neovim/nvim-lspconfig' },
            {
                'williamboman/mason.nvim',
                build = ':MasonUpdate',
                config = true,
            },
            {
                'williamboman/mason-lspconfig.nvim',
                opts = {
                    ensure_installed = {'rust_analyzer', 'lua_ls', 'tsserver', 'gopls'},
                },
                config = true,
            },

            -- Autocompletion - used to wire up the LSP capabilites
            {
                'hrsh7th/nvim-cmp',
                event = "InsertEnter",
                dependencies = {
                    {
                        -- snippet plugin
                        "L3MON4D3/LuaSnip",
                        dependencies = {
                            "rafamadriz/friendly-snippets"
                        },
                        opts = {
                            history = true,
                            updateevents = "TextChanged,TextChangedI"
                        },
                        config = true,
                    },

                    -- autopairing of (){}[] etc
                    {
                        "windwp/nvim-autopairs",
                        opts = {
                            fast_wrap = {},
                            disable_filetype = {"TelescopePrompt", "vim"},
                        },
                        config = function(_, opts)
                            require("nvim-autopairs").setup(opts)
                            -- setup cmp for autopairs
                            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
                            require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
                        end,
                    },
                    {
                        "onsails/lspkind.nvim",
                    },
                    -- cmp sources plugins
                    {
                        "saadparwaiz1/cmp_luasnip",
                        "hrsh7th/cmp-nvim-lua",
                        "hrsh7th/cmp-nvim-lsp",
                        "hrsh7th/cmp-buffer",
                        "hrsh7th/cmp-path",
                    },
                },
                opts= function()
                    local cmp = require("cmp")
                    local lspkind = require('lspkind')

                    return {
                        window = {
                            completion = cmp.config.window.bordered(),
                            documentation = cmp.config.window.bordered()
                        },
                        mapping = cmp.mapping.preset.insert({
                            ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                            ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                            ["<CR>"] = cmp.mapping.confirm({ select = false }),
                            ["<S-CR>"] = cmp.mapping.confirm({
                                behavior = cmp.ConfirmBehavior.Replace,
                                select = false,
                            }),
                        }),
                        formatting = {
                            format =  lspkind.cmp_format({
                                mode = 'symbol_text',
                                maxwidth = 50,
                                ellipsis_char = '...',
                            })
                        },
                    }
                end,
            },
        },
        config = function()
            local lsp = require('lsp-zero').preset({})

            require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

            lsp.on_attach(function(client, bufnr)
                lsp.default_keymaps({buffer = bufnr})
            end)
            lsp.set_sign_icons({
                error = '✘',
                warn = '▲',
                hint = '⚑',
                info = '»'
            })
            lsp.setup()
        end
    },

    { "folke/neodev.nvim", config = true },
}
