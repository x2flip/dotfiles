require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- Use a sub-list to run only the first available formatter
    javascript = {"prettierd"},
    typescript = {"prettierd"},
    typescriptreact = {"prettierd"},
    javascriptreact = {"prettierd"},
    html = {"prettierd"},
  },
  format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 3000
  }
})
