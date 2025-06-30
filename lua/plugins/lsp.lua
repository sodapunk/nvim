-- lua/config/overrides/pyright.lua
-- Override Pyright settings while preserving LazyVim's default on_attach and capabilities
print("✅ Loaded pyright override")

local util = require("lspconfig.util")
local Path = util.path

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          -- Dynamically set the Python interpreter for Pyright
          on_init = function(client, _)
            local python = (vim.env.CONDA_PREFIX and Path.join(vim.env.CONDA_PREFIX, "bin", "python"))
              or (vim.env.VIRTUAL_ENV and Path.join(vim.env.VIRTUAL_ENV, "bin", "python"))
              or "python"
            client.config.settings.python = client.config.settings.python or {}
            client.config.settings.python.pythonPath = python
            print("🐍 Using Python: ", python)
          end,
          -- Determine project root based on common Python files or Git
          root_dir = function(fname)
            local root = util.root_pattern("pyproject.toml", "setup.py", "environment.yml", ".git")(fname)
            print("📁 Detected project root: ", root or "nil")
            return root or util.path.dirname(fname)
          end,
          -- Pyright-specific settings
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
      },
    },
  },
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    cmd = "Neogen",
    keys = { { "<leader>ld", "<cmd>Neogen<cr>", desc = "Generate doc comment" } },
    opts = { snippet_engine = "luasnip" },
    config = function(_, opts)
      require("neogen").setup(opts)
    end,
  },
}
