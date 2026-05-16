return {
    -- Tell nvim-lint (the linter) to usecustom config
    {
        "mfussenegger/nvim-lint",
        opts = {
            linters = {
                ["markdownlint-cli2"] = {
                    args = {
                        "--config",
                        vim.fn.expand("~/.config/nvim/.markdownlint.json"),
                        "--",
                    },
                },
            },
        },
    },

    -- Tell conform.nvim (the formatter) to use custom config
    {
        "stevearc/conform.nvim",
        opts = {
            formatters = {
                ["markdownlint-cli2"] = {
                    prepend_args = {
                        "--config",
                        vim.fn.expand("~/.config/nvim/.markdownlint.json"),
                    },
                },
            },
        },
    },
}
