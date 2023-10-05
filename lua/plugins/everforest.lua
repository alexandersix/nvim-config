return {
    'neanias/everforest-nvim',
    version = false,
    lazy = false,
    priority = 1000,
    config = function()
        require('everforest').setup({
            background = "soft",
            on_highlights = function(hl, palette)
                hl.CurSearch = { fg = palette.bg0, bg = palette.statusline1 }
                hl.IncSearch = { fg = palette.bg0, bg = palette.statusline1 }
                hl.Search = { fg = palette.bg0, bg = palette.statusline1 }
                hl.Visual = { fg = palette.fg, bg = palette.bg_green }
            end
        })

        vim.cmd.colorscheme "everforest"
    end
}
