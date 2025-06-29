-- ~/.config/nvim/lua/config/diagnostics.lua
local M = {}

local show_warnings = false

local function set_diag(show)
  local min_sev = show and vim.diagnostic.severity.WARN or vim.diagnostic.severity.ERROR
  vim.diagnostic.config({
    severity_sort = true,
    underline = true,
    update_in_insert = false,
    signs = true,
    virtual_text = {
      prefix = "● ",
      source = "if_many",
      severity = { min = min_sev },
      format = function(d)
        local code = d.code or (d.user_data and d.user_data.lsp and d.user_data.lsp.code)
        return code and (d.message .. " [" .. code .. "]") or d.message
      end,
    },
    float = {
      border = "rounded",
      source = true,
      severity = { min = vim.diagnostic.severity.HINT },
    },
  })
end

function M.toggle()
  show_warnings = not show_warnings
  set_diag(show_warnings)
  vim.notify("Diagnostics: " .. (show_warnings and "Errors + Warnings" or "Errors only"))
end

-- default to errors only
set_diag(false)

return M
