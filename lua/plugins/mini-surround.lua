-- ~/.config/nvim/lua/plugins/mini-surround.lua
return {
  {
    "echasnovski/mini.surround",
    -- defer load until you actually start editing
    event = "VeryLazy",
    -- no opts.mappings = … means “use the plugin’s built-in defaults”
    opts = {},
  },
}
