return {
  "https://git.sr.ht/~swaits/zellij-nav.nvim",
  lazy = true,
  event = "VeryLazy",
  opts = {},
  keys = {
    {
      "<C-h>",
      function()
        require("zellij-nav").left_tab()
      end,
      "n",
      desc = "Navigate left or tab",
    },
    {
      "<C-j>",
      function()
        require("zellij-nav").down()
      end,
      "n",
      desc = "Navigate down",
    },
    {
      "<C-k>",
      function()
        require("zellij-nav").up()
      end,
      "n",
      desc = "Navigate up",
    },
    {
      "<C-l>",
      function()
        require("zellij-nav").right_tab()
      end,
      "n",
      desc = "Navigate right or tab",
    },
  },
}
