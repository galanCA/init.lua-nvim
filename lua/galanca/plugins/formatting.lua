return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            log_level = vim.log.levels.DEBUG,
            formatters_by_ft = {
                lua = { "stylua" },
                go = { "goimports" }
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_fallbadck = true,
            },
            formatters = {
                goimports = {
                    command = '"C:\\Users\\Cesar Galan\\AppData\\Local\\nvim-data\\mason\\bin\\goimports.cmd"'
                }
            }
        })
        vim.keymap.set({ "n", "v" }, "<leader>mp", function()
            conform.format({
                timeout_ms = 500,
                lsp_fallbadck = true,
            })
        end, { desc = "Format file or range (in visual mode)" })
    end
}
