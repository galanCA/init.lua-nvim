return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    lazy = false,

    keys = {}, 
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup {
            ensure_installed = {
                "lua_ls",
                "gopls", "rust_analyzer",
                "tsserver",
            },
        }
        handlers = {
            function (server_name)
                require("lspconfig")[server_name].setup {
                    on_attach = attach
                }
            end,
        }

    end,
}
