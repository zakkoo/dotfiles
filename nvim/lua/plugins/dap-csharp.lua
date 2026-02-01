-- C# debugging with vsdbg authentication support.

return {
  "Cliffback/netcoredbg-macOS-arm64.nvim",
  dependencies = { "mfussenegger/nvim-dap", "nvim-telescope/telescope.nvim" },
  config = function()
    local dap = require("dap")

    -- This plugin provides netcoredbg with ARM64 support
    require("netcoredbg-macOS-arm64").setup(dap)

    -- Helper function to build the C# project
    local function build_project(clean)
      if clean then
        vim.notify("Cleaning and building C# project...", vim.log.levels.INFO)
        vim.fn.system("dotnet clean")
      else
        vim.notify("Building C# project...", vim.log.levels.INFO)
      end

      local result = vim.fn.system("dotnet build")
      local exit_code = vim.v.shell_error

      if exit_code ~= 0 then
        vim.notify("Build failed:\n" .. result, vim.log.levels.ERROR)
        return false
      end

      vim.notify("Build successful!", vim.log.levels.INFO)
      return true
    end

    -- Helper function to find DLL files in bin directories
    local function find_dlls()
      local dlls = {}
      local cwd = vim.fn.getcwd()

      -- Search patterns for DLL files
      local patterns = {
        cwd .. "/bin/Debug/**/*.dll",
        cwd .. "/bin/Release/**/*.dll",
        cwd .. "/**/bin/Debug/**/*.dll",
        cwd .. "/**/bin/Release/**/*.dll",
      }

      for _, pattern in ipairs(patterns) do
        local files = vim.fn.glob(pattern, false, true)
        for _, file in ipairs(files) do
          if not vim.tbl_contains(dlls, file) then
            table.insert(dlls, file)
          end
        end
      end

      return dlls
    end

    -- Function to pick DLL using Telescope
    local function pick_dll()
      local dlls = find_dlls()

      if #dlls == 0 then
        vim.notify("No DLL files found in bin/Debug or bin/Release", vim.log.levels.ERROR)
        return nil
      end

      if #dlls == 1 then
        return dlls[1]
      end

      -- Use coroutine for async Telescope picker
      local co = coroutine.running()

      local pickers = require("telescope.pickers")
      local finders = require("telescope.finders")
      local conf = require("telescope.config").values
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")

      pickers
        .new({}, {
          prompt_title = "Select DLL to Debug",
          finder = finders.new_table({
            results = dlls,
            entry_maker = function(entry)
              local display = entry:gsub(vim.fn.getcwd() .. "/", "")
              return {
                value = entry,
                display = display,
                ordinal = display,
              }
            end,
          }),
          sorter = conf.generic_sorter({}),
          attach_mappings = function(prompt_bufnr)
            actions.select_default:replace(function()
              actions.close(prompt_bufnr)
              local selection = action_state.get_selected_entry()
              coroutine.resume(co, selection and selection.value or nil)
            end)
            return true
          end,
        })
        :find()

      return coroutine.yield()
    end

    -- Configure C# debugging
    dap.configurations.cs = {
      {
        type = "coreclr",
        name = "Launch",
        request = "launch",
        program = function()
          -- Build project before debugging
          if not build_project() then
            return nil
          end
          -- Wait a moment for filesystem to sync
          vim.wait(500)
          return pick_dll()
        end,
        cwd = vim.fn.getcwd(),
      },
      {
        type = "coreclr",
        name = "Launch (clean build)",
        request = "launch",
        program = function()
          -- Clean and build project before debugging
          if not build_project(true) then
            return nil
          end
          vim.wait(500)
          return pick_dll()
        end,
        cwd = vim.fn.getcwd(),
      },
      {
        type = "coreclr",
        name = "Launch (no build)",
        request = "launch",
        program = function()
          return pick_dll()
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
