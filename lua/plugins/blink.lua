return {
  "saghen/blink.cmp",
  optional = true,
  dependencies = { "supermaven-nvim", "saghen/blink.compat" },
  opts = {
    sources = {
      completion = {
        enabled_providers = { "lsp", "path", "snippets", "buffer", "supermaven", "codecompanion" },
      },
      compat = { "supermaven", "codecompanion" },
      providers = {
        codecompanion = {
          name = "CodeCompanion",
          module = "codecompanion.providers.completion.blink",
          enabled = true,
        },
      },
    },
  },
}
