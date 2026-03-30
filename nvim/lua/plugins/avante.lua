return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false,
    opts = {
      provider = "gemini",
      providers = {
        gemini = {
          model = "gemini-3.1-pro-preview",
          extra_request_body = {
            temperature = 0,
          },
        },
      },
      windows = {
        sidebar_header = {
          align = "center",
          rounded = true,
        },
      },
    },
    build = "make",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-tree/nvim-web-devicons",
    },
  },
}
