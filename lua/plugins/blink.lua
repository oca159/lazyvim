return {
  "saghen/blink.cmp",
  optional = true,
  dependencies = { "supermaven-nvim", "saghen/blink.compat" },
  opts = {
    sources = {
      completion = {
        -- remember to enable your providers here
        enabled_providers = { "lsp", "path", "snippets", "buffer", "supermaven" },
      },
      compat = { "supermaven" },
      providers = { supermaven = { kind = "Supermaven", score_offset = 100 } },
    },
  },
}
