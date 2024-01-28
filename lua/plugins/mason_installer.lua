-- mason doesn't have a built-in ensure_installed parameter.
-- Use mason-tool-installer to install lsp servers/dap automatically.
return {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { 'williamboman/mason.nvim' },
}