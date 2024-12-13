-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

local mc = require("multicursor-nvim")

-- Silent keymap option
local opts = { silent = true }

-- Go to end and start of line
map("n", "<S-l>", "$", { desc = "Go to end of line" })
map("n", "<S-h>", "^", { desc = "Go to start of line" })
map("n", "<A-h>", "^", {
  desc = "Go to start of line",
  silent = true,
})
map("n", "<A-l>", "$", {
  desc = "Go to end of line",
  silent = true,
})

-- Save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Close all fold except the current one.
map("n", "zv", "zMzvzz", {
  desc = "Close all folds except the current one",
})

-- Close current fold when open. Always open next fold.
map("n", "zj", "zcjzOzz", {
  desc = "Close current fold when open. Always open next fold.",
})

-- Close current fold when open. Always open previous fold.
map("n", "zk", "zckzOzz", {
  desc = "Close current fold when open. Always open previous fold.",
})

-- Better paste
-- remap "p" in visual mode to delete the highlighted text without overwriting your yanked/copied text, and then paste the content from the unnamed register.
map("v", "p", '"_dP', opts)

-- Copy whole file content to clipboard with C-c
map("n", "<C-c>", ":%y+<CR>", opts)

--- Increment and decrement numbers
map("n", "+", "<C-a>", { desc = "Increment number" })
map("n", "-", "<C-x>", { desc = "Decrement number" })

--- Select all
map("n", "ga", "ggVG", { desc = "Select all" })

--- Exit from insert mode
map("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

--- Scroll up/down
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")
map("n", "G", "Gzz")

--- Search
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

--- Move lines up/down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Bettter way to join lines
map("n", "J", "mzJ`z")

map("n", "<leader>bq", [[:%bdelete|edit #|bdelete#<CR>]], { noremap = true, silent = true })

-- Telescope
map("n", "<leader><space>", LazyVim.pick("files", { root = false }), { desc = "Find files" })

-- CodeCompanion
map("n", "<leader>ac", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
map("v", "<leader>ac", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
map("n", "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
map("v", "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
map("v", "<leader>ad", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

-- Add a cursor to the next match
map({ "n", "v" }, "gl", function()
  mc.matchAddCursor(1)
end, { desc = "Add cursor to next match" })

-- Add a cursor to the previous match
map({ "n", "v" }, "gL", function()
  mc.matchAddCursor(-1)
end, { desc = "Add cursor to previous match" })

-- Add a cursor to all matches
map({ "n", "v" }, "ga", mc.matchAllAddCursors, { desc = "Add cursors to all matches" })

-- Clear all cursors
map("n", "<esc>", function()
  if mc.hasCursors() then
    mc.clearCursors()
  end
  vim.api.nvim_command("noh")
end, { desc = "Clear all cursors" })

-- Append/insert for each line of visual selections.
map("v", "I", mc.insertVisual, { desc = "Append to start of each line" })
map("v", "A", mc.appendVisual, { desc = "Append to end of each line" })

-- Rotate the main cursor.
map({ "n", "v" }, "<left>", mc.prevCursor, { desc = "Rotate to previous cursor" })
map({ "n", "v" }, "<right>", mc.nextCursor, { desc = "Rotate to next cursor" })

-- Easy way to add and remove cursors using the main cursor.
map({ "n", "v" }, "<c-q>", mc.toggleCursor, { desc = "Toggle cursor" })
map({ "n", "v" }, "gq", mc.toggleCursor, { desc = "Toggle cursor" })

map("n", "<c-h>", "<cmd>ZellijNavigateLeftTab<cr>", { desc = "navigate left or tab" })
map("n", "<c-j>", "<cmd>ZellijNavigateDown<cr>", { desc = "navigate down" })
map("n", "<c-k>", "<cmd>ZellijNavigateUp<cr>", { desc = "navigate up" })
map("n", "<c-l>", "<cmd>ZellijNavigateRightTab<cr>", { desc = "navigate right or tab" })
