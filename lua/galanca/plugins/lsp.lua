return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline", -- Changes a lot
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "mfussenegger/nvim-dap",
        "jay-babu/mason-nvim-dap.nvim",
        "rcarriga/nvim-dap-ui",
    },
    -- lazy = false,
    event = { "BufReadPre", "BufNewFile" },

    keys = {},
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup {
            ensure_installed = {
                -- lsp
                    -- fun
                    "lua_ls",
                    "gopls",
                    "rust_analyzer",
                    "htmx",
                    "html",
                    -- work
                    "clangd",
                    -- "ts-ls",
                    -- "eslint-lsp",
                    "csharp_ls",
                -- dap
                -- formaters
                    -- "goimports",
                    "stylua",
                -- linting
                    -- "golangci-lint",
                    -- "selene"
            },

            -- Set up lspconfig.
            handlers = {
                function (server_name)
                    require("lspconfig")[server_name].setup {
                        -- on_attach = attach
                        capabilities = require('cmp_nvim_lsp').default_capabilities()
                    }
                end,
            },

            -- Completition
            -- User luasnip
            -- vim.opt.autocompleteopt = { "menu", "menuone", "noselect" },
            require("cmp").setup({
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                window = {
                    -- completion = cmp.config.window.bordered(),
                    -- documentation = cmp.config.window.bordered(),
                },
                mapping = require("cmp").mapping.preset.insert({
                    ['<C-b>'] = require("cmp").mapping.scroll_docs(-4),
                    ['<C-f>'] = require("cmp").mapping.scroll_docs(4),
                    ['<C-Space>'] = require("cmp").mapping.complete(),
                    ['<C-e>'] = require("cmp").mapping.abort(),
                    ['<CR>'] = require("cmp").mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = require("cmp").config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' }, -- For luasnip users.
                },
                    {
                        { name = 'buffer' },
                    })
            }),

            -- Set configuration for specific filetype.
            require("cmp").setup.filetype('gitcommit', {
                sources = require("cmp").config.sources({
                    { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/require("cmp")-git).
                }, {
                        { name = 'buffer' },
                    })
            }),
        }
        require("mason-nvim-dap").setup({
            handlers = {
                function(config)
                    require('mason-nvim-dap').default_setup(config)
                end,
            },
            --mapping = require("dap").mapping.preset.insert({
                ---['<leader>b'] = require("dap").toggle_breakpoint(),
            --}),
        })
    end,
}
