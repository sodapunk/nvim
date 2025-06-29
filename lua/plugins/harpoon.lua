-- File: ~/.config/nvim/lua/plugins/harpoon.lua
return {
  "ThePrimeagen/harpoon",
  opts = {},
  keys = {
    {
      "<leader>hh",
      function()
        require("harpoon.mark").add_file()
      end,
      desc = "Harpoon: Mark file",
    },
    {
      "<leader>hj",
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      desc = "Harpoon: Quick Menu",
    },
    {
      "<leader>h1",
      function()
        require("harpoon.ui").nav_file(1)
      end,
      desc = "Harpoon: File 1",
    },
    {
      "<leader>h2",
      function()
        require("harpoon.ui").nav_file(2)
      end,
      desc = "Harpoon: File 2",
    },
    {
      "<leader>h3",
      function()
        require("harpoon.ui").nav_file(3)
      end,
      desc = "Harpoon: File 3",
    },
  },
}
