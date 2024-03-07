return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },
    -- lazy = false,
    event = { "BufReadPre", "BufNewFile" },

    keys = {},
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup {
            ensure_installed = {
                "lua_ls",
                "gopls", "rust_analyzer",
                --"tsserver",
            },

            handlers = {
                function (server_name)
                    require("lspconfig")[server_name].setup {
                        on_attach = attach
                    }
                end,
            }
        }

    end,
}
