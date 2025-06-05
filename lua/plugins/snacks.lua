return {
  "snacks.nvim",
  opts = {
    animate = { enabled = false },
    scroll = { enabled = false },
    explorer = { enabled = false },
    terminal = { enabled = true },
    picker = {
      formatters = {
        file = {
          filename_first = true,
        },
      },
    },
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
          ft = "txt",
          name = "txt scratch",
        })
      end,
      desc = "Toggle txt scratch buffer",
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
