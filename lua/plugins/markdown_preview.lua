-- File: ~/.config/nvim/lua/plugins/markdown_preview.lua
return {
  "iamcco/markdown-preview.nvim",
  ft = "markdown",
  build = "cd app && npm install",
  cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
  keys = {
    -- change from <leader>mp to <leader>tm
    { "<leader>tm", "<cmd>MarkdownPreview<CR>", desc = "Text: Markdown Preview" },
  },
}
