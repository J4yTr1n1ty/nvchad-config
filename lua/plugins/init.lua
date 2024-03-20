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
    "github/copilot.vim",
    lazy = false,
  },
  {
    "ThePrimeagen/vim-be-good",
    lazy = false
  }
}
