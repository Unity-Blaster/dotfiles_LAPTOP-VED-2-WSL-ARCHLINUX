return {
    {
        "milanglacier/minuet-ai.nvim",
        lazy = false,
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            virtualtext = {
                auto_trigger_ft = { "*", "typescript", "typescriptreact", "javascript", "lua" },
                keymap = {
                    accept = "<A-y>",
                    accept_line = "<A-a>",
                    prev = "<A-[>",
                    next = "<A-]>",
                    dismiss = "<A-e>",
                },
            },
            provider = "gemini",
            provider_options = {
                gemini = {
                    model = "gemini-3.1-flash-lite-preview",
                    stream = true,
                    api_key = "GEMINI_API_KEY",
                    optional = {
                        generationConfig = {
                            maxOutputTokens = 256,
                        },
                        safetySettings = {
                            {
                                category = "HARM_CATEGORY_DANGEROUS_CONTENT",
                                threshold = "BLOCK_ONLY_HIGH",
                            },
                        },
                    },
                },
            },
        },
    },

    {
        "nvim-lualine/lualine.nvim",
        opts = function(_, opts)
            table.insert(opts.sections.lualine_x, 1, {
                require("minuet.lualine"),
                display_name = "both",
                provider_model_separator = ":",
            })
        end,
    },
}
