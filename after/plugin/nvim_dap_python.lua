local dap_python = require("dap-python")

adapter_python_path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
dap_python.setup(adapter_python_path)