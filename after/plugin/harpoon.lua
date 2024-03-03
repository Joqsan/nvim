local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<C-a>", function() harpoon:list():append() end, {desc = "[Harpoon]: add current buffer"})
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc = "[Harpoon]: toggle menu"})

vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end, {desc = "[Harpoon]: go to buffer in 1"})
vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end, {desc = "[Harpoon]: go to buffer in 2"})
vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end, {desc = "[Harpoon]: go to buffer in 3"})
vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end, {desc = "[Harpoon]: go to buffer in 4"})

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, {desc = "[Harpoon]: go to next buffer"})
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, {desc = "[Harpoon]: go to prev buffer"})