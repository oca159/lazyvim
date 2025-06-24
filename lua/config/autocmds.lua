-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Don't auto commenting new lines
autocmd("BufEnter", {
  pattern = "",
  command = "set fo-=c fo-=r fo-=o",
})

autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "@org.priority.highest", { bg = "#f38ba8", fg = "#000000" })
    vim.api.nvim_set_hl(0, "@org.priority.default", { bg = "#fab387", fg = "#000000" })
    vim.api.nvim_set_hl(0, "@org.priority.lowest", { bg = "#f9e2af", fg = "#000000" })
  end,
})
