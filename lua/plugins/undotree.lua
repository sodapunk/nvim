-- File: ~/.config/nvim/lua/plugins/undotree.lua
return {
  "mbbill/undotree",
  cmd = "UndotreeToggle",
  keys = {
    { "<leader>uu", "<cmd>UndotreeToggle<CR>", desc = "Toggle UndoTree" },
  },
}
