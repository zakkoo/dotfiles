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

    local function configure_adapter(adapter_name, setup_adapter)
      local ok_registry, registry = pcall(require, "mason-registry")
      if not ok_registry or not registry.has_package(adapter_name) then
        return
      end

      local adapter = registry.get_package(adapter_name)
      if adapter:is_installed() then
        setup_adapter(adapter)
        return
      end

      adapter:install()
      adapter:once("install:success", function()
        setup_adapter(adapter)
      end)
    end

    require("mason-nvim-dap").setup({
      ensure_installed = { "netcoredbg", "js-debug-adapter" },
      automatic_setup = true,
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

    -- C# debugging with netcoredbg.
    dap.configurations.cs = {
      {
        type = "netcoredbg",
        name = "Launch - netcoredbg",
        request = "launch",
        program = function()
          return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
        end,
      },
    }

    -- Node.js debugging for JS/TS.
    configure_adapter("js-debug-adapter", function(js_debug_adapter)
      if type(js_debug_adapter.get_install_path) ~= "function" then
        return
      end

      local install_path = js_debug_adapter:get_install_path()
      if install_path == nil or install_path == "" then
        return
      end

      dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          args = {
            install_path .. "/js-debug/src/dapDebugServer.js",
            "${port}",
          },
        },
      }
    end)

    dap.configurations.javascript = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
        sourceMaps = true,
      },
    }

    dap.configurations.typescript = dap.configurations.javascript
  end,
}
