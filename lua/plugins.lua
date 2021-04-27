vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'
vim.cmd [[packadd packer.nvim]]

-- using { } when using a different branch of the plugin or loading the plugin with certain commands
return require("packer").startup(function(use)
  use {"wbthomason/packer.nvim", opt = true}

  -- visuals
  use "kyazdani42/nvim-web-devicons"
  use "folke/tokyonight.nvim"
  use {"lukas-reineke/indent-blankline.nvim", branch = "lua"}

  -- lsp
  use "neovim/nvim-lspconfig"
  use "kabouzeid/nvim-lspinstall"
  use "hrsh7th/nvim-compe"
  use "onsails/lspkind-nvim"
  use "nvim-lua/lsp-status.nvim"

  --use "hrsh7th/vim-vsnip"
  --use "windwp/nvim-autopairs"
  -- nice scrolling
  use "karb94/neoscroll.nvim"

  use {
    "folke/lsp-trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  use {
    "glepnir/galaxyline.nvim",
    branch = 'main',
    -- some optional icons
    requires = {"kyazdani42/nvim-web-devicons"}
  }

end)
