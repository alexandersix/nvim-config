return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            require("ibl").setup({
                enabled = true,
                scope = {
                    enabled = false
                }
            })
        end
    }
}
