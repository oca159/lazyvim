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

-- Telescope
map("n", "<leader><space>", LazyVim.pick("files", { root = false }), { desc = "Find files" })

-- Terminal
map("n", "<c-/>", function()
  LazyVim.terminal()
end, { desc = "Terminal (Root Dir)" })

-- -- Avante AI-assisted coding
-- local function avante_ask(question)
--   return function()
--     require("avante.api").ask({ question = question })
--   end
-- end
--
-- local commit_prompt = [[
--     Write commit message with commitizen convention. Write clear, informative commit messages that explain the 'what' and 'why' behind changes, not just the 'how'.
--     Give me the commit message in a code block always, only return the commit message without any other information.
--
--     ```
--     ]] .. vim.fn.system("git diff") .. "\n```"
--
-- -- Refactor code with avante
-- map(
--   "v",
--   "<leader>ar",
--   avante_ask("Please refactor the following code to improve its clarity and readability"),
--   { desc = "avante: refactor code" }
-- )
--
-- -- Inline documentation with avante
-- map(
--   "v",
--   "<leader>ad",
--   avante_ask(
--     "Please provide documentation in comment code for the following code and suggest better naming to improve readability."
--   ),
--   { desc = "avante: inline documentation" }
-- )
--
-- -- Fix code with avante
-- map(
--   "v",
--   "<leader>af",
--   avante_ask("Please identify issues and suggest fixes with explanations for each of them."),
--   { desc = "avante: fix code" }
-- )
--
-- -- Generate unit tests with avante
-- map(
--   "v",
--   "<leader>at",
--   avante_ask("Please generate unit tests for the following code:"),
--   { desc = "avante: generate unit tests" }
-- )
--
-- -- Improve naming with avante
-- map(
--   "v",
--   "<leader>an",
--   avante_ask("Please provide better names for the following variables and functions:"),
--   { desc = "avante: naming" }
-- )
--
-- -- Generate commit message with avante
-- map("n", "<leader>ac", avante_ask(commit_prompt), { desc = "avante: commit" })
