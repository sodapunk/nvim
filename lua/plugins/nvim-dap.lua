-- lua/plugins/dap.lua
return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio", --  Required for dap-ui
      "mfussenegger/nvim-dap-python", -- Optional, for Python
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- Optional: Python DAP adapter, update path if needed
      local python_path = os.getenv("CONDA_PREFIX") and (os.getenv("CONDA_PREFIX") .. "/bin/python") or "python"
      require("dap-python").setup(python_path)

      -- Setup UI and virtual text
      dapui.setup()
      require("nvim-dap-virtual-text").setup()

      -- Auto-open/close UI
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
}
