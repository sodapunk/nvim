-- lua/plugins/hydra.lua
return {
  "anuvyklack/hydra.nvim",
  opts = {
    -- optional: hint styling, timeout, etc.
  },
  config = function(_, opts)
    local Hydra = require("hydra")
    Hydra({
      name = "Window Nav",
      mode = "n",
      body = "<leader>w",
      heads = {
        { "h", "<C-w>h", { desc = "←" } },
        { "j", "<C-w>j", { desc = "↓" } },
        { "k", "<C-w>k", { desc = "↑" } },
        { "l", "<C-w>l", { desc = "→" } },
        { "H", ":vertical resize -5<CR>", { desc = "Shrink" } },
        { "L", ":vertical resize +5<CR>", { desc = "Grow" } },
        { "J", ":resize +5<CR>", { desc = "Grow H" } },
        { "K", ":resize -5<CR>", { desc = "Shrink H" } },
        { "q", nil, { exit = true, desc = "Quit" } },
      },
    })
  end,
}
