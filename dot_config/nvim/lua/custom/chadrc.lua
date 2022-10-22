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
  },
  override = {
    ["NvChad/nvterm"] = {
      terminals = {
        type_opts = {
          float = {
            row = 0.35,
            col = 0.4,
            width = 0.6,
            height = 0.6,
          },
          horizontal = { location = "rightbelow", split_ratio = .7, },
          vertical = { location = "rightbelow", split_ratio = .5 },
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
