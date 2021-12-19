-- load plugins
require("plugins")

require("onedark").setup({
  highlight_linenumber = true,
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

require('nvim_comment').setup()
require("nvim-tree").setup()

require("gitsigns").setup()
require("git-worktree")

require("telescope").setup()
require("telescope").load_extension("git_worktree")

-- local configs
require("general")
require("autocomplete")
require("lsp")
require("keybindings")
require("statusline")
