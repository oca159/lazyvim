return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
    "nvim-telescope/telescope.nvim", -- Optional: For using slash commands
    { "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves the default Neovim UI
  },
  keys = {
    {
      "<leader>aa",
      "<cmd>CodeCompanionActions<cr>",
      mode = { "n", "v" },
      desc = "CodeCompanionActions",
    },
    {
      "<leader>at",
      "<cmd>CodeCompanionToggle<cr>",
      mode = { "n", "v" },
      desc = "CodeCompanionToggle",
    },
    {
      "<leader>ad",
      "<cmd>CodeCompanionAdd<cr>",
      mode = { "v" },
      desc = "CodeCompanionAdd",
    },
  },
  opts = {
    strategies = {
      chat = {
        adapter = "anthropic",
      },
      inline = {
        adapter = "anthropic",
      },
      agent = {
        adapter = "anthropic",
      },
    },
  },
}
