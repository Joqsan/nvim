vim.keymap.set("n", "<leader>b", "<CMD>lua require('dap').toggle_breakpoint()<CR>")
vim.keymap.set("n", "<F1>", "<CMD>lua require('dap').continue()<CR>")
vim.keymap.set("n", "<F2>", "<CMD>lua require('dap').step_over()<CR>")
vim.keymap.set("n", "<F3>", "<CMD>lua require('dap').step_into()<CR>")
vim.keymap.set("n", "<F4>", "<CMD>lua require('dap').step_out()<CR>")
vim.keymap.set("n", "<F5>", "<CMD>lua require('dap').disconnect()<CR>")
vim.keymap.set("n", "<F6>", "<CMD>lua require('dap').close()<CR>")
vim.keymap.set(
    "n", 
    "<leader>dB", 
    function()
        require("dap").set_breakpoint(vim.fn.input "[DAP] Condition > ") 
    end
)
vim.keymap.set("n", "<leader>dr", "<CMD>require('dap').repl.open()<CR>")
