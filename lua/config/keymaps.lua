-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

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
map("n", "<C-a>", "ggVG", { desc = "Select all" })

--- Exit from insert mode
map("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

--- Scroll up/down
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")

--- Search
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

--- Move lines up/down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Bettter way to join lines
map("n", "J", "mzJ`z")

map("n", "<leader>bq", [[:%bdelete|edit #|bdelete#<CR>]], { noremap = true, silent = true })
