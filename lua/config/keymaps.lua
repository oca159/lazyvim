-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
--- Increment and decrement numbers
keymap.set("n", "+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "-", "<C-x>", { desc = "Decrement number" })

--- Select all
keymap.set("n", "ga", "ggVG", { desc = "Select all" })

--- Exit from inser mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
