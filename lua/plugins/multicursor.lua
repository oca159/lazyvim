return {
  "jake-stewart/multicursor.nvim",
  enabled = false,
  config = function()
    local mc = require("multicursor-nvim")

    mc.setup()

    vim.cmd.hi("link", "MultiCursorCursor", "Cursor")
    vim.cmd.hi("link", "MultiCursorVisual", "Visual")

    vim.keymap.set("n", "<leader>mc", function()
      if mc.hasCursors() then
        mc.clearCursors()
      end
    end, { desc = "clear all cursors" })

    vim.keymap.set({ "n", "v" }, "gl", function()
      mc.addCursor("*")
    end, { desc = "add a cursor and jump to the next word under cursor" })

    -- jump to the next word under cursor but do not add a cursor
    vim.keymap.set({ "n", "v" }, "<leader>ms", function()
      mc.skipCursor("*")
    end, { desc = "skip and jump to the next word under cursor" })

    vim.keymap.set({ "n", "v" }, "<leader>mj", mc.nextCursor, { desc = "jump to previous cursor" })
    vim.keymap.set({ "n", "v" }, "<leader>mk", mc.prevCursor, { desc = "jump to next cursor" })
    vim.keymap.set({ "n", "v" }, "<leader>mx", mc.deleteCursor, { desc = "delete cursor" })
    vim.keymap.set({ "n", "v" }, "<leader>ma", mc.alignCursors, { desc = "align cursors" })

    -- Add cursors above/below the main cursor.
    vim.keymap.set({ "n", "v" }, "<s-up>", function()
      mc.addCursor("k")
    end)
    vim.keymap.set({ "n", "v" }, "<s-down>", function()
      mc.addCursor("j")
    end)

    -- match new cursors within visual selections by regex.
    vim.keymap.set("v", "M", mc.matchCursors)

    -- Rotate the main cursor.
    vim.keymap.set({ "n", "v" }, "<s-right>", mc.nextCursor)
    vim.keymap.set({ "n", "v" }, "<s-left>", mc.prevCursor)

    -- Add and remove cursors with control + left click.
    vim.keymap.set("n", "<c-leftmouse>", mc.handleMouse)
  end,
}
