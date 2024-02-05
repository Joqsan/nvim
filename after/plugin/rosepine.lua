local rosepine = require('rose-pine')

rosepine.setup({
    styles = {
        bold = true,
        italic = false,
        transparency = false,
    },

    highlight_groups = {
        DiffAdd = { fg = "#11f0c3"},
        DiffDelete = { fg = "#f54287"},
        diffRemoved = { fg = "#f54287"},
        LspSignatureActiveParameter = {bg = "#6e6a86"},

    }
})

vim.cmd([[colorscheme rose-pine]])

-- disable semantic highlighting (it just sets them all to do nothing).
-- https://www.reddit.com/r/neovim/comments/12gvms4/this_is_why_your_higlights_look_different_in_90/
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
    vim.api.nvim_set_hl(0, group, {})
end