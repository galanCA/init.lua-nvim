return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        {"<leader>a", function() require("harpoon"):list():append() end, "n"},
        --{"<C-e>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list() ) end, "n"},
    },

    config = function() 
        local harpoon = require("harpoon")
        harpoon:setup()

        -- local mark = require("harpoon.mark")
        --local ui = require("harpoon.ui")

        --vim.keymap.set("n", "<leader>a", mark.add_file)
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end )

        vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)
    end
}
