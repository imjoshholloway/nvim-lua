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

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
        signs = false,
        update_in_insert = true,
    }
)

local default_config = {
    -- enable snippet support
    capabilities = lsp_status.capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = function(client, bufnr)
        lsp_status.on_attach(client, bufnr)
        require("lsp_signature").on_attach()
    end,
}

-- table containing the lsp config overrides wee can set for each language server
local lsp_server_config = {
    ['lua'] = require("lsp/lua"),
    ['gopls'] = require("lsp/go"),
}

-- Install missing servers
local required_servers  = { "lua", "rust", "go" }
local installed_servers = require("lspinstall").installed_servers()

for _, server in pairs(required_servers) do
    if not vim.tbl_contains(installed_servers, server) then
        require("lspinstall").install_server(server)
    end
end

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
