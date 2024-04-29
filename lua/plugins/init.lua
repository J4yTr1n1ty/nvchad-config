return {
  {
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
    end,
  },
  -- {
  --   'goolord/alpha-nvim',
  --   config = function ()
  --       require'alpha'.setup(require'alpha.themes.dashboard'.config)
  --   end,
  --   event = 'VimEnter'
  -- },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  { 'wakatime/vim-wakatime', lazy = false },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require "configs.dashboard"
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },
  {
    "OmniSharp/omnisharp-vim",
    lazy = false
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "mfussenegger/nvim-dap",
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function (_, opts)
      require("dap-go").setup(opts)
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio"
    },
    event = "VeryLazy",
    config = function ()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function ()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function ()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function ()
        dapui.close()
      end
    end
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap"
    },
    opts = {
      handlers = {},
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  {
    "williamboman/mason.nvim",
    opts = {
        ensure_installed = {
          -- 'omnisharp',
          'clangd',
          'clang-format',
          'codelldb',
          'gopls',
          'rust-analyzer',
          'angular-language-server',
          'pyright',
          'asm-lsp',
          'autotools-language-server',
          'marksman',
        }
    }
  },
  { 'rust-lang/rust.vim', event = "VeryLazy" },
  {
      'mrcjkb/rustaceanvim',
      version = '^3',
      event = "VeryLazy",
      ft = { 'rust' },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function ()
      return require("configs.null-ls")
    end
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
    event = 'VeryLazy'
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
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function (_, opts)
      require("gopher").setup(opts)
    end,
    build = function ()
      vim.cmd [[silent! GoInstallDeps]]
    end
  }
}
