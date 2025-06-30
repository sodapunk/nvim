-- lua/plugins/zen.lua
return {
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      window = { width = 0.8, options = { number = false, cursorline = false } },
      plugins = { twilight = { enabled = true }, gitsigns = false, kitty = { enabled = false } },
    },
  },
  { "folke/twilight.nvim", opts = { dimming = { alpha = 0.25 }, context = 10 } },
}
