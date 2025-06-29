return {
  {
    "voldikss/vim-floaterm",
    config = function()
      -- Optional global settings (can be omitted if you like defaults)
      vim.g.floaterm_position = "center"
      vim.g.floaterm_width = 0.9
      vim.g.floaterm_height = 0.8

      -- Optional: Python runner (via Floaterm) mapped to <leader>Tr
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "python",
        callback = function()
          vim.keymap.set("n", "<leader>Tr", ":w<CR>:FloatermNew --autoclose=0 python3 %<CR>", {
            desc = "Run current Python file",
            buffer = true,
          })
        end,
      })
    end,
  },
}
