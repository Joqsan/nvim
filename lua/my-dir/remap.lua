vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>')

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {desc = "Go to Netrw"})

-- select lines and move them up and down, preserving indenting
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc = "Move selected lines down, preserving indenting"})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {desc = "Move selected lines up, preserving indenting"})

-- Join lines preserving the current cursor position
vim.keymap.set("n", "J", "mzJ`z", {desc = "Join lines preserving the current cursor position"})

-- Go down and up, keeping the cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Search up and down, keeping the cursor in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
-- Copy and paste on top of a word. The deleted word is sent to the void buffer.
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
-- Use <leader>y to copy text to your system clipboard (y register)
-- Use y to copy only inside vim (as usual)
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- turn off because of overlapping
-- vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")

-- allow to switch projects
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- quickfix (see 30. Editing programs)
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Replace everywhere the word I am on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make the current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- git diff
vim.keymap.set("n", "<leader>[", "<cmd>diffg LO<CR>", { silent = true })
vim.keymap.set("n", "<leader>]", "<cmd>diffg RE<CR>", { silent = true })
vim.keymap.set("n", "<leader>od", function()
    if vim.opt.diff:get() then
        vim.cmd("diffoff")
    else
        vim.cmd("diffthis")
    end
end)

-- Easier Moving between splits
vim.keymap.set("n", "<C-J>", "<C-W><C-J>", { noremap = true})
vim.keymap.set("n", "<C-K>", "<C-W><C-K>", { noremap = true })
vim.keymap.set("n", "<C-L>", "<C-W><C-L>", { noremap = true })
vim.keymap.set("n", "<C-H>", "<C-W><C-H>", { noremap = true })

-- Make windows to be basically the same size
vim.keymap.set("n", "<leader>=", "<C-W>=", { noremap = true })

-- Sizing window horizontally
-- to the right
vim.keymap.set("n", "<C-.>", "<C-W>5<", { noremap = true })
-- to the left
vim.keymap.set("n", "<C-,>", "<C-W>5>", { noremap = true })

-- Sizing window vertically
-- taller
vim.keymap.set("n", "<A-.>", "<C-W>5+", { noremap = true })
-- shorter
vim.keymap.set("n", "<A-,>", "<C-W>5-", { noremap = true })