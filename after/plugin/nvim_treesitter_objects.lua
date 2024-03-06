local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"


require'nvim-treesitter.configs'.setup {
    textobjects = {
        select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = { query = "@function.outer", desc = "[TSObject]: capture outer function"},
                ["if"] = { query = "@function.inner", desc = "[TSObject]: capture inner function"},
                -- ["ac"] = "@class.outer",
                -- You can optionally set descriptions to the mappings (used in the desc parameter of
                -- nvim_buf_set_keymap) which plugins like which-key display
                -- ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                -- You can also use captures from other query groups like `locals.scm`
                -- ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
                ["a?"] = { query = "@conditional.outer", desc = "[TSObject]: capture outer if"},
                ["i?"] = { query = "@conditional.inner", desc = "[TSObject]: capture inner if"},
                ["al"] = { query = "@loop.outer", desc = "[TSObject]: capture outer for loop"},
                ["il"] = { query = "@loop.inner", desc = "[TSObject]: capture inner for loop"},
                ["ar"] = { query = "@assignment.rhs", desc = "[TSObject]: capture assigment's RHS"}, 
            },
            -- You can choose the select mode (default is charwise 'v')
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * method: eg 'v' or 'o'
            -- and should return the mode ('v', 'V', or '<c-v>') or a table
            -- mapping query_strings to modes.
            selection_modes = {
                ['@parameter.outer'] = 'v', -- charwise
                ['@function.outer'] = 'V', -- linewise
                ['@class.outer'] = '<c-v>', -- blockwise
            },
            -- If you set this to `true` (default is `false`) then any textobject is
            -- extended to include preceding or succeeding whitespace. Succeeding
            -- whitespace has priority in order to act similarly to eg the built-in
            -- `ap`.
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * selection_mode: eg 'v'
            -- and should return true or false
            include_surrounding_whitespace = false,

        },
        swap = {
            enable = true,
            swap_next = {
                ["<leader>a"] = { query = "@parameter.inner", desc = "[TSObject]: swap current param and the next"},
            },
            swap_previous = {
                ["<leader>A"] = { query = "@parameter.inner", desc = "[TSObject]: swap current param and the prev"},
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ["]f"] = { query = "@function.outer", desc = "[TSObject]: move to start of next function" },
                ["]c"] = { query = "@class.outer", desc = "[TSObject]: move to start of next class" },
                --
                -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
                ["]l"] = { query = "@loop.*", desc = "[TSObject]: move to start (outer and inner) of next for loop" },
                -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
                --
                -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
                -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
                ["]s"] = { query = "@scope", query_group = "locals", desc = "[TSObject]: move to start of next scope" },
            },
            goto_previous_start = {
                ["[f"] = { query = "@function.outer", desc = "[TSObject]: move to start of prev function"},
                ["[c"] = { query = "@class.outer", desc = "[TSObject]: move to start of prev class" }
            },
            goto_next_end = {
                ["]F"] = { query = "@function.outer", desc = "[TSObject]: move to end of next function"},
                ["]C"] = { query = "@class.outer", desc = "[TSObject]: move to end of next class" },
            },
            goto_previous_end = {
                ["[F"] = { query = "@function.outer", desc = "[TSObject]: move to end of prev function"},
                ["[C"] = { query = "@class.outer", desc = "[TSObject]: move to end of prev class" },
            },
            -- Below will go to either the start or the end, whichever is closer.
            -- Use if you want more granular movements
            -- Make it even more gradual by adding multiple queries and regex.
            goto_next = {
                ["]?"] = { query = "@conditional.outer", desc = "[TSObject]: move to start/end (whichever is closer) of next if statement" },
            },
            goto_previous = {
                ["[?"] = { query = "@conditional.outer", desc = "[TSObject]: move to start/end (whichever is closer) of prev if statement" }, 
            }
        },
    },
}
