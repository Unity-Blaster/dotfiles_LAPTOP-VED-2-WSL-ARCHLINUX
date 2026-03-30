return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- Tell conform to use prettier for these filetypes
        yaml = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },

        -- Tell conform to use shfmt for shell AND zsh files
        sh = { "shfmt" },
        zsh = { "shfmt" },
      },
    },
  },
}
