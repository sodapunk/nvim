return {
  "folke/which-key.nvim",
  opts = {
    defaults = {
      -- Terminal group
      ["<leader>T"] = {
        name = "+terminal",
        n = { "<cmd>FloatermNew<CR>", "New terminal" },
        t = { "<cmd>FloatermToggle<CR>", "Toggle terminal" },
        p = { "<cmd>FloatermPrev<CR>", "Previous terminal" },
        x = { "<cmd>FloatermKill<CR>", "Close terminal" },
      },

      -- Diagnostics and DAP group
      ["<leader>d"] = {
        name = "+diagnostics",
        t = {
          function()
            require("config.diagnostics").toggle()
          end,
          "Toggle Warnings",
        },
        b = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle Breakpoint" },
        c = { "<cmd>lua require'dap'.continue()<CR>", "Start/Continue" },
        s = { "<cmd>lua require'dap'.step_over()<CR>", "Step Over" },
        i = { "<cmd>lua require'dap'.step_into()<CR>", "Step Into" },
        o = { "<cmd>lua require'dap'.step_out()<CR>", "Step Out" },
        r = { "<cmd>lua require'dap'.repl.open()<CR>", "Open REPL" },
        u = { "<cmd>lua require'dapui'.toggle()<CR>", "Toggle DAP UI" },
      },

      -- Text group: documents (Markdown, LaTeX)
      ["<leader>t"] = {
        name = "+text",

        -- Markdown tools
        m = { "<cmd>MarkdownPreview<CR>", "Markdown Preview" },
        s = { "<cmd>MarkdownPreviewStop<CR>", "Stop Preview" },

        -- LaTeX via vimtex
        c = { "<cmd>VimtexCompile<CR>", "LaTeX Compile" },
        v = { "<cmd>VimtexView<CR>", "LaTeX View PDF" },
        k = { "<cmd>VimtexStop<CR>", "Stop Compilation" },
        x = { "<cmd>VimtexClean<CR>", "Clean Aux Files" },

        -- Spell checking tools
        g = { "zg", "Add to Dictionary" },
        w = { "zw", "Mark as Incorrect" },
        n = { "]s", "Next Spell Error" },
        p = { "[s", "Prev Spell Error" },
        z = { "z=", "Suggest Fixes" },
      },

      -- Surround group (uses <leader>s* mappings)
      ["g"] = {
        s = {
          name = "+surround",
          a = { "gsa", "Add surround" },
          d = { "gsd", "Delete surround" },
          r = { "gsr", "Replace surround" },
          f = { "gsf", "Find → surround" },
          F = { "gsF", "Find ← surround" },
          h = { "gsh", "Highlight surround" },
          n = { "gsn", "Adjust search size" },
        },
      },
    },
  },
}
