require("gitsigns").setup({
  signs = {
    add = { text = "+", guibg = "NONE" },
    change = { text = "~", guibg = "NONE" },
    delete = { text = "_", guibg = "NONE" },
    topdelete = { text = "‾", guibg = "NONE" },
    changedelete = { text = "~", guibg = "NONE" }
  }
})

vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
vim.keymap.set("n", "<leader>gl", ":Gitsigns toggle_current_line_blame<CR>", {})
