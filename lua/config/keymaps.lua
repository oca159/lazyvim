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

map({ "n", "v" }, "dr", ":Gitsigns reset_hunk<CR>", { desc = "Reset Hunk" })
map({ "n", "v" }, "do", ":Gitsigns preview_hunk_inline<CR>", { desc = "Preview Hunk Line" })

local function notify(command_id)
  return function()
    require("vscode").action(command_id)
  end
end

if vim.g.vscode then
  map("n", "gd", notify("editor.action.revealDefinition"), { silent = true })
  map("n", "gI", notify("editor.action.goToImplementation"), { silent = true })
  map("v", "<leader><leader>", notify("workbench.action.quickOpen"), { silent = true })
  map("n", "<leader>,", notify("workbench.action.openRecent"), { silent = true, noremap = true })
  map("v", "<leader>r", notify("editor.action.refactor"), { silent = true })
  map("n", "<leader>bb", notify("workbench.action.navigateLast"), { silent = true })
  map("n", "<leader>ca", notify("editor.action.showContextMenu"), { silent = true })
  map("n", "<leader>cf", notify("editor.action.formatDocument"), { silent = true })
  map("n", "<leader>co", notify("editor.action.organizeImports"), { silent = true })
  map("n", "<leader>cr", notify("editor.action.rename"), { silent = true })
  map("n", "<leader>e", notify("workbench.view.explorer"), { silent = true })
  map("n", "<leader>gg", notify("workbench.view.scm"), { silent = true, noremap = true })
  map("n", "<leader>gb", notify("gitlens.toggleFileBlame"), { silent = true })
  map("n", "<leader>gc", notify("gitlens.showQuickRepoHistory"), { silent = true })
  map("n", "<leader>gd", notify("git.viewChanges"), { silent = true })
  map("n", "<leader>gf", notify("gitlens.showQuickFileHistory"), { silent = true })
  map("n", "<leader>ghr", notify("git.revertSelectedRanges"), { silent = true })
  map("n", "<leader>ghR", notify("workbench.action.files.revert"), { silent = true })
  map("n", "<leader>sc", notify("workbench.action.showCommands"), { silent = true })
  map("n", "<leader>sg", notify("workbench.action.findInFiles"), { silent = true })
  map("n", "<leader>ss", notify("workbench.action.gotoSymbol"), { silent = true })
  map("n", "<leader>wd", notify("workbench.action.closeActiveEditor"), { silent = true })
  map("n", "<leader>ws", notify("workbench.action.splitEditorDown"), { silent = true })
  map("n", "<leader>wv", notify("workbench.action.splitEditorRight"), { silent = true })
  map("n", "<leader>xx", notify("workbench.actions.view.problems"), { silent = true })
else
  -- ordinary Neovim
end
