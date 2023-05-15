return {
    {
        "/navarasu/onedark.nvim",
        config = function()
            require("onedark").setup({
                style = "darker",
                highlight_linenumber = true
            })

            require("onedark").load()
        end
    },
    {
        "folke/which-key.nvim",
        config = true,
    },

    -- statusline
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            -- auto change color according to neovims mode
            local function mode_format(str)
                local icons = {
                    n      = ' ',
                    i      = ' ',
                    c      = 'ﲵ ',
                    [''] = ' ',
                    v      = ' ',
                    r      = '﯒ ',
                    t      = ' ',
                };
                local l = str:sub(1, 1)
                return (icons[string.lower(l)] ~= nil and icons[string.lower(l)] or icons['c']) .. (l and l or '')
            end

            require("lualine").setup({
                sections = {
                    lualine_a = {
                        { 'mode', icons_enabled = true, fmt = mode_format }
                    },
                },
            })
        end,
    },

    -- nav-tree
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        keys = {
            { "<C-n>", "<cmd> NvimTreeToggle <CR>", desc = "Toogle NvimTree" },
        },
        config = true,
    },


    {
        "folke/noice.nvim",
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
        keys = {
            {
                "<leader><leader>nd",
                function() vim.cmd("Noice dismiss") end,
                desc = "Dismiss visible messages",
                mode = "n",
                noremap = true,
                silent = true
            }
        },
        opts = {
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            presets = {
                lsp_doc_border = true
            }
        }
    },

    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = true
    },

    {
        'stevearc/dressing.nvim',
        config = true,
    },
    {
        "j-hui/fidget.nvim",
        config = true,
    }
}
