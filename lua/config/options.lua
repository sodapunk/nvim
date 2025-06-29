-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

vim.g.lazyvim_python_lsp = "pyright" -- or "basedpyright"
vim.g.root_spec = { "lsp", { ".git", "environment.yml", "pyproject.toml" }, "cwd" }

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- indent & tabs
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.smartindent = true
opt.wrap = false

-- store undos
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- search highlighting
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- color & theme stuff
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes" --show sign col so text does not shif (check)

-- backspace
opt.backspace = "indent,eol,start" -- allow bs on indent eol and imode start pos

-- clipboard
--opt.clipboard:append("unnamedplus") -- sys clipboard
vim.schedule(function()
  opt.clipboard = "unnamedplus"
end)

--windowsplits
opt.splitright = true
opt.splitbelow = true

opt.splitright = true
opt.splitbelow = true

-- from primagen and kickstart

opt.scrolloff = 10 -- min numb of chars when navigationg (above/below)

-- vim.o.list = true -- nicer lists i think (check)
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.o.confirm = true --check if quit with no save
