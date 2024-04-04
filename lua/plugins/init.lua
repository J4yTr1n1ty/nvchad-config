return {
  {
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
    end,
  },
  {
    "OmniSharp/omnisharp-vim",
    lazy = false
  },
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = { enable = true },
    },
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
    lazy = false
  },
  {
    "ThePrimeagen/vim-be-good",
    lazy = false
  },
  {
    "jiriks74/presence.nvim",
    event = "UIEnter",
    config = function()
      require "configs.presence"
    end
  },
  {
    "rcarriga/nvim-notify",
    lazy = false
  },
  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    config = function ()
      require("configs.gitsigns")
    end
  },
  {
    "tpope/vim-fugitive",
    lazy = false
  }
}
