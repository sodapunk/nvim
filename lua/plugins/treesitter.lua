return { require("nvim-treesitter.configs").setup({
  indent = {
    enable = true,
    disable = { "python" },
  },
}) }
