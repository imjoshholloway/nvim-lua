-- Install missing servers
local required_servers = {"lua","rust","go","bash"}
local installed_servers = require('lspinstall').installed_servers()
for _, server in pairs(required_servers) do
  if not vim.tbl_contains(installed_servers, server) then
    require('lspinstall').install_server(server)
  end
end

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)

require("lspkind").init(
    {
        with_text = true,
        symbol_map = {
            Folder = ""
        }
    }
)

require("lsp.config")
