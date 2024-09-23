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

--- Scroll up/down
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<C-d>", "<C-d>zz")

--- Search
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

--- Move lines up/down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Bettter way to join lines
keymap.set("n", "J", "mzJ`z")

-- Disable arrow keys
keymap.set("n", "<up>", "<nop>")
keymap.set("n", "<down>", "<nop>")
keymap.set("n", "<left>", "<nop>")
keymap.set("n", "<right>", "<nop>")
