-- load plugins
require("plugins")

-- configure 3rd party plugins
require("trouble").setup({
    mode = "lsp_document_diagnostics",
    auto_open = true,
    auto_close = true,
    use_lsp_diagnostic_signs = true,
})

require("nvim-treesitter.configs").setup({
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  }
})

require("telescope").setup()
require("gitsigns").setup()

-- local configs
require("general")
require("statusline")
require("autocomplete")
require("lsp")


require("keybindings")
