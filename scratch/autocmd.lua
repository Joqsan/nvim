local group = vim.api.nvim_create_augroup("Hello", {clear = true})
--vim.api.nvim_create_autocmd("BufEnter", { command = "echo 'Hello 1'", group=group})
--vim.api.nvim_create_autocmd("BufEnter", { callback = function()
--    print "hello, we are in autocmd now"
--end, group=group,})

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "text",
    callback = function(ev)
        local data = {
            buf = vim.fn.expand("<abuf>"),
            file = vim.fn.expand("<afile>"),
            match = vim.fn.expand("<amatch>"),
        }
        print(vim.inspect(data))
    end,
    group = group
})
