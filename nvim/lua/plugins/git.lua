return {
    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen", "DiffviewFileHistory" },
        keys = {
            -- <leader>gh opens a beautiful Git Tree for the current file
            { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File Git History Tree" },
            -- <leader>gH opens the Git Tree for the entire repository
            { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Repo Git History Tree" },
        },
    },
}
