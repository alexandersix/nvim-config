return {
    {
        "goolord/alpha-nvim",
        dependencies = {"kyazdani42/nvim-web-devicons"},
        config = function()
            local startify = require("alpha.themes.startify")
            require("alpha").setup({
                layout = {
                    { type = "padding", val = 1 },
                    startify.section.header,
                    { type = "padding", val = 2 },
                    startify.section.top_buttons,
                    startify.section.mru_cwd,
                    { type = "padding", val = 1 },
                    startify.section.bottom_buttons,
                    startify.section.footer,
                },
                opts = {
                    margin = 3,
                    redraw_on_resize = false,
                    setup = function()
                        vim.api.nvim_create_autocmd('DirChanged', {
                            pattern = '*',
                            callback = function () require('alpha').redraw() end,
                        })
                    end,
                },
            })
        end
    }
}
