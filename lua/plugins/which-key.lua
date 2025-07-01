return {
  "folke/which-key.nvim",
  opts = {
    spec = {
      -- Terminal group
      { "<leader>T", group = "terminal" },
      { "<leader>Tn", "<cmd>FloatermNew<CR>", desc = "New terminal" },
      { "<leader>Tt", "<cmd>FloatermToggle<CR>", desc = "Toggle terminal" },
      { "<leader>Tp", "<cmd>FloatermPrev<CR>", desc = "Previous terminal" },
      { "<leader>Tx", "<cmd>FloatermKill<CR>", desc = "Close terminal" },

      -- Diagnostics and DAP group
      { "<leader>d", group = "diagnostics" },
      {
        "<leader>dt",
        function()
          require("config.diagnostics").toggle()
        end,
        desc = "Toggle Warnings",
      },
      {
        "<leader>dh",
        function()
          local bufnr = vim.api.nvim_get_current_buf()
          local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
          vim.lsp.inlay_hint.enable(not enabled, nil)
        end,
        desc = "Toggle Inlay Hints",
      },

      { "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", desc = "Toggle Breakpoint" },
      { "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", desc = "Start/Continue" },
      { "<leader>ds", "<cmd>lua require'dap'.step_over()<CR>", desc = "Step Over" },
      { "<leader>di", "<cmd>lua require'dap'.step_into()<CR>", desc = "Step Into" },
      { "<leader>do", "<cmd>lua require'dap'.step_out()<CR>", desc = "Step Out" },
      { "<leader>dr", "<cmd>lua require'dap'.repl.open()<CR>", desc = "Open REPL" },
      { "<leader>du", "<cmd>lua require'dapui'.toggle()<CR>", desc = "Toggle DAP UI" },
      -- Text tools group
      { "<leader>t", group = "text" },
      { "<leader>tm", "<cmd>MarkdownPreview<CR>", desc = "Markdown Preview" },
      { "<leader>ts", "<cmd>MarkdownPreviewStop<CR>", desc = "Stop Preview" },
      { "<leader>tc", "<cmd>VimtexCompile<CR>", desc = "LaTeX Compile" },
      { "<leader>tv", "<cmd>VimtexView<CR>", desc = "LaTeX View PDF" },
      { "<leader>tk", "<cmd>VimtexStop<CR>", desc = "Stop Compilation" },
      { "<leader>tx", "<cmd>VimtexClean<CR>", desc = "Clean Aux Files" },
      { "<leader>tg", "zg", desc = "Add to Dictionary" },
      { "<leader>tw", "zw", desc = "Mark as Incorrect" },
      { "<leader>tn", "]s", desc = "Next Spell Error" },
      { "<leader>tp", "[s", desc = "Prev Spell Error" },
      { "<leader>tz", "z=", desc = "Suggest Fixes" },

      -- Surround group under g prefix
      --{ "gs", group = "surround" },
      --{ "gsa", "gsa", desc = "Add surround" },
      --{ "gsd", "gsd", desc = "Delete surround" },
      --{ "gsr", "gsr", desc = "Replace surround" },
      --{ "gsf", "gsf", desc = "Find → surround" },
      ---{ "gsF", "gsF", desc = "Find ← surround" },
      --{ "gsh", "gsh", desc = "Highlight surround" },
      --{ "gsn", "gsn", desc = "Adjust search size" },
    },
  },
}
