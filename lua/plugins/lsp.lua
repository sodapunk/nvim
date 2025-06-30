print("✅ Loaded basedpyright override")

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = "basic", -- or "strict"
                diagnosticMode = "workspace",
                docstringExtraction = true,
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                inlayHints = {
                  variableTypes = true,
                  functionReturnTypes = true,
                  callArgumentNames = true,
                },
              },
            },
          },
          root_dir = function(fname)
            local util = require("lspconfig.util")
            local root = util.root_pattern("pyproject.toml", "setup.py", "environment.yml", ".git")(fname)
            print("📁 Detected project root: ", root or "nil")
            return root or util.path.dirname(fname)
          end,
          on_init = function(client)
            local path = require("lspconfig.util").path
            local python = vim.env.CONDA_PREFIX and path.join(vim.env.CONDA_PREFIX, "bin", "python")
              or (vim.env.VIRTUAL_ENV and path.join(vim.env.VIRTUAL_ENV, "bin", "python"))
              or "python"
            print("🐍 Using Python: ", python)
            client.config.settings = client.config.settings or {}
            client.config.settings.basedpyright = client.config.settings.basedpyright or {}
            client.config.settings.basedpyright.pythonPath = python
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
