local lsp_installer = require("nvim-lsp-installer")
local lsp_installer_servers = require("nvim-lsp-installer.servers")

local lsp_signature = require("lsp_signature");
local lsp_status = require("lsp-status");

lsp_status.config({
    indicator_errors = '  ',
    indicator_warning = '  ',
    indicator_info = '  ',
    indicator_hint = '  ',
    status_symbol = '',
    current_function = false,
})

lsp_status.register_progress();

local on_attach = function(client, bufnr)
    lsp_status.on_attach(client, bufnr)
    lsp_signature.on_attach({
        bind = true,
        handler_opts = {
            border = 'single',
        },
    }, bufnr)
end

local ensure_installed = function(requested_servers)
    -- go through requested_servers and ensure installation
    for _, requested_server in pairs(requested_servers) do
        local ok, server = lsp_installer_servers.get_server(requested_server)
        if ok then
            if not server:is_installed() then
                server:install()
            end
        end
    end

    lsp_installer.on_server_ready(function(server)
        local opts = {
            on_attach = on_attach,
            capabilities = lsp_status.capabilities,
        }

        -- disable server if config disabled server list says so
        opts.autostart = true

        -- set up default cosmic options
        if server.name == 'gopls' then
            opts = vim.tbl_deep_extend('force', opts, require("lsp.providers.gopls"))
        elseif server.name == 'sumneko_lua' then
            opts = vim.tbl_deep_extend('force', opts, require("lsp.providers.lua"))
        end

        -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
        server:setup(opts)
        vim.cmd([[ do User LspAttachBuffers ]])
    end)
end

return {
    ensure_installed = ensure_installed,
}
