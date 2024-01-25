local configs = require("nvim-treesitter.configs")

configs.setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python" },
    sync_install = false,
    highlight = { enable = true, additional_vim_regex_highlighting = false},
    indent = { enable = true },  
})