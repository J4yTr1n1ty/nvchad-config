require "nvchad.options"

local notify = require("notify")
notify.setup({
  timeout = 3000,
  render = "minimal",
  stages = "slide",
  on_open = function(win)
    vim.api.nvim_win_set_config(win, { border = "single" })
  end,
})
vim.notify = notify

-- NvimTree on the right
require("configs.nvim-tree")

-- Lsp Configuration
require("configs.lsp")

-- Snippets
require("luasnip.loaders.from_vscode").lazy_load()


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
