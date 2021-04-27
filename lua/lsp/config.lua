-- Install missing servers
local required_servers = {'lua','rust','go','bash'}
local installed_servers = require('lspinstall').installed_servers()
for _, server in pairs(required_servers) do
  if not vim.tbl_contains(installed_servers, server) then
    require('lspinstall').install_server(server)
  end
end

local lsp_status = require('lsp-status')
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
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)

-- Configure lua language server for neovim development
local lua_settings = {
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
  }
}

-- config that activates keymaps and enables snippet support
local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      'documentation',
      'detail',
      'additionalTextEdits',
    }
  }
  return {
    -- enable snippet support
    capabilities = lsp_status.capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = lsp_status.on_attach,
  }
end

-- lsp-install
local function setup_servers()
  require('lspinstall').setup()

  -- get all installed servers
  local servers = require('lspinstall').installed_servers()
  -- ... and add manually installed servers

  for _, server in pairs(servers) do
    local config = make_config()

    -- language specific config
    if server == 'lua' then
      config.settings = lua_settings
    end

    require('lspconfig')[server].setup(config)
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require('lspinstall').post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd('bufdo e') -- this triggers the FileType autocmd that starts the server
end
