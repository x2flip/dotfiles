vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap
vim.keymap.set("n", "<leader>tf", vim.cmd.NvimTreeFocus)
vim.keymap.set("n", "<leader>tt", vim.cmd.NvimTreeToggle)
--vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
map('n', '<leader>`', ':bel split | term', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
