-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

-- set leader keys
--
--
-- UNBIND LazyVim defaults:
-- 1) Unbind LazyVim’s default <leader>l (opens LazyUI)
vim.keymap.del("n", "<leader>l")

-- My maps:

-- ─────────────────────────────────────────────────────────────────────────────
-- Clear search highlighting
-- Press <Esc> in normal mode to turn off :nohlsearch
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- ─────────────────────────────────────────────────────────────────────────────
-- Move selected lines up/down in visual mode and re-select
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- ─────────────────────────────────────────────────────────────────────────────
-- Paste over selection without yanking it
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste over without yanking" })

-- ─────────────────────────────────────────────────────────────────────────────
-- Yank/delete to system clipboard or blackhole register
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete into blackhole register" })

-- ─────────────────────────────────────────────────────────────────────────────
-- Search & replace word under cursor (global, case-insensitive)
vim.keymap.set(
  "n",
  "<leader>sr",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace word under cursor globally" }
)

-- ─────────────────────────────────────────────────────────────────────────────
-- Increment / Decrement number under cursor
vim.keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
vim.keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- ─────────────────────────────────────────────────────────────────────────────
-- Window splits & navigation (replace with tmux if you like)
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- ─────────────────────────────────────────────────────────────────────────────
-- Tab management
--vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
--vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
--vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
--vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
--vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open buffer in new tab" })

-- ─────────────────────────────────────────────────────────────────────────────
-- Commenting (via Comment.nvim)
-- Toggle linewise comment
vim.keymap.set("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle comment (line)" })

-- Toggle blockwise comment
vim.keymap.set("n", "<leader>*", function()
  require("Comment.api").toggle.blockwise.current()
end, { desc = "Toggle comment (block)" })

-- Toggle comment in visual mode
vim.keymap.set(
  "v",
  "<leader>/",
  "<Esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  { desc = "Toggle comment (linewise)" }
)
vim.keymap.set(
  "v",
  "<leader>*",
  "<Esc><cmd>lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<CR>",
  { desc = "Toggle comment (blockwise)" }
)
