-- File: ~/.config/nvim/lua/plugins/markdown_preview.lua
return {

  "iamcco/markdown-preview.nvim",
  build = "cd app && npm install",
  ft = { "markdown" },
  cmd = { "MarkdownPreview" },
}
