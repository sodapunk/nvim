-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

--vim.g.lazyvim_python_lsp = "pyright" -- or "basedpyright"
vim.g.lazyvim_python_lsp = "basedpyright"

vim.g.root_spec = { "lsp", { ".git", "environment.yml", "pyproject.toml" }, "cwd" }
vim.g.lazyvim_cmp = "nvim-cmp"
vim.g.autoformat = true -- turn on format-on-save

local opt = vim.opt

-- Numbers
opt.number = true
opt.relativenumber = true

-- Indent & Tabs
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- No wrap in code
opt.wrap = false

-- Undo history
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- UI
opt.cursorline = true
opt.scrolloff = 10
opt.signcolumn = "yes"
opt.termguicolors = true
opt.background = "dark"
opt.backspace = "indent,eol,start"
opt.confirm = true

-- Clipboard
-- Defer until after startup so LazyVim’s clipboard manager doesn’t stomp on it
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

-- Folds via Treesitter
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
