return {
  "saghen/blink.cmp",
  opts = {
    keymap = { preset = "super-tab", ["<CR>"] = { "accept", "fallback" } },
  },
  {
    "saghen/blink.cmp",
    dependencies = { "olimorris/codecompanion.nvim", "saghen/blink.compat" },
    event = "InsertEnter",
    opts = {
      enabled = function()
        return vim.bo.buftype ~= "prompt" and vim.b.completion ~= false
      end,
      completion = {
        accept = {
          auto_brackets = {
            kind_resolution = {
              blocked_filetypes = { "typescriptreact", "javascriptreact", "vue", "codecompanion" },
            },
          },
        },
      },
      sources = {
        per_filetype = {
          codecompanion = { "codecompanion" },
        },
      },
    },
  },
}
