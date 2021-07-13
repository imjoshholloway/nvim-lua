-- Install missing servers
local required_servers = {"lua", "rust", "go"}
local installed_servers = require("lspinstall").installed_servers()

for _, server in pairs(required_servers) do
    if not vim.tbl_contains(installed_servers, server) then
        require("lspinstall").install_server(server)
    end
end

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
        signs = false,
        update_in_insert = true,
    }
)

require("lspkind").init({
    with_text = true,
    symbol_map = {
        Folder = ""
    }
})

local lsp_status = require("lsp-status")

lsp_status.config({
    indicator_errors = '  ',
    indicator_warning = '  ',
    indicator_info = '  ',
    indicator_hint = '  ',
    status_symbol = '',
    current_function = false,
})

lsp_status.register_progress()


-- config that activates keymaps and enables snippet support
--local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities.textDocument.completion.completionItem.snippetSupport = true
--capabilities.textDocument.completion.completionItem.resolveSupport = {
--    properties = {
--        'documentation',
--        'detail',
--        'additionalTextEdits',
--    }
--}

local default_config = {
    -- enable snippet support
    capabilities = lsp_status.capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = function(client, bufnr)
        lsp_status.on_attach(client, bufnr)
        require("lsp_signature").on_attach(client, bufnr)
    end,
}

-- table containing the lsp config overrides for each language server
local lsp_server_config = {
    lua = {
        settings = {
            -- Configure language server for neovim development
            Lua = {
                runtime = {
                    -- LuaJIT in the case of Neovim
                    version = 'LuaJIT',
                    path = vim.split(package.path, ';'),
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = {'vim'},
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = {
                        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                    },
                },
            },
        },
    },
    gopls = {
        cmd = {'gopls','--remote=auto'},
        capabilties = {
            textDocuemnt = {
                completion = {
                    completionItem = {
                        snippetSupport = true
                    }
                }
            }
        },
        init_options = {
            usePlaceholders = true,
            completeUnimported = true
        }
    }
}

-- lsp-install
local function setup_servers()
    require("lspinstall").setup()

    -- get all installed servers
    local servers = require("lspinstall").installed_servers()

    for _, server in pairs(servers) do
	local config = {}
        -- merge the default config with any specific lsp config
	if lsp_server_config[server] ~= nil then
		config = lsp_server_config[server]
	end
        require('lspconfig')[server].setup(vim.tbl_deep_extend('force', default_config, config))
    end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to
-- restart neovim
require('lspinstall').post_install_hook = function ()
    setup_servers() -- reload installed servers
    vim.cmd('bufdo e') -- this triggers the FileType autocmd that starts the server
end
