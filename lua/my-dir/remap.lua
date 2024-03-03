local map = function(mode, lhs, rhs, desc, opts)
    opts = opts or {}
    if desc then
        desc = "[Remap]: " .. desc
        opts = vim.tbl_extend("keep", opts, {["desc"] = desc})
    end

    vim.keymap.set(mode, lhs, rhs, opts)
end

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>')

map("n", "<leader>pv", vim.cmd.Ex, "go to Netrw")

map("v", "J", ":m '>+1<CR>gv=gv", "move selected lines down, preserving indenting")
map("v", "K", ":m '<-2<CR>gv=gv", "move selected lines up, preserving indenting")

map("n", "J", "mzJ`z", "join lines preserving the current cursor position")

map("n", "<C-d>", "<C-d>zz", "go down, keeping cursor in the middle")
map("n", "<C-u>", "<C-u>zz", "go up, keeping cursor in the middle")

map("n", "n", "nzzzv", "search down, keeping cursor in the middle")
map("n", "N", "Nzzzv", "search up, keeping cursor in the middle")

-- greatest remap ever
-- Copy and paste on top of a word. The deleted word is sent to the void buffer.
map("x", "<leader>p", [["_dP]], "paste on top of word. Delete word sent to void buffer")

-- next greatest remap ever : asbjornHaland
-- Use <leader>y to copy text to your system clipboard (y register)
-- Use y to copy only inside vim (as usual)
map({"n", "v"}, "<leader>y", [["+y]], "copy text to system clipboard (y register)")
map("n", "<leader>Y", [["+Y]], "copy text to system clipboard (Y register)")

-- turn off because of overlapping
-- vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])


-- quickfix (see 30. Editing programs)
map("n", "<C-k>", "<cmd>cnext<CR>zz", "display next error in quickfix")
map("n", "<C-j>", "<cmd>cprev<CR>zz", "display prev error in quickfix")
map("n", "<leader>k", "<cmd>lnext<CR>zz", "display next error in location list")
map("n", "<leader>j", "<cmd>lprev<CR>zz", "display prev error in location list")

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "replace everywhere the word under the cursor")


-- Make the current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- git diff
map("n", "<leader>]", "<cmd>diffg LO<CR>", "get changes from LOCAL", {silent = true})
map("n", "<leader>[", "<cmd>diffg RE<CR>", "get changes from REMOTE", {silent = true})
map(
    "n",
    "<leader>od",
    function()
        if vim.opt.diff:get() then
            vim.cmd("diffoff")
        else
            vim.cmd("diffthis")
        end
    end,
    "toggle diff mode"
)

-- Easier Moving between splits
map("n", "<C-J>", "<C-W><C-J>", "move to down window", { noremap = true})
map("n", "<C-K>", "<C-W><C-K>", "move to up window", { noremap = true })
map("n", "<C-L>", "<C-W><C-L>", "move to right window", { noremap = true })
map("n", "<C-H>", "<C-W><C-H>", "move to left window", { noremap = true })

-- Make windows to be basically the same size
map("n", "<leader>=", "<C-W>=", "uniformly resize window", { noremap = true })

-- Sizing window horizontally
-- to the right
map("n", "<C-.>", "<C-W>5<", "decrease current window width", { noremap = true })
-- to the left
map("n", "<C-,>", "<C-W>5>", "increase current window width", { noremap = true })

-- Sizing window vertically
-- taller
map("n", "<A-.>", "<C-W>5+", "increase current window height",{ noremap = true })
-- shorter
map("n", "<A-,>", "<C-W>5-", "decrease current window height",{ noremap = true })