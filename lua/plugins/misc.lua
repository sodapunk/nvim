return {
  { -- This helps with php/html for indentation
    "captbaritone/better-indent-support-for-php-with-html",
  },
  { -- This helps with ssh tunneling and copying to clipboard
    "ojroques/vim-oscyank",
  },
  { -- This generates docblocks
    "kkoomen/vim-doge",
    build = ":call doge#install()",
  },
  { -- Git plugin
    "tpope/vim-fugitive",
  },
  { -- Show historical versions of the file locally
    "mbbill/undotree",
  },
  { -- Show CSS Colors
    "brenoprata10/nvim-highlight-colors",
    config = function()
      require("nvim-highlight-colors").setup({})
    end,
  },
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    config = function()
      require("fidget").setup({ text = { spinner = "dots" } })
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false, -- load immediately
  },
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require("Comment").setup()
    end,
  },
}
