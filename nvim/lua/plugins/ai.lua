return {
  {
    "milanglacier/minuet-ai.nvim",
    opts = {
      virtualtext = {
        auto_trigger_ft = { "*" },
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
          -- Use the blazing fast Flash model purely for autocomplete
          model = "gemini-3-flash-preview",
        },
      },
    },
  },
}
