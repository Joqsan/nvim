vim.api.nvim_set_keymap('n', '<F8>', [[:lua require"osv".launch({port = 8086})<CR>]], { noremap = true })