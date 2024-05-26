local f = function()
    local uio = 55
    print(uio)
end

local x = 5
print(x)

local my_super_function = function(arg1, arg2, arg3)
    return arg1 + arg2 + arg3
end

local res = my_super_function()

function GlobalFunction()
    -- Create request object
    local position_params = vim.lsp.util.make_position_params()
    local new_name = vim.fn.input("New name here > ")

    position_params.newName = new_name
    --print(vim.inspect(position_params))

    vim.lsp.buf_request(0, 'textDocument/rename', position_params, function(err, result, ctx, config)
        local entries = {}
        if result.changes then
            for uri, edits in pairs(result.changes) do
                local bufnr = vim.uri_to_bufnr(uri)

                for _, edit in ipairs(edits) do
                    local start_line = edit.range.start.line + 1
                    local line = vim.api.nvim_buf_get_lines(bufnr, start_line - 1, start_line, false)[1]
                    table.insert(entries, {
                        bufnr = bufnr,
                        lnum = start_line + 1,
                        col = edit.range.start.character,
                        text = line,
                    })
                end
            end
        end

        vim.fn.setqflist(entries, "r")
        -- print("*******Entering callback********")
        -- print(err, result, ctx, config)
        -- print("vim inspect result: ", vim.inspect(result))
        -- print("vim inspect ctx: ", vim.inspect(ctx))
        -- print "calling rename..."
        -- vim.lsp.handlers["textDocument/rename"](err, result, ctx, config)
        -- print "... done with rename"
    end)
end
