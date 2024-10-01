local config = require("plugins.codecompanion.config")
local strategies = require("plugins.codecompanion.strategies")
local prompt_library = require("plugins.codecompanion.prompt_library")

return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { mapping_key_prefix, group = "ai", mode = { "n", "v" } },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "yaml", "markdown" } },
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
      "nvim-telescope/telescope.nvim", -- Optional: For using slash commands
    },
    opts = {
      strategies = {
        chat = {
          adapter = "copilot",
          roles = { llm = "  Copilot Chat", user = "CodeCompanion" },
          slash_commands = {
            ["buffer"] = {
              callback = "helpers.slash_commands.buffer",
              description = "Insert open buffers",
              opts = {
                contains_code = true,
                provider = "telescope", -- default|telescope|mini_pick|fzf_lua
              },
            },
            ["file"] = {
              callback = "helpers.slash_commands.file",
              description = "Insert a file",
              opts = {
                contains_code = true,
                max_lines = 1000,
                provider = "telescope", -- telescope|mini_pick|fzf_lua
              },
            },
          },
          keymaps = {
            send = {
              modes = {
                n = "<CR>",
                i = "<C-s>",
              },
              index = 1,
              callback = "keymaps.send",
              description = "Send",
            },
            close = {
              modes = {
                n = "q",
              },
              index = 3,
              callback = "keymaps.close",
              description = "Close Chat",
            },
            stop = {
              modes = {
                n = "<C-c>",
              },
              index = 4,
              callback = "keymaps.stop",
              description = "Stop Request",
            },
          },
        },
        inline = { adapter = "copilot" },
        agent = { adapter = "copilot" },
      },
      inline = {
        layout = "buffer", -- vertical|horizontal|buffer
      },
      display = {
        chat = {
          -- Change to true to show the current model
          show_settings = false,
          window = {
            layout = "vertical", -- float|vertical|horizontal|buffer
          },
        },
      },
      opts = {
        log_level = "DEBUG",
        system_prompt = SYSTEM_PROMPT,
      },
      prompt_library = {
        -- Custom the default prompt
        ["Generate a Commit Message"] = {
          prompts = {
            {
              role = "user",
              content = function()
                return "Write commit message with commitizen convention. Write clear, informative commit messages that explain the 'what' and 'why' behind changes, not just the 'how'."
                  .. "\n\n```\n"
                  .. vim.fn.system("git diff")
                  .. "\n```"
              end,
              opts = {
                contains_code = true,
              },
            },
          },
        },
        ["Explain"] = {
          strategy = "chat",
          description = "Explain how code in a buffer works",
          opts = {
            index = 4,
            default_prompt = true,
            mapping = "<LocalLeader>ce",
            modes = { "v" },
            slash_cmd = "explain",
            auto_submit = true,
            user_prompt = false,
            stop_context_insertion = true,
          },
          prompts = {
            {
              role = "system",
              content = COPILOT_EXPLAIN,
              opts = {
                visible = false,
              },
            },
            {
              role = "user",
              content = function(context)
                local code = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

                return "Please explain how the following code works:\n\n```"
                  .. context.filetype
                  .. "\n"
                  .. code
                  .. "\n```\n\n"
              end,
              opts = {
                contains_code = true,
              },
            },
          },
        },
        -- Add custom prompts
        ["Generate a Commit Message for Staged"] = {
          strategy = "chat",
          description = "Generate a commit message for staged change",
          opts = {
            index = 9,
            mapping = "<LocalLeader>cM",
            slash_cmd = "staged-commit",
            auto_submit = true,
          },
          prompts = {
            {
              role = "user",
              content = function()
                return "Write commit message for the change with commitizen convention. Write clear, informative commit messages that explain the 'what' and 'why' behind changes, not just the 'how'."
                  .. "\n\n```\n"
                  .. vim.fn.system("git diff --staged")
                  .. "\n```"
              end,
              opts = {
                contains_code = true,
              },
            },
          },
        },
        ["Inline-Document"] = {
          strategy = "inline",
          description = "Add documentation for code.",
          opts = {
            mapping = "<LocalLeader>cd",
            modes = { "v" },
            slash_cmd = "inline-doc",
            auto_submit = true,
            user_prompt = false,
            stop_context_insertion = true,
          },
          prompts = {
            {
              role = "user",
              content = function(context)
                local code = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

                return "Please provide documentation in comment code for the following code and suggest to have better naming to improve readability.\n\n```"
                  .. context.filetype
                  .. "\n"
                  .. code
                  .. "\n```\n\n"
              end,
              opts = {
                contains_code = true,
              },
            },
          },
        },
        ["Document"] = {
          strategy = "chat",
          description = "Write documentation for code.",
          opts = {
            mapping = "<LocalLeader>cD",
            modes = { "v" },
            slash_cmd = "doc",
            auto_submit = true,
            user_prompt = false,
            stop_context_insertion = true,
          },
          prompts = {
            {
              role = "user",
              content = function(context)
                local code = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

                return "Please brief how it works and provide documentation in comment code for the following code. Also suggest to have better naming to improve readability.\n\n```"
                  .. context.filetype
                  .. "\n"
                  .. code
                  .. "\n```\n\n"
              end,
              opts = {
                contains_code = true,
              },
            },
          },
        },
        ["Review"] = {
          strategy = "chat",
          description = "Review the provided code snippet.",
          opts = {
            index = 11,
            mapping = "<LocalLeader>cR",
            modes = { "v" },
            slash_cmd = "review",
            auto_submit = true,
            user_prompt = false,
            stop_context_insertion = true,
          },
          prompts = {
            {
              role = "system",
              content = COPILOT_REVIEW,
              opts = {
                visible = false,
              },
            },
            {
              role = "user",
              content = function(context)
                local code = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

                return "Please review the following code and provide suggestions for improvement then refactor the following code to improve its clarity and readability:\n\n```"
                  .. context.filetype
                  .. "\n"
                  .. code
                  .. "\n```\n\n"
              end,
              opts = {
                contains_code = true,
              },
            },
          },
        },
        ["Refactor"] = {
          strategy = "inline",
          description = "Refactor the provided code snippet.",
          opts = {
            index = 11,
            mapping = "<LocalLeader>cr",
            modes = { "v" },
            slash_cmd = "refactor",
            auto_submit = true,
            user_prompt = false,
            stop_context_insertion = true,
          },
          prompts = {
            {
              role = "system",
              content = COPILOT_REFACTOR,
              opts = {
                visible = false,
              },
            },
            {
              role = "user",
              content = function(context)
                local code = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

                return "Please refactor the following code to improve its clarity and readability:\n\n```"
                  .. context.filetype
                  .. "\n"
                  .. code
                  .. "\n```\n\n"
              end,
              opts = {
                contains_code = true,
              },
            },
          },
        },
        ["Naming"] = {
          strategy = "inline",
          description = "Give betting naming for the provided code snippet.",
          opts = {
            index = 12,
            mapping = "<LocalLeader>cn",
            modes = { "v" },
            slash_cmd = "naming",
            auto_submit = true,
            user_prompt = false,
            stop_context_insertion = true,
          },
          prompts = {
            {
              role = "user",
              content = function(context)
                local code = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

                return "Please provide better names for the following variables and functions:\n\n```"
                  .. context.filetype
                  .. "\n"
                  .. code
                  .. "\n```\n\n"
              end,
              opts = {
                contains_code = true,
              },
            },
          },
        },
      },
    },
    keys = {
      -- Recommend setup
      {
        mapping_key_prefix .. "a",
        "<cmd>CodeCompanionActions<cr>",
        desc = "Code Companion - Actions",
      },
      {
        mapping_key_prefix .. "v",
        "<cmd>CodeCompanionChat Toggle<cr>",
        desc = "Code Companion - Toggle",
        mode = { "n", "v" },
      },
      -- Some common usages with visual mode
      {
        mapping_key_prefix .. "e",
        "<cmd>CodeCompanion /explain<cr>",
        desc = "Code Companion - Explain code",
        mode = "v",
      },
      {
        mapping_key_prefix .. "f",
        "<cmd>CodeCompanion /fix<cr>",
        desc = "Code Companion - Fix code",
        mode = "v",
      },
      {
        mapping_key_prefix .. "l",
        "<cmd>CodeCompanion /lsp<cr>",
        desc = "Code Companion - Explain LSP diagnostic",
        mode = { "n", "v" },
      },
      {
        mapping_key_prefix .. "t",
        "<cmd>CodeCompanion /tests<cr>",
        desc = "Code Companion - Generate unit test",
        mode = "v",
      },
      {
        mapping_key_prefix .. "m",
        "<cmd>CodeCompanion /commit<cr>",
        desc = "Code Companion - Git commit message",
      },
      -- Custom prompts
      {
        mapping_key_prefix .. "M",
        "<cmd>CodeCompanion /staged-commit<cr>",
        desc = "Code Companion - Git commit message (staged)",
      },
      {
        mapping_key_prefix .. "d",
        "<cmd>CodeCompanion /inline-doc<cr>",
        desc = "Code Companion - Inline document code",
        mode = "v",
      },
      { mapping_key_prefix .. "D", "<cmd>CodeCompanion /doc<cr>", desc = "Code Companion - Document code", mode = "v" },
      {
        mapping_key_prefix .. "r",
        "<cmd>CodeCompanion /refactor<cr>",
        desc = "Code Companion - Refactor code",
        mode = "v",
      },
      {
        mapping_key_prefix .. "R",
        "<cmd>CodeCompanion /review<cr>",
        desc = "Code Companion - Review code",
        mode = "v",
      },
      {
        mapping_key_prefix .. "n",
        "<cmd>CodeCompanion /naming<cr>",
        desc = "Code Companion - Better naming",
        mode = "v",
      },
      -- Quick chat
      {
        mapping_key_prefix .. "q",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            vim.cmd("CodeCompanion " .. input)
          end
        end,
        desc = "Code Companion - Quick chat",
      },
    },
  },
}
