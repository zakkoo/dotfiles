-- Debug Adapter Protocol.

return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-neotest/nvim-nio",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- Enable DAP logging for debugging
    dap.set_log_level("DEBUG")

    require("mason-nvim-dap").setup({
      ensure_installed = { "js-debug-adapter" },
      automatic_setup = false,
    })

    dapui.setup()
    require("nvim-dap-virtual-text").setup({})

    -- Open and close DAP UI automatically.
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    -- Language-specific configurations loaded via separate plugin files
    -- C# config is in dotnet-debug.lua
    -- require("plugins.dap.javascript")  -- Disabled for now, only using C#
  end,
}
