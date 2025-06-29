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

        ltex = {
          filetypes = { "markdown", "tex", "bib", "text" },
          settings = {
            ltex = {
              java = {
                path = "/usr/lib/jvm/java-17-openjdk/bin/java",
              },
              language = "en-GB",
              additionalRules = {
                enablePickyRules = true,
                motherTongue = "en",
              },
              dictionary = {
                ["en-GB"] = { "Neovim", "LazyVim", "Lua", "thesis" },
              },
            },
          },
        },
      },
      setup = {
        -- Instead of calling ltex_extra directly here...
        ltex = function(_, opts)
          -- Create an autocommand to detect when LTeX attaches
          vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
              local client = vim.lsp.get_client_by_id(args.data.client_id)
              if client and client.name == "ltex" then
                -- Safe to initialize ltex_extra now
                require("ltex_extra").setup({
                  load_langs = { "en-GB" },
                  init_check = true,
                  path = vim.fn.stdpath("config") .. "/spell",
                  log_level = "info",
                })
              end
            end,
          })
        end,
      },
    },
  },
}
