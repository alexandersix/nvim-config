return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {"nvim-lua/plenary.nvim"},
        keys = {
            {"<leader><leader>", function() require("telescope.builtin").find_files({ hidden = true }) end},
            {"<leader>.", function() require("telescope.builtin").live_grep() end},
            {"<leader>bl", function() require("telescope.builtin").buffers() end},
            {"<leader>fo", function() require("telescope.builtin").oldfiles() end},
        }
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        cond = vim.fn.executable "make" == 1,
        build = "make"
    }
}
