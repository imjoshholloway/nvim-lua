local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'
vim.cmd [[packadd packer.nvim]]

-- using { } when using a different branch of the plugin or loading the plugin with certain commands
return require("packer").startup(function(use)
  use {"wbthomason/packer.nvim", opt = true}

  -- visuals
  use "kyazdani42/nvim-web-devicons"
  use "folke/tokyonight.nvim"

  -- lsp
  use "neovim/nvim-lspconfig"
  use "kabouzeid/nvim-lspinstall"
  use "hrsh7th/nvim-compe"
  use "onsails/lspkind-nvim"
  use "nvim-lua/lsp-status.nvim"

  -- language specific tools
  use "fatih/vim-go"
  use "rust-lang/rust.vim"
  use "mfussenegger/nvim-dap"

  use "ntpeters/vim-better-whitespace"
  use {"lukas-reineke/indent-blankline.nvim", branch = "lua"}
  use "terrortylor/nvim-comment"
  use "folke/which-key.nvim"

  -- fuzzy finder
  use {
    "nvim-telescope/telescope.nvim",
    requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
  }

  use {
    "nvim-telescope/telescope-dap.nvim",
    requires = {{"nvim-telescope/telescope.nvim"}, {"mfussenegger/nvim-dap"}}
  }

  use {
    "lewis6991/gitsigns.nvim",
    requires = "nvim-lua/plenary.nvim",
  }

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
  }

  -- nice scrolling
  use "karb94/neoscroll.nvim"

  -- pretty quickfix styles
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }

  use {
    "glepnir/galaxyline.nvim",
    branch = 'main',
    -- some optional icons
    requires = {"kyazdani42/nvim-web-devicons"}
  }

end)
