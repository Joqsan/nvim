-- lsp-zero first adds data to an option called capabilities in lspconfig's defaults. 
-- This new data comes from cmp-nvim-lsp. It tells the language server what features nvim-cmp adds to the editor.
local lsp_zero = require('lsp-zero')

-- keymap happening only on open buffer with an LSP associated
-- with it. I. e. the mappings exist for the current buffer only.
lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  local map = function(mode, lhs, rhs, desc)
    if desc then
      desc = "[LSP]: " .. desc
    end

    vim.keymap.set(mode, lhs, rhs, {buffer = bufnr, remap = false, desc = desc})
  end
  
  -- go to definition
  map("n", "gd", vim.lsp.buf.definition, "go to definition")
  --vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)

  -- for stuff like hovering on argument
  map("n", "K", vim.lsp.buf.hover, "hover function signature")
  -- vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  map("n", "<leader>ws", vim.lsp.buf.workspace_symbol, "query search workspace symbols")
  -- vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
  
  -- Open line diagnostic in floating window
  map("n", "<leader>fd", vim.diagnostic.open_float, "open diagnostics in floating window")
  -- vim.keymap.set("n", "<leader>fd", function() vim.diagnostic.open_float() end, opts)
  map("n", "]d", vim.diagnostic.goto_next, "go to next diagnostic")
  -- vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  
  map("n", "[d", vim.diagnostic.goto_prev, "go to prev diagnostic")
  -- vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)

  -- Open quickfix with places the variable under the cursor is being used
  map("n", "<leader>rr", vim.lsp.buf.references, "references for word under the cursor")
  vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)

  -- renaming across files works, if my lsp supports it
  map("n", "<leader>rn", vim.lsp.buf.rename, "rename")
  -- vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)

  -- like hovering, but for completion
  map("i", "<C-h>", vim.lsp.buf.signature_help, "signature help")
  -- vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

  -- for stuff like automatic sorting  of imports
  map("n", "<leader>ca", vim.lsp.buf.code_action, "code actions")
  -- vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)

  map(
    'n',
    '<space>ff',
    function() vim.lsp.buf.format { async = true } end,
    "format buffer"
  )

  map(
    "n",
    "<leader>os",
    function()
      if #vim.lsp.get_active_clients() == 0 then
          vim.cmd("LspStart")
      else
          vim.cmd("LspStop")
      end
    end,
    "toggle LSP client"
  )
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
        },
        init_options = {
          settings = {
            -- Any extra CLI arguments for `ruff` go here.
            -- args = {
            --  "--config=" .. vim.fn.getcwd() .. "/pyproject.toml",
            -- },
          },
        },
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
              typeCheckingMode = "off",  -- this is slow
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
    -- {name = "month"},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
    {name = 'path'},
    {name = 'luasnip'},
    {name = 'buffer', keyword_length = 5},
  },
  formatting = lsp_zero.cmp_format(),
  
})

require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
})
require("lspconfig").lua_ls.setup {}
