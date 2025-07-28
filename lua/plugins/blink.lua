return {
  {
    "Saghen/blink.cmp",
    event = "InsertEnter",
    opts = {
      enabled = function()
        return vim.bo.buftype ~= "prompt" and vim.b.completion ~= false
      end,
      keymap = {
        preset = "enter",
      },
      completion = {
        ghost_text = { show_with_menu = false },
        list = {
          selection = {
            preselect = true,
            auto_insert = false,
          },
        },
      },
    },
  },
}
