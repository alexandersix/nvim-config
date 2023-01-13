return {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>fm", function() require("harpoon.mark").add_file() end },
        { "<leader>fh", function() require("harpoon.ui").toggle_quick_menu() end },
        { "<leader>fj", function() require("harpoon.ui").nav_file(1) end },
        { "<leader>fk", function() require("harpoon.ui").nav_file(2) end },
        { "<leader>fl", function() require("harpoon.ui").nav_file(3) end },
        { "<leader>f;", function() require("harpoon.ui").nav_file(4) end },
    }
}
