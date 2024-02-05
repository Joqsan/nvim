-- lsp-zero first adds data to an option called capabilities in lspconfig's defaults. 
-- This new data comes from cmp-nvim-lsp. It tells the language server what features nvim-cmp adds to the editor.
local lsp_zero = require('lsp-zero')

-- keymap happening only on open buffer with an LSP associated
-- with it. I. e. the mappings exist for the current buffer only.
lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}
  
  -- go to definition
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)

  -- for stuff like hovering on argument
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
  
  -- Open line diagnostic in floating window
  vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)

  -- see where the variable under the cursor is being used
  vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)

  -- renaming across files works, if my lsp supports it
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)

  -- like hovering, but for completion
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

  -- for stuff like automatic sorting  of imports
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)

  vim.keymap.set("n", "<leader>td", ":Telescope diagnostics<CR>", opts)

  vim.keymap.set('n', '<space>bf', function() vim.lsp.buf.format { async = true } end, bufopts)
end)

-- If more than one diagnostic for a line, show the most severe own
-- in virtual text
-- vim.diagnostic.config({
--   severity_sort = true,
-- })

-- Make sure to set up `mason` and `mason-lspconfig.nvim` before 
-- setting up servers via `lspconfig`.
require("mason").setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    "lua_ls",
    "pyright",
    "ruff_lsp"
  },
  handlers = {
    -- The first entry (without a key) will be the default handler -- and will be called
    -- for each installed server that doesn't have a dedicated handler.
    lsp_zero.default_setup, 
    -- A dedicated handler for specific servers. 
    lua_ls = function()  -- Setting up Lua for neovim (https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/neovim-lua-ls.md#fixed-config)
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
    ruff_lsp = function()
      require("lspconfig").ruff_lsp.setup{
        on_attach = function(client, bufnr)
          -- Disable hover in favor of Pyright
          client.server_capabilities.hoverProvider = false
        end,
        handlers = {
          ['textDocument/publishDiagnostics'] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {
              virtual_text = false,
            }
          ),
        }
      }
    end,
    pyright = function()
      require("lspconfig").pyright.setup{
        settings = {  -- https://github.com/microsoft/pyright/blob/main/docs/settings.md
          pyright = {
            disableOrganizeImports = true,
          },
          python = {
            analysis = {
              exclude = {".venv"},
              typeCheckingMode = "basic",  -- this is slow
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = 'openFilesOnly',
            }
          }
        },
        handlers = {
          ['textDocument/publishDiagnostics'] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {
              severity_sort = true,
            }
          ),
        }
      }
    end,
  }
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  -- Custom mappings.
  -- -- It's important to use nvim-cmp's preset so you don't lose the default keybindings.
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
  -- snippet: how nvim-cmp interacts with a particular snippet engine.
  snippet = {
    expand = function(args)
      -- pick the snippet plugin you have
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  -- The purpose of a source is to extract data and then pass it to nvim-cmp.
  -- The order of the sources determines their order in the completion results.
  sources = {
    {name = 'nvim_lua'},
    {name = 'nvim_lsp'},
    {name = 'path'},
    {name = 'luasnip'},
    {name = 'buffer', keyword_length = 5},
  },
  formatting = lsp_zero.cmp_format(),
  
})