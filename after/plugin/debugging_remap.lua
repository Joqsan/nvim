vim.keymap.set("n", "<leader>db", "<CMD>lua require('dap').toggle_breakpoint()<CR>", {desc = "[Debug]: toggle breakpoint"})
vim.keymap.set("n", "<F1>", "<CMD>lua require('dap').continue()<CR>", {desc = "[Debug]: continue"})
vim.keymap.set("n", "<F2>", "<CMD>lua require('dap').step_over()<CR>", {desc = "[Debug]: step over"})
vim.keymap.set("n", "<F3>", "<CMD>lua require('dap').step_into()<CR>", {desc = "[Debug]: step into"})
vim.keymap.set("n", "<F4>", "<CMD>lua require('dap').step_out()<CR>", {desc = "[Debug]: step out"})
vim.keymap.set("n", "<F5>", "<CMD>lua require('dap').disconnect()<CR>", {desc = "[Debug]: disconnect"})
vim.keymap.set("n", "<F6>", "<CMD>lua require('dap').close()<CR>", {desc = "[Debug]: close"})
vim.keymap.set(
    "n", 
    "<leader>dB",
    function()
        require("dap").set_breakpoint(vim.fn.input "[DAP] Condition > ") 
    end,
    {desc = "[Debug]: set conditional breakpoint"}
)
vim.keymap.set("n", "<leader><F7>", "<CMD>require('dap').repl.open()<CR>", {desc = "[Debug]: open debug REPL"})
