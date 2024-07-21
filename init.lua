-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
local utils = require("utils")

vim.api.nvim_set_keymap(
  "n",
  "<leader>jc",
  'print(utils.find_nearest_jest_config(vim.fn.expand("%:p:h")))<CR>',
  { noremap = true, silent = true }
)
