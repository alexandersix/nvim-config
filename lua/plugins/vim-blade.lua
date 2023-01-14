return {
    {
        "alexandersix/vim-blade",
        config = function()
            vim.cmd [[
                augroup blade_settings
                autocmd!
                autocmd BufRead,BufNewFile *.blade.php set filetype=blade
                augroup end
            ]]
        end
    }
}
