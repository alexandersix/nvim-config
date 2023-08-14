local bind_tbl = {
    ["nearest"] = ":TestNearest",
    ["file"] = ":TestFile",
    ["suite"] = ":TestSuite",
    ["last"] = ":TestLast",
    ["visit"] = ":TestVisit",
}


function ArtisanTest(identifier)
    vim.cmd("let test#php#phpunit#executable = 'php artisan test'")
    vim.cmd("let test#php#pest#executable = 'php artisan test'")

    vim.cmd(bind_tbl[identifier])
end

function SailTest(identifier)
    vim.cmd("let test#php#phpunit#executable = 'sail artisan test'")
    vim.cmd("let test#php#pest#executable = 'sail artisan test'")

    vim.cmd(bind_tbl[identifier])
end

return {
    {
        "vim-test/vim-test",
        keys = {
            { "<leader>tn",  function() ArtisanTest("nearest") end },
            { "<leader>tf",  function() ArtisanTest("file") end },
            { "<leader>ta",  function() ArtisanTest("suite") end },
            { "<leader>tl",  function() ArtisanTest("last") end },
            { "<leader>tv",  function() ArtisanTest("visit") end },
            { "<leader>tsn", function() SailTest("nearest") end },
            { "<leader>tsf", function() SailTest("file") end },
            { "<leader>tsa", function() SailTest("suite") end },
            { "<leader>tsl", function() SailTest("last") end },
            { "<leader>tsv", function() SailTest("visit") end },
        },
        config = function()
            vim.cmd('let test#strategy = "vimux"')
            vim.cmd("let g:test#preserve_screen = 0")
            vim.cmd("let g:VimuxOrientation = 'h'")
        end
    },
}
