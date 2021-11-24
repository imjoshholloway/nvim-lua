-- load plugins
require("plugins")

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
