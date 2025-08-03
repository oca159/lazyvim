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
    {
      "<leader><space>",
      function()
        Snacks.picker.files({ hidden = true })
      end,
      desc = "Find Files (cwd)",
    },
    -- {
    --   "<leader>ot",
    --   function()
    --     Snacks.terminal("taskwarrior-tui")
    --   end,
    --   desc = "Open tasks",
    -- },
    -- {
    --   "<leader>obd",
    --   function()
    --     Snacks.terminal("task burndown.daily", { auto_close = false })
    --   end,
    --   desc = "Open burndown daily",
    -- },
    -- {
    --   "<leader>obm",
    --   function()
    --     Snacks.terminal("task burndown.monthly", { auto_close = false })
    --   end,
    --   desc = "Open burndown daily",
    -- },
    -- {
    --   "<leader>obw",
    --   function()
    --     Snacks.terminal("task burndown.weekly", { auto_close = false })
    --   end,
    --   desc = "Open burndown daily",
    -- },
    -- {
    --   "<leader>oc",
    --   function()
    --     Snacks.terminal("task calendar", { auto_close = false })
    --   end,
    --   desc = "Open calendar",
    -- },
  },
}
