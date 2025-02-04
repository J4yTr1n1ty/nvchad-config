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

    mapLsp('<leader>lca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  end
})

-- Debugger
vim.keymap.set('n', '<leader>db', "<cmd> DapToggleBreakpoint <CR>", { desc = '[D]ebugger: Toggle [B]reakpoint'})
vim.keymap.set('n', '<leader>dc', "<cmd> DapContinue <CR>", { desc = '[D]ebugger: Start or [C]ontinue'})
vim.keymap.set('n', '<leader>dus', function ()
  -- local widgets = require('dap.ui.widgets')
  -- local sidebar = widgets.sidebar(widgets.scopes)
  -- sidebar.open();
  require("dapui").toggle();
end, { desc = '[D]ebugger: Open [U]I [S]idebar'})

local ls = require("luasnip")

vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

-- Cargo.nvim
local crates = require("crates")

vim.keymap.set("n", "<leader>ct", crates.toggle, { desc = '[C]rates: [T]oggle UI', silent = true })
vim.keymap.set("n", "<leader>cr", crates.reload, { desc = '[C]rates: [R]eload', silent = true })

vim.keymap.set("n", "<leader>cv", crates.show_versions_popup, { desc = '[C]rates: [V]ersions Popup', silent = true })
vim.keymap.set("n", "<leader>cf", crates.show_features_popup, { desc = '[C]rates: [F]eatures Popup', silent = true })
vim.keymap.set("n", "<leader>cd", crates.show_dependencies_popup, { desc = '[C]rates: [D]ependencies Popup', silent = true })

-- Kulala
vim.keymap.set("n", "<leader>kr", require('kulala').run, { desc = '[K]ulala: [R]un', silent = true })

-- Todo Comments
vim.keymap.set("n", "<leader>tt", require("todo-comments.search").setqflist, { desc = '[T]odo: [T]oggle', silent = true })
