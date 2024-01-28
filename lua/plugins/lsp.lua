return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
        -- LSP Support
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},
        {'neovim/nvim-lspconfig'},
        

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},  -- core autocompletion engine

        -- -- cmp-nvim-lsp: lsp-powered autocompletion. For example,
        -- -- auto-import on complete, moving between snippets
        {'hrsh7th/cmp-nvim-lsp'}, 
        -- -- cmp-buffer: completes words from the current byffer you're in.
        -- -- Allow nvim-cmp to show completions even when we don't have a 
        -- -- language server active in the current buffer.
        {'hrsh7th/cmp-buffer'},

        -- -- cmp-path: it helps complete files, so it will detect when it looks
        -- -- like you're typing a file.
        {'hrsh7th/cmp-path'},

        -- -- cmp-nvim-lua: for writing Lua in Neovim. like getting completion for
        -- -- Neovim API functions
        {'hrsh7th/cmp-nvim-lua'},

        -- Snippets
        {'L3MON4D3/LuaSnip'},
        -- -- cmp_luasnip: to be used with LuaSnip. Load custom snippets into the
        -- -- completion menu 
        {'saadparwaiz1/cmp_luasnip'},
        
        
        -- -- friendly-snippets: so that we don't write our own snippets.
        {'rafamadriz/friendly-snippets'},
    }
}