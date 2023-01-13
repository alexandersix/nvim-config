return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        build = function()
            pcall(require("nvim-treesitter.install").update { with_sync = true })
        end,
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "bash", "c", "cpp", "git_rebase", "go", "help", "html", "javascript", "json", "lua", "php", "rust", "svelte", "tsx", "vim", "vue", "yaml"},
                highlight = {
                    enable = true,
                },
                indentation = {
                    enable = true,
                },
            })
        end
    }
}
