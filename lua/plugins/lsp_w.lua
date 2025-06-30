-- This print helps confirm that LazyVim is actually loading this file
print("✅ Loaded pyright override")

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          -- LSP-specific settings passed to pyright
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic", -- or "strict" / "off"
                autoSearchPaths = true, -- allow pyright to resolve imports from sys.path
                diagnosticMode = "workspace", -- analyze whole project, not just open files
                useLibraryCodeForTypes = true, -- allow type inference from .py files in libs
              },
            },
          },

          -- ✅ This function explicitly tells pyright how to determine the "project root"
          -- It will look for the first parent folder that contains one of these markers
          root_dir = function(fname)
            local util = require("lspconfig.util")
            -- Try to find .git or a common Python project file
            local root = util.root_pattern("pyproject.toml", "setup.py", "environment.yml", ".git")(fname)
            print("📁 Detected project root: ", root or "nil") -- for debugging
            return root or util.path.dirname(fname) -- fallback: use current file's directory
          end,

          -- ✅ This function sets the Python interpreter path for pyright
          -- It checks for a conda env first, then venv, then defaults to 'python'
          on_init = function(client)
            local path = require("lspconfig.util").path
            local python = vim.env.CONDA_PREFIX and path.join(vim.env.CONDA_PREFIX, "bin", "python")
              or (vim.env.VIRTUAL_ENV and path.join(vim.env.VIRTUAL_ENV, "bin", "python"))
              or "python"

            print("🐍 Using Python: ", python) -- for debugging

            -- Apply the interpreter path to pyright's runtime settings
            client.config.settings = client.config.settings or {}
            client.config.settings.python = client.config.settings.python or {}
            client.config.settings.python.pythonPath = python
          end,
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
