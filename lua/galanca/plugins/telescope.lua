return {
    'nvim-telescope/telescope.nvim',
    priority = 999,
    tag = '0.1.5',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { "<leader>pf", "<cmd>Telescope find_files<cr>", "n" },
        { "<C-p>", "<cmd>Telescope git_files<cr>", "n" },
    },
    config = function()
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
    end
} 
