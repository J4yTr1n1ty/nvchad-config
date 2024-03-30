return {
  {
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
    end,
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
}
