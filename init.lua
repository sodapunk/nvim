-- bootstrap lazy.nvim, LazyVim and your plugins
vim.g.python3_host_prog = "/Users/a.austgulen/miniconda3/envs/mastint/bin/python"
--vim.g.lazyvim_cmp = "nvim-cmp"
-- Fix broken VIMRUNTIME detection from Cellar
--vim.env.VIM = nil
--vim.env.VIMRUNTIME = "/opt/homebrew/share/nvim/runtime"
require("config.lazy")
