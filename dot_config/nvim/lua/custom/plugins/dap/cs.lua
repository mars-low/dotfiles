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
    -- console = "integratedConsole",
    program = function()
      return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/src/renode/output/bin/Debug/net6.0/Renode.dll', 'file')
    end,
    -- args = { '--disable-xwt' },
    args = function()
        local args = {}
        local args_string = vim.fn.input('Args: ')
        for word in args_string:gmatch("%S+") do
          table.insert(args, word)
        end
        return args
    end,
  },
  {
    type = 'coreclr';
    name = 'attach - netcoredbg';
    request = 'attach';
    processId = require('dap.utils').pick_process,
  },
}

return M
