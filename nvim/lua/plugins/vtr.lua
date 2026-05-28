return {
    "christoomey/vim-tmux-runner",
    keys = {
        { "<leader>va", "<cmd>VtrAttachToPane<cr>", desc = "Attach to Tmux Pane" },
        { "<leader>vr", "<cmd>VtrSendCommandToRunner<cr>", desc = "Run Command" },
        { "<leader>vf", "<cmd>VtrSendFile<cr>", desc = "Run Current File" },
        { "<leader>vl", "<cmd>VtrSendLinesToRunner<cr>", mode = { "n", "v" }, desc = "Run Line/Selection" },
    },
}
