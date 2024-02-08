local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.git_status, {})
vim.keymap.set('n', '<leader>bf', builtin.current_buffer_fuzzy_find, {})
-- lr: show all the places in the project where the word under the cursor is referenced
vim.keymap.set('n', '<leader>lr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>gs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)  -- ps: project search 

vim.keymap.set("n", "<leader>td", builtin.diagnostics, opts)

vim.keymap.set('n', '<leader>th', builtin.help_tags, {})