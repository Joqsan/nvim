vim.opt.guicursor = ""  -- fat cursor in Insert mode

-- Ignore compiled files
vim.opt.wildignore = "__pycache__"
vim.opt.wildignore:append { "*.o", "*~", "*.pyc", "*pycache*" }

vim.opt.showcmd = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.breakindent = true
vim.opt.showbreak = string.rep(" ", 3) -- Make it so that long lines wrap smartly
vim.opt.linebreak = true

vim.opt.belloff = "all" -- Just turn the dang bell off

vim.opt.smartindent = true

vim.opt.wrap = false  -- no line wrap

-- tell vim to not do any backups, except for undotree history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

vim.opt.inccommand = "split"
vim.opt.mouse = "a"

vim.opt.formatoptions = vim.opt.formatoptions
  - "a" -- Auto formatting is BAD.
  - "t" -- Don't auto format my code. I got linters for that.
  + "c" -- In general, I like it when comments respect textwidth
  + "q" -- Allow formatting comments w/ gq
  - "o" -- O and o, don't continue comments
  + "r" -- But do continue when pressing enter.
  + "n" -- Indent past the formatlistpat, not underneath it.
  + "j" -- Auto-remove comments if possible.
  - "2" -- I'm not in gradeschool anymore

  vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true -- Ignore case when searching...
vim.opt.smartcase = true -- ... unless there is a capital letter in the query

vim.opt.splitright = true -- Prefer windows splitting to the right
vim.opt.splitbelow = true -- Prefer windows splitting to the bottom

-- Cursorline highlighting control
--  Only have it on in the active buffer
vim.opt.cursorline = true -- Highlight the current line
local group = vim.api.nvim_create_augroup("CursorLineControl", { clear = true })
local set_cursorline = function(event, value, pattern)
  vim.api.nvim_create_autocmd(event, {
    group = group,
    pattern = pattern,
    callback = function()
      vim.opt_local.cursorline = value
    end,
  })
end
set_cursorline("WinLeave", false)
set_cursorline("WinEnter", true)
set_cursorline("FileType", false, "TelescopePrompt")

vim.opt.autoindent = true
vim.opt.wrap = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"

-- The characters specified by this option are included in file names and path names.
-- To include '@' itself use "@-@"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "120"

vim.opt.winbar = "%=%m %f"
vim.opt.laststatus = 3

vim.opt.joinspaces = false
vim.opt.signcolumn = "yes"
