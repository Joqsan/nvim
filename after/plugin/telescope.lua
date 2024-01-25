local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})  -- pf: project files
vim.keymap.set('n', '<leader>pg', builtin.git_files, {})  -- pg: project git
vim.keymap.set('n', '<leader>gs', builtin.git_status, {})  -- pg: project git
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)  -- ps: project search 
