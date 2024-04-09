require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fm", function()
  require("conform").format()
end, { desc = "File Format with conform" })

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

-- LSP Config
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function (event)
    local mapLsp = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc})
    end

    -- Jump to the definition of the word under the cursor.
    mapLsp('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

    mapLsp('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

    mapLsp('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementations')

    mapLsp('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinitions')

    mapLsp('<leader>lh', vim.lsp.buf.hover, '[H]over')

    mapLsp('<leader>lr', vim.lsp.buf.rename, '[R]ename')

    mapLsp('<leader>lF', vim.lsp.buf.format, '[F]ormat')
  end
})

-- Debugger
vim.keymap.set('n', '<leader>db', "<cmd> DapToggleBreakpoint <CR>", { desc = '[D]ebugger: Toggle [B]reakpoint'})
vim.keymap.set('n', '<leader>dc', "<cmd> DapContinue <CR>", { desc = '[D]ebugger: Start or [C]ontinue'})
