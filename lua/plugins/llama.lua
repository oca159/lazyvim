return {
  "ggml-org/llama.vim",
  enabled = true,
  init = function()
    vim.g.llama_config = {
      auto_fim = true,
      show_info = 0,
      n_predict = 128,
      n_suffix = 128,
    }
  end,
}
