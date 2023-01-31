local M = {}

M.requires = { "mfussenegger/nvim-dap" }
M.wants = "nvim-dap"
M.after = "nvim-dap"

M.setup = function()
  local api = vim.api
  api.nvim_create_user_command("DapUiOpen", ":lua require'dapui'.open()", {})
  api.nvim_create_user_command("DapUiClose", ":lua require'dapui'.close()", {})
  api.nvim_create_user_command("DapUiToggle", ":lua require'dapui'.toggle()", {})
  api.nvim_create_user_command("DapUiFloatElement", ":lua require'dapui'.float_element()", {})
  api.nvim_create_user_command("DapUiEval", ":lua require'dapui'.eval()", {})
end

M.config = function()
  local dap, dapui = require('dap'), require('dapui')
  local api = vim.api
  local keymap_restore = {}
  dap.listeners.after.event_initialized['dapui_config'] = function()
    dapui.open()

    for _, buf in pairs(api.nvim_list_bufs()) do
      local keymaps = api.nvim_buf_get_keymap(buf, 'n')
      for _, keymap in pairs(keymaps) do
        if keymap.lhs == "K" then
          table.insert(keymap_restore, keymap)
          api.nvim_buf_del_keymap(buf, 'n', 'K')
        end
      end
    end
    api.nvim_set_keymap(
      'n', 'K', '<Cmd>lua require("dap.ui.widgets").hover()<CR>', { silent = true })
  end

  dap.listeners.after.event_terminated['dapui_config'] = function()
    for _, keymap in pairs(keymap_restore) do
      api.nvim_buf_set_keymap(
        keymap.buffer,
        keymap.mode,
        keymap.lhs,
        keymap.rhs,
        { silent = keymap.silent == 1 }
      )
    end
    keymap_restore = {}
    dapui.close()
  end

  dap.listeners.after.event_exited['dapui_config'] = function()
    dapui.close()
  end

  dapui.setup()
end

return M

