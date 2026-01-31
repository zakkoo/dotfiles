-- C# debugging with vsdbg authentication support.

return {
  "Cliffback/netcoredbg-macOS-arm64.nvim",
  dependencies = { "mfussenegger/nvim-dap" },
  config = function()
    local dap = require("dap")

    -- This plugin provides netcoredbg with ARM64 support
    require("netcoredbg-macOS-arm64").setup(dap)

    -- Configure C# debugging
    dap.configurations.cs = {
      {
        type = "coreclr",
        name = "Launch",
        request = "launch",
        program = function()
          return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
        end,
        cwd = vim.fn.getcwd(),
      },
      {
        type = "coreclr",
        name = "Attach",
        request = "attach",
        processId = require("dap.utils").pick_process,
      },
    }
  end,
}
