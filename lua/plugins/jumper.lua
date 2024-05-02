return {
    "homerours/jumper.nvim",
    dependencies = { 
        'nvim-telescope/telescope.nvim', -- for Telescope backend
        'ibhagwan/fzf-lua'  -- alternatively, for fzf-lua backend
    }, 
    config = function()
        -- If using Telescope as backend:
        local jumper = require("telescope").extensions.jumper
        -- or, if using fzf-lua as backend:
        local jumper = require("jumper.fzf-lua")

        -- Configure bindings to launch the pickers:
        vim.keymap.set('n', '<c-d>', jumper.jump_to_directory)
        vim.keymap.set('n', '<c-f>', jumper.jump_to_file)
        vim.keymap.set('n', '<leader>fu', jumper.find_in_files)
    end
}