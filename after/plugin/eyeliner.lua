require("eyeliner").setup{
    highlight_on_key = true
}

vim.api.nvim_set_hl(0, 'EyelinerPrimary', { fg='#55ffcc', bold = true, underline = false })
vim.api.nvim_set_hl(0, 'EyelinerSecondary', { fg='#ff005a', underline = false })