local dap = require('dap')

-- Get the install path dynamically
local mason_registry = require("mason-registry")
local netcoredbg_path = mason_registry.get_package("netcoredbg"):get_install_path()

dap.adapters.coreclr = {
  type = 'executable',
  command = vim.fn.stdpath('data') .. '/mason/packages/netcoredbg/netcoredbg',
  args = { '--interpreter=vscode' }
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to DLL: ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = false,
    console = "integratedTerminal",
  },
}
