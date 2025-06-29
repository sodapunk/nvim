-- ~/.config/nvim/lua/plugins/mini-surround.lua
return {
  "echasnovski/mini.surround",
  opts = {
    mappings = {
      add = "gsa", -- gsa" + motion → add surround
      delete = "gsd", -- gsd" → delete surround
      replace = "gsr", -- gsr"( → replace
      find = "gsf", -- gsf" → jump to next
      find_left = "gsF", -- gsF" → jump to prev
      highlight = "gsh", -- gsh" → highlight
      update_n_lines = "gsn", -- gsn → adjust search window
    },
  },
  config = function(_, opts)
    require("mini.surround").setup(opts)
  end,
}
