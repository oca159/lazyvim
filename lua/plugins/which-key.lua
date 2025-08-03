return {
  "folke/which-key.nvim",
  event = "VeryLazy", -- Load after UI is ready
  opts_extend = { "spec" }, -- Allow extending the spec table
  opts = {
    defaults = {}, -- Deprecated, kept for compatibility
    preset = "helix", -- Use Helix-style key hints
    spec = {
      {
        mode = { "n", "v" }, -- Apply to normal and visual modes
        -- Define key group labels for better organization
        { "<leader><tab>", group = "tabs" },
        { "<leader>a", group = "ai" },
        { "<leader>c", group = "code" },
        { "<leader>f", group = "file/find" },
        { "<leader>g", group = "git" },
        { "<leader>gh", group = "hunks" },
        { "<leader>q", group = "quit/session" },
        { "<leader>r", group = "refactor", icon = { icon = " ", color = "yellow" } },
        { "<leader>s", group = "search" },
        { "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
        { "<leader>o", group = "tasks", icon = { icon = "󰙵 ", color = "cyan" } },
        { "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
        { "[", group = "prev" },
        { "]", group = "next" },
        { "g", group = "goto" },
        { "gs", group = "surround" },
        { "z", group = "fold" },
        {
          "<leader>b",
          group = "buffer",
          -- Dynamically expand to show buffer-specific keymaps
          expand = function()
            return require("which-key.extras").expand.buf()
          end,
        },
        {
          "<leader>w",
          group = "windows",
          proxy = "<c-w>", -- Proxy window commands to Ctrl-W
          -- Dynamically expand to show window-specific keymaps
          expand = function()
            return require("which-key.extras").expand.win()
          end,
        },
        -- Override default descriptions with better ones
        { "gx", desc = "Open with system app" },
      },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        -- Show buffer-local keymaps only
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Keymaps (which-key)",
    },
    {
      "<c-w><space>",
      function()
        -- Enter window hydra mode for continuous window operations
        require("which-key").show({ keys = "<c-w>", loop = true })
      end,
      desc = "Window Hydra Mode (which-key)",
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    -- Handle deprecated defaults option
    if not vim.tbl_isempty(opts.defaults) then
      LazyVim.warn("which-key: opts.defaults is deprecated. Please use opts.spec instead.")
      wk.register(opts.defaults)
    end
  end,
}
