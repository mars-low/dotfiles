local M = {}

M.adapter = {
  type = 'executable';
  command = '/home/ant/netcoredbg/netcoredbg';
  args = { '--interpreter=vscode' };
}

M.configuration = {
  {
    type = 'coreclr';
    name = 'launch - netcoredbg';
    request = 'launch';
    program = function()
      return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/src/renode/output/bin/Debug/net6.0/', 'file')
    end,
    console = 'internalConsole',
  },
  {
    type = 'coreclr';
    name = 'attach - netcoredbg';
    request = 'attach';
    processId = require('dap.utils').pick_process,
  },
}

return M
