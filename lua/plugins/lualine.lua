return {
  {
    "nvim-lualine/lualine.nvim",
    -- Only configure additional segments, keep LazyVim defaults
    opts = function(_, opts)
      -- ── 1) Remove the default clock in section Z ────────────────
      opts.sections.lualine_z = {}

      -- ── 2) Add connected LSP servers in section C (after diagnostics) ─
      table.insert(opts.sections.lualine_c, 2, {
        function()
          local clients = vim.lsp.get_active_clients({ bufnr = 0 })
          if vim.tbl_isempty(clients) then
            return ""
          end
          local names = vim.tbl_map(function(c)
            return c.name
          end, clients)
          return " " .. table.concat(names, ",")
        end,
        color = { fg = "#8ec07c", gui = "bold" },
        padding = { left = 1, right = 1 },
      })

      -- ── 3) Add Treesitter context via nvim-navic if available ───────
      if package.loaded["nvim-navic"] then
        table.insert(opts.sections.lualine_c, 3, {
          function()
            return require("nvim-navic").get_location()
          end,
          cond = function()
            return require("nvim-navic").is_available()
          end,
          color = { fg = "#fabd2f" },
          padding = { left = 1, right = 1 },
        })
      end

      -- ── 4) Add macro recording status in section B ─────────────────
      table.insert(opts.sections.lualine_b, {
        function()
          return require("lualine.components.recording").recording()
        end,
        cond = function()
          return vim.fn.reg_recording() ~= ""
        end,
        color = { fg = "#d3869b" },
        padding = { left = 1, right = 1 },
      })

      return opts
    end,
  },
}
