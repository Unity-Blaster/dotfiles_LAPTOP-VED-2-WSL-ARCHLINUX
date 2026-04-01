return {
    {
        "mbbill/undotree",
        keys = {
            -- Primeagen maps this to <leader>u, but LazyVim uses that for UI toggles.
            -- We will map it to <leader>U (Shift + U) instead!
            { "<leader>U", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undo Tree" },
        },
    },
}
