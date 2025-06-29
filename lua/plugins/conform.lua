return {
  "stevearc/conform.nvim",
  opts = {
    -- 🧹 Format markdown + tex using standard tools
    formatters_by_ft = {
      markdown = { "prettier" },
      tex = { "latexindent" },
    },
    format_on_save = {
      timeout_ms = 1000,
      lsp_fallback = true,
    },
  },
}
