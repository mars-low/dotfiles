local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  theme = "vscode_dark",
}

M.plugins = {
  user = {
    ["goolord/alpha-nvim"] = {
      disable = false,
    },
    ['folke/which-key.nvim'] = {
      disable = false
    },
    ["neovim/nvim-lspconfig"] = {
      config = function()
        require "plugins.configs.lspconfig"
        require "custom.plugins.lspconfig"
      end,
    },
    ["github/copilot.vim"] = {},
    ["lewis6991/gitsigns.nvim"] = {},
    ["nvim-treesitter/nvim-treesitter-context"] = require "custom.plugins.nvim_treesitter_context",
    ["mfussenegger/nvim-dap"] = require "custom.plugins.nvim_dap",
    ["rcarriga/nvim-dap-ui"] = require "custom.plugins.nvim_dap_ui",
    ["nvim-telescope/telescope-dap.nvim"] = require "custom.plugins.telescope_dap_nvim"
  },
  ["theHamsta/nvim-dap-virtual-text"] = require "custom.plugins.nvim_dap_virtual_text",
  override = {
    ["NvChad/nvterm"] = {
      terminals = {
        type_opts = {
          float = {
            row = 0.15,
            col = 0.2,
            width = 0.85,
            height = 0.8,
          },
          horizontal = { location = "rightbelow", split_ratio = .7, },
          vertical = { location = "rightbelow", split_ratio = .9 },
        },
      },
    },
    ["williamboman/mason.nvim"] = {
      ensure_installed = {
        "omnisharp",
      },
    },
  },
}

M.mappings = require "custom.mappings"

return M
