return {
    'nvim-telescope/telescope.nvim',
    priority = 999,
    tag = '0.1.5',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { "<leader>pf", function() require("telescope.builtin").find_files() end, "n" },
        { "<C-p>", function() require("telescope.builtin").git_files() end, "n" },
        { "<leader>ps", function() require("telescope.builtin").grep_string({ search = vim.fn.input('Grep > ') }) end, "n" }, 
    },
} 
