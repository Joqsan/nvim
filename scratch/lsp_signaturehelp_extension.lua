
local function my_func(x, y, z)
    print(x+y+z)
end

my_func(3, 4, 5)

vim.api.nvim_create_augroup()

function GlobalFunction()
    local position_params = vim.lsp.util.make_position_params()
    
    vim.lsp.buf_request(0, 'textDocument/signatureHelp', position_params, function(err, result, ctx, config)
        print(err, result, ctx, config)
        print("print result", vim.inspect(result))
        print("print ctx", vim.inspect(ctx))
    end)
end
