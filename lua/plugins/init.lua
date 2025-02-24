return {
  {
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
    end,
  },
  {
    'alexghergh/nvim-tmux-navigation',
    config = require('configs.nvim-tmux-navigation'),
    event = 'VeryLazy'
  },
  {
    '3rd/image.nvim',
    event = 'VeryLazy',
    config = function()
      require("image").setup()
    end
  },
  {
    'mistweaverco/kulala.nvim',
    opts = {}
  },
  {
    "mfussenegger/nvim-ansible",
    event = "VeryLazy",
  },
  {
    "vuki656/package-info.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    event = "VeryLazy",
    config = function()
      require("package-info").setup()
    end
  },
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup()
    end
  },
  {
      "kawre/leetcode.nvim",
      build = ":TSUpdate html",
      event = "VeryLazy",
      dependencies = {
          "nvim-telescope/telescope.nvim",
          "nvim-lua/plenary.nvim", -- required by telescope
          "MunifTanjim/nui.nvim",

          -- optional
          "nvim-treesitter/nvim-treesitter",
          "rcarriga/nvim-notify",
          "nvim-tree/nvim-web-devicons",
      },
      opts = {
          -- configuration goes here
      },
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },
  {
    'mg979/vim-visual-multi',
    event = 'VeryLazy',
  },
  {
    'vyfor/cord.nvim',
    build = ':Cord fetch',
    event = 'VeryLazy',
    config = function()
      require "configs.cord"
    end
  },
  {
      "tris203/precognition.nvim",
      event = "VeryLazy",
      opts = {
        startVisible = false
      }
  },
  -- {
  --    "m4xshen/hardtime.nvim",
  --    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  --    event = "VeryLazy",
  --    opts = {},
  --    config = function()
  --      require("hardtime").setup()
  --    end
  -- },
  { "xiyaowong/transparent.nvim", lazy = false },
  {
    'saecki/crates.nvim',
    event = { "BufRead Cargo.toml" },
    config = function()
      require('crates').setup()
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  {
      "OXY2DEV/markview.nvim",
      ft = "markdown",

      dependencies = {
          -- You may not need this if you don't lazy load
          -- Or if the parsers are in your $RUNTIMEPATH
          "nvim-treesitter/nvim-treesitter",

          "nvim-tree/nvim-web-devicons"
      },
  },
  {
      "OXY2DEV/helpview.nvim",
      lazy = false,

      dependencies = {
          "nvim-treesitter/nvim-treesitter"
      }
  },
  {
    'wakatime/vim-wakatime',
    lazy = false
  },
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter'
  },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require "configs.dashboard"
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  },
  {
    "OmniSharp/omnisharp-vim",
    ft = { "csharp" }
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
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
    config = function(_, opts)
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
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
			'williamboman/mason.nvim',
			opts = {
				registries = {
					'github:nvim-java/mason-registry',
					'github:mason-org/mason-registry',
				},
			},
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
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    event = "VeryLazy",
    config = function ()
      require('mason-tool-installer').setup(require("configs.mason"))
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      require("configs.treesitter")
    },
    config = function(_, opts)
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

      parser_config.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "blade",
      }

      vim.filetype.add({
        pattern = {
          [".*%.blade%.php"] = "blade",
        },
      })

      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  {
    "nvim-java/nvim-java",
    event = "VeryLazy",
    config = function()
      require("java").setup()
    end
  },
  {
    'rust-lang/rust.vim',
    event = "VeryLazy"
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^3',
    event = "VeryLazy",
    ft = { 'rust' },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
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
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig"
    },
    opts = {},
    event = 'VeryLazy'
  },
  {
    "ThePrimeagen/vim-be-good",
    lazy = false
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = function()
      require("configs.noice")
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },
  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    config = function()
      require("configs.gitsigns")
    end
  },
  {
    "tpope/vim-fugitive",
    lazy = false
  },
  {
    "tpope/vim-obsession",
    lazy = false
  }
}
