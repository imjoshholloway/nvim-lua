local path = require 'nvim-lsp-installer.core.path'
local install_root_dir = path.concat {vim.fn.stdpath 'data', 'lsp_servers'}

require('go').setup({
  gopls_cmd = {install_root_dir .. '/go/gopls'},
  gofmt = 'gopls',
  goimports = 'gopls',
  fillstruct = 'gopls',
  dap_debug = true,
  dap_debug_gui = true
})

--vim.api.nvim_command("autocmd BufWritePre *.go lua Goimports(1000)")
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)
vim.api.nvim_exec([[ autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000) ]], false)

return {
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
    capabilties = {
        textDocument = {
            completion = {
                completionItem = {
                    snippetSupport = true
                }
            }
        }
    },
    init_options = {
        usePlaceholders    = true,
        completeUnimported = true,
    },
}
