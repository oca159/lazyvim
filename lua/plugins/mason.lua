return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "shellcheck",
      "shfmt",
      "flake8",
      "eslint_d",
      "eslint-lsp",
      "prettier",
      "vtsls",
    },
  },
}
