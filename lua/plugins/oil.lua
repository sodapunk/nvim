-- ~/.config/nvim/lua/plugins/oil.lua
return {
  {
    "stevearc/oil.nvim",
    opts = {
      default_file_explorer = true, -- makes :edit on a directory open Oil
      view_options = { show_hidden = true },
      -- any other Oil options you like
    },
    -- load on-demand when you hit <leader>o
    keys = {
      {
        "<leader>o",
        function()
          require("oil").open()
        end,
        desc = " Oil File Explorer",
      },
    },
  },
}
