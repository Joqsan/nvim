local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>tf', builtin.find_files, {})
vim.keymap.set('n', '<leader>tg', builtin.git_files, {})
vim.keymap.set('n', '<leader>ts', builtin.git_status, {})
vim.keymap.set('n', '<leader>tb', builtin.current_buffer_fuzzy_find, {})
-- lr: show all the places in the project where the word under the cursor is referenced
vim.keymap.set('n', '<leader>tr', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)  -- ps: project search 

vim.keymap.set('n', '<leader>tl', builtin.lsp_references, {})
vim.keymap.set("n", "<leader>td", builtin.diagnostics, opts)
vim.keymap.set('n', '<leader>th', builtin.help_tags, {})
vim.keymap.set('n', '<leader>to', builtin.lsp_outgoing_calls, {})
vim.keymap.set('n', '<leader>ti', builtin.lsp_incoming_calls, {})