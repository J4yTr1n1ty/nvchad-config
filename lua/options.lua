require "nvchad.options"

local notify = require("notify")
notify.setup({
  stages = "static",
  timeout = 3000,
  max_height = function()
    return math.floor(vim.o.lines * 0.75)
  end,
  max_width = function()
    return math.floor(vim.o.columns * 0.75)
  end,
  on_open = function(win)
    vim.api.nvim_win_set_config(win, { zindex = 100 })
  end,})
vim.notify = notify

-- NvimTree on the right
require("configs.nvim-tree")

-- Lsp Configuration
require("configs.lsp")

-- Dap
require("configs.dap")

-- Snippets
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/snippets/"})

-- Filetypes --
vim.filetype.add({
  pattern = {
    ['.*%.blade%.php'] = 'blade',
  },
})

-- mason tool installer notifications
vim.api.nvim_create_autocmd('User', {
  pattern = 'MasonToolsStartingInstall',
  callback = function()
    vim.schedule(function()
      require('notify')('Mason Tools starting install', 'info', { title = 'Mason' })
    end)
  end,
})

vim.api.nvim_create_autocmd('User', {
  pattern = 'MasonToolsUpdateCompleted',
  callback = function()
    vim.schedule(function()
      require('notify')('Mason tools update complete', 'info', { title = 'Mason' })
    end)
  end,
})
