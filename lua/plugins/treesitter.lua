return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "windwp/nvim-ts-autotag",
        },
        build = function()
            pcall(require("nvim-treesitter.install").update { with_sync = true })
        end,
        config = function()
            require("nvim-treesitter.configs").setup({
                autotag = {
                    enable = true
                },
                ensure_installed = { "bash", "c", "cpp", "css", "git_rebase", "go", "html", "javascript", "json", "lua",
                    "php", "rust", "sql", "svelte", "tsx", "typescript", "vim", "vue", "yaml" },
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true,
                },
            })
        end
    }
}
