-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Go to end and start of line
map("n", "L", "$", { desc = "Go to end of line" })
map("n", "H", "^", { desc = "Go to start of line" })

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
map("v", "p", '"_dP', { desc = "Paste without overwriting" })

-- Copy whole file content to clipboard with C-c
map("n", "<leader>y", ":%y+<CR>", { desc = "Copy whole file content to clipboard" })

--- Select all
map("n", "ga", "ggVG", { desc = "Select all" })

--- Scroll up/down
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
map("n", "G", "Gzz", { desc = "Go to the last line" })

--- Search
map("n", "n", "nzzzv", { desc = "Search forward" })
map("n", "N", "Nzzzv", { desc = "Search backward" })

--- Move lines up/down
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Better way to join lines
map("n", "J", "mzJ`z", { desc = "Join lines" })

map(
  "n",
  "<leader>ba",
  [[:%bdelete|edit #|bdelete#<CR>]],
  { desc = "Delete all the buffers except this one", noremap = true, silent = true }
)
