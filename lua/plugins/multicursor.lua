if true then
  return {}
end
return {
  "jake-stewart/multicursor.nvim",
  config = function()
    local multicursor = require("multicursor-nvim")

    multicursor.setup()

    vim.cmd.hi("link MultiCursorCursor Cursor")
    vim.cmd.hi("link MultiCursorVisual Visual")

    vim.keymap.set("n", "<leader>mc", function()
      if multicursor.hasCursors() then
        multicursor.clearCursors()
      end
    end, { desc = "Clear all cursors" })

    vim.keymap.set({ "n", "v" }, "<leader>ma", function()
      multicursor.addCursor("*")
    end, { desc = "Add a cursor and jump to the next word under cursor" })

    vim.keymap.set({ "n", "v" }, "<leader>ms", function()
      multicursor.skipCursor("*")
    end, { desc = "Skip and jump to the next word under cursor" })

    vim.keymap.set({ "n", "v" }, "<leader>mj", multicursor.nextCursor, { desc = "Jump to previous cursor" })
    vim.keymap.set({ "n", "v" }, "<right>mk", multicursor.prevCursor, { desc = "Jump to next cursor" })
    vim.keymap.set({ "n", "v" }, "<leader>mx", multicursor.deleteCursor, { desc = "Delete cursor" })
    vim.keymap.set({ "n", "v" }, "<leader>mA", multicursor.alignCursors, { desc = "Align cursors" })

    vim.keymap.set("v", "I", function()
      require("my-nvim-micro-plugins.multicursors").add_multicursors_at_line_starts()
    end)

    vim.keymap.set("v", "A", function()
      require("my-nvim-micro-plugins.multicursors").add_multicursors_at_line_ends()
    end)
  end,
}
