-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- 🧠 Enable spell checking for writing files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "tex", "text" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_gb"
  end,
})

-- 🔄 Auto-regenerate .spl when dictionary changes
vim.api.nvim_create_autocmd("FocusGained", {
  pattern = "*",
  callback = function()
    local cfg = vim.fn.stdpath("config")
    local add = cfg .. "/spell/en.utf-8.add"
    local spl = cfg .. "/spell/en.utf-8.add.spl"
    if vim.fn.filereadable(add) == 1 then
      local a = vim.fn.getftime(add)
      local s = vim.fn.getftime(spl)
      if a > s or s == -1 then
        vim.cmd("silent! mkspell! " .. spl .. " " .. add)
      end
    end
  end,
})
