-- File: ~/.config/nvim/lua/plugins/vimtex.lua
return {
  "lervag/vimtex",
  ft = "tex",
  init = function()
    vim.g.vimtex_compiler_method = "latexmk"
  end,
  opts = {
    viewer = "zathura",
    syntax_conceal = { greek = false },
  },
  keys = {
    -- switch from <leader>lc/v to <leader>tc/v
    { "<leader>tc", "<cmd>VimtexCompile<CR>", desc = "Text: LaTeX Compile" },
    { "<leader>tv", "<cmd>VimtexView<CR>", desc = "Text: LaTeX View" },
  },
}
