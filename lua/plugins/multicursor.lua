return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  keys = {
    {
      "gl",
      function()
        require("multicursor-nvim").matchAddCursor(1)
      end,
      { "n", "v" },
      desc = "Add cursor to next match",
    },
    {
      "gL",
      function()
        require("multicursor-nvim").matchAddCursor(-1)
      end,
      { "n", "v" },
      desc = "Add cursor to previous match",
    },
    {
      "ga",
      function()
        require("multicursor-nvim").matchAllAddCursors()
      end,
      { "n", "v" },
      desc = "Add cursors to all matches",
    },
    {
      "gq",
      function()
        require("multicursor-nvim").toggleCursor()
      end,
      { "n", "v" },
      desc = "Remove all the cursors",
    },
    {
      "<c-q>",
      function()
        require("multicursor-nvim").toggleCursor()
      end,
      { "n", "v" },
      desc = "Remove all the cursors",
    },
    {
      "<esc>",
      function()
        if require("multicursor-nvim").hasCursors() then
          require("multicursor-nvim").clearCursors()
        end
        vim.api.nvim_command("noh")
      end,
      { "n" },
      desc = "Remove all the cursors",
    },
  },
  config = function()
    require("multicursor-nvim").setup()
  end,
}
