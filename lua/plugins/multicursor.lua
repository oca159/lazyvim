return {
  "jake-stewart/multicursor.nvim",
  enabled = false,
  config = function()
    local mc = require("multicursor-nvim")
    local set = vim.keymap.set

    mc.setup()

    -- match new cursors within visual selections by regex.
    set("v", "M", mc.matchCursors)

    -- Add and remove cursors with control + left click.
    set("n", "<c-leftmouse>", mc.handleMouse)

    -- Append/insert for each line of visual selections
    set("v", "I", mc.insertVisual)
    set("v", "A", mc.appendVisual)
  end,
}
