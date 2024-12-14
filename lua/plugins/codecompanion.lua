return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      { "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } },
    },
    opts = {
      strategies = {
        chat = {
          adapter = "anthropic",
          roles = {
            llm = "CodeCompanion",
            user = "Me",
          },
          slash_commands = {
            ["buffer"] = {
              callback = "strategies.chat.slash_commands.buffer",
              description = "Insert open buffers",
              opts = {
                contains_code = true,
                provider = "fzf_lua", -- default|telescope|mini_pick|fzf_lua
              },
            },
            ["fetch"] = {
              callback = "strategies.chat.slash_commands.fetch",
              description = "Insert URL contents",
              opts = {
                adapter = "jina",
              },
            },
            ["file"] = {
              callback = "strategies.chat.slash_commands.file",
              description = "Insert a file",
              opts = {
                contains_code = true,
                max_lines = 1000,
                provider = "fzf_lua", -- default|telescope|mini_pick|fzf_lua
              },
            },
            ["help"] = {
              callback = "strategies.chat.slash_commands.help",
              description = "Insert content from help tags",
              opts = {
                contains_code = false,
                max_lines = 128, -- Maximum amount of lines to of the help file to send (NOTE: each vimdoc line is typically 10 tokens)
                provider = "fzf_lua", -- telescope|mini_pick|fzf_lua
              },
            },
            ["now"] = {
              callback = "strategies.chat.slash_commands.now",
              description = "Insert the current date and time",
              opts = {
                contains_code = false,
              },
            },
            ["symbols"] = {
              callback = "strategies.chat.slash_commands.symbols",
              description = "Insert symbols for a selected file",
              opts = {
                contains_code = true,
                provider = "fzf_lua", -- default|telescope|mini_pick|fzf_lua
              },
            },
            ["terminal"] = {
              callback = "strategies.chat.slash_commands.terminal",
              description = "Insert terminal output",
              opts = {
                contains_code = false,
              },
            },
          },
        },
      },
    },
    enabled = true,
    config = true,
    keys = {
      { "<leader>ac", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, noremap = true, silent = true },
      { "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, noremap = true, silent = true },
      { "<leader>ad", "<cmd>CodeCompanionChat Add<cr>", mode = "v", noremap = true, silent = true },
    },
  },
  {
    "saghen/blink.cmp",
    dependencies = { "olimorris/codecompanion.nvim", "saghen/blink.compat" },
    opts = {
      sources = {
        compat = { "codecompanion" },
        providers = {
          codecompanion = {
            name = "CodeCompanion",
            module = "codecompanion.providers.completion.blink",
            enabled = true,
          },
        },
      },
    },
  },
}
