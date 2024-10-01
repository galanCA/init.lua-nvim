return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        {"<leader>a", function() require("harpoon"):list():add() end, "n"},
        {"<leader>z", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list() ) end, "n"},
        {"<C-h>", function() require("harpoon"):list():select(1) end, "n"},
        {"<C-t>", function() require("harpoon"):list():select(2) end, "n"},
        {"<C-n>", function() require("harpoon"):list():select(3) end, "n"},
        {"<C-s>", function() require("harpoon"):list():select(4) end, "n"},
    },

    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()
    end
}
