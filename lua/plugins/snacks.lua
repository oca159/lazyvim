return {
  "snacks.nvim",
  opts = {
    scroll = { enabled = false },
  },
  keys = {
    {
      "<leader>1",
      function()
        Snacks.scratch({
          ft = "json",
          name = "json scratch",
        })
      end,
      desc = "Toggle json scratch buffer",
    },
    {
      "<leader>2",
      function()
        Snacks.scratch({
          name = "markdown scratch",
        })
      end,
      desc = "Toggle markdown scratch buffer",
    },
    {
      "<leader>3",
      function()
        Snacks.scratch({
          ft = "lua",
          name = "lua scratch",
        })
      end,
      desc = "Toggle lua scratch buffer",
    },
    {
      "<leader>S",
      function()
        Snacks.scratch.select()
      end,
      desc = "Select Scratch Buffer",
    },
  },
}
