local lsp_installer = require("nvim-lsp-installer")
local lsp_installer_servers = require("nvim-lsp-installer.servers")

require("lsp_signature").setup();

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

    local function map(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- lsp related keybuildings
    local opts = { noremap = true, silent = true };

    map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    map('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    map('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

    lsp_status.on_attach(client, bufnr)
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
            capabilities = vim.tbl_extend('keep', require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()), lsp_status.capabilities)
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
