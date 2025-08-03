local function add_ruby_deps_command(client, bufnr)
  vim.api.nvim_buf_create_user_command(bufnr, "ShowRubyDeps", function(opts)
    local params = vim.lsp.util.make_text_document_params()
    local show_all = opts.args == "all"

    client.request("rubyLsp/workspace/dependencies", params, function(error, result)
      if error then
        print("Error showing deps: " .. error)
        return
      end

      local quickfix_list = {}
      for _, dependency in ipairs(result) do
        if show_all or dependency.dependency then
          table.insert(quickfix_list, {
            text = string.format("%s (%s) - %s", dependency.name, dependency.version, dependency.dependency),
            filename = dependency.path,
          })
        end
      end

      vim.fn.setqflist(quickfix_list)
      vim.cmd("copen")
    end, bufnr)
  end, {
    nargs = "?",
    complete = function()
      return { "all" }
    end,
  })
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        yamlls = {
          settings = {
            yaml = {
              schemaStore = {
                enable = false,
                url = "",
              },
              schemas = require("schemastore").yaml.schemas(),
            },
          },
        },
        ruby_lsp = {
          on_attach = function(client, buffer)
            add_ruby_deps_command(client, bufnr)
          end,
          mason = false,
          cmd = { "mise", "x", "--", "ruby-lsp" },
          init_options = {
            addonSettings = {
              ["Ruby LSP Rails"] = {
                enablePendingMigrationsPrompt = false,
              },
            },
            formatter = "auto",
            enabledFeatures = {
              codeActions = true,
              diagnostics = true,
              documentHighlights = true,
              documentLink = true,
              documentSymbols = true,
              foldingRanges = true,
              formatting = true,
              hover = true,
              inlayHint = true,
              selectionRanges = true,
              completion = true,
              codeLens = true,
              definition = true,
              workspaceSymbol = true,
              signatureHel = true,
            },
            featuresConfiguration = {
              inlayHint = {
                implicitHashValue = true,
                implicitRescue = true,
              },
            },
            experimentalFeaturesEnabled = true,
          },
        },
      },
    },
  },
}
