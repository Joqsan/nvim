local dap_python = require("dap-python")
local dap = require("dap")

local adapter_python_path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
dap_python.setup(adapter_python_path)

-- Hard-coded for now.
-- TODO:Try venv-selector
dap_python.resolve_python = function()
    return '/usr/bin/python3.11'
end

-- Somehow this line doesn't get set:
-- https://github.com/mfussenegger/nvim-dap-python/blob/master/lua/dap-python.lua#L211
dap.adapters.debugpy = dap.adapters.python

require('dap.ext.vscode').load_launchjs()