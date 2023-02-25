-- load your options globals, autocmds here or anything .__.
-- you can even override default options here (core/options.lua)
vim.api.nvim_set_keymap("i", "<F2>", 'copilot#Accept("<CR>")', { expr = true, noremap = true })

vim.api.nvim_set_var("copilot_filetypes", {
  ["dap-repl"] = false,
  ["dapui_watches"] = false,
  ["dapui_stacks"] = false,
  ["dapui_scopes"] = false,
  ["dapui_hover"] = false,
  ["dapui_console"] = false,
  ["dapui_breakpoints"] = false,
})
