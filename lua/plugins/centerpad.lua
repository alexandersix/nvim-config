return {
    "smithbm2316/centerpad.nvim",
    keys = {
        { "<leader>cn", function() require 'centerpad'.toggle { leftpad = 60, rightpad = 60 } end }
    }
}
