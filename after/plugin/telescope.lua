local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>tf', builtin.find_files, {desc = "[Telescope]: list files in your cwd"})
vim.keymap.set('n', '<leader>tg', builtin.git_files, {desc = "[Telescope]: fuzzy search output of git ls-files"})
vim.keymap.set('n', '<leader>ts', builtin.git_status, {desc = "[Telescope]: show current git status and diff preview"})
vim.keymap.set('n', '<leader>tb', builtin.current_buffer_fuzzy_find, {desc = "[Telescope]: fuzzy search inside open buffer"})
-- lr: show all the places in the project where the word under the cursor is referenced
vim.keymap.set(
	'n',
	'<leader>tr',
	function()
		builtin.grep_string({ search = vim.fn.input("Grep > ") });
	end,
	{desc = "[Telescope]: search string in cwd"}
)  -- ps: project search 

vim.keymap.set('n', '<leader>tl', builtin.lsp_references, {desc = "[Telescope]: list LSP references for word under the cursor"})
vim.keymap.set("n", "<leader>td", function() builtin.diagnostics {bufnr = 0} end, {desc = "[Telescope]: list diagnostics for current buffer"})
vim.keymap.set('n', '<leader>th', builtin.help_tags, {desc = "[Telescope]: list available help tags. Ope with <CR>"})
vim.keymap.set('n', '<leader>to', builtin.lsp_outgoing_calls, {desc = "[Telescope]: list LSP outgoing calls for word under the cursor"})
vim.keymap.set('n', '<leader>ti', builtin.lsp_incoming_calls, {desc = "[Telescope]: list LSP incoming calls for word under the cursor"})