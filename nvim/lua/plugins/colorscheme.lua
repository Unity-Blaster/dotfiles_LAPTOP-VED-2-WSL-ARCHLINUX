return {
    {
        "folke/tokyonight.nvim",
        opts = {
            transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
            on_highlights = function(hl, c)
                -- Force Lualine's middle section and Neovim's statusline to be fully transparent
                hl.StatusLine = { bg = "NONE" }
                hl.StatusLineNC = { bg = "NONE" }
                hl.lualine_c_normal = { bg = "NONE" }
                hl.lualine_c_insert = { bg = "NONE" }
                hl.lualine_c_visual = { bg = "NONE" }
                hl.lualine_c_command = { bg = "NONE" }
                hl.lualine_c_replace = { bg = "NONE" }
                hl.lualine_c_inactive = { bg = "NONE" }
            end,
        },
    },
}
