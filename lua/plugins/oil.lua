return {
  "stevearc/oil.nvim",
  enabled = false,
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    default_file_explorer = true,
    columns = {
      "icon",
    },
    keymaps = {
      ["?"] = { "actions.show_help", mode = "n" },
      ["<CR>"] = { "actions.select", mode = "n" },
      ["l"] = { "actions.select", mode = "n" },
      ["h"] = { "actions.parent", mode = "n" },
      ["<C-v>"] = { "actions.select", opts = { vertical = true } },
      ["<C-s>"] = { "actions.select", opts = { horizontal = true } },
      ["<C-p>"] = { "actions.preview", mode = "n" },
      ["<C-r>"] = { "actions.refresh", mode = "n" },
      ["q"] = { "actions.close", mode = "n" },
      ["_"] = { "actions.open_cwd", mode = "n" },
    },
  },
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
