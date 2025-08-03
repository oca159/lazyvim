return {
  {
    "Saghen/blink.cmp",
    event = "InsertEnter",
    opts = {
      enabled = function()
        return vim.bo.buftype ~= "prompt" and vim.b.completion ~= false
      end,
      completion = {
        ghost_text = { show_with_menu = false },
      },
    },
  },
}
