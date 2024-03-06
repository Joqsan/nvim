local leap = require('leap')

leap.create_default_mappings()

vim.keymap.set({'n', 'x', 'o'}, 'q', '<Plug>(leap-forward)')
vim.keymap.set({'n', 'x', 'o'}, 'Q', '<Plug>(leap-backward)')