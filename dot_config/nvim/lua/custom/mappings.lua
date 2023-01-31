-- lua/custom/mappings 
local M = {}

M.general = {
	n = {
		["<leader>q"] = { ":q! <CR>", "  exit nvchad" },
		["<leader>te"] = { ":Telescope <CR>", "  open telescope options" },
		["<leader>mt"] = {
			function()
        require("nvterm.terminal").send("TMUX= tmux new-session -A -D -s $PWD/fterm", "float")
        require("nvterm.terminal").send("TMUX= tmux new-session -A -D -s $PWD/hterm", "horizontal")
        require("nvterm.terminal").send("TMUX= tmux new-session -A -D -s $PWD/vterm", "vertical")

        require("nvterm.terminal").send("if [[ $(tmux display-message -p '#S') == $PWD/fterm ]]; then tmux set prefix C-a ; else ; fi", "float")
        require("nvterm.terminal").send("if [[ $(tmux display-message -p '#S') == $PWD/hterm ]]; then tmux set prefix C-a; else ; fi", "horizontal")
        require("nvterm.terminal").send("if [[ $(tmux display-message -p '#S') == $PWD/vterm ]]; then tmux set prefix C-a; else ; fi", "vertical")
			end,
			"   Toggle binding to tmux session",
		},
	},
}

M.nvimtree = {
  n = {
    ["<leader>e"] = {"<cmd> NvimTreeToggle <CR>", "   toggle nvimtree"}
  }
}

M.dap = {
    n = {
        ["<F5>"] = { "<CMD>DapContinue<CR>", "start/continue debugging"},
        ["<leader>pc"] = { "<CMD>DapContinue<CR>", "start/continue debugging"},
        ["<leader>pR"] = { "<CMD>DapRestart<CR>", "restart debugging"},
        ["<F10>"] = { "<CMD>DapStepOver<CR>", "step over next instruction while debugging"},
        ["<leader>pn"] = { "<CMD>DapStepOver<CR>", "step over next instruction while debugging"},
        ["<F11>"] = { "<CMD>DapStepIlnlto<CR>", "step into next instruction while debugging"},
        ["<leader>pi"] = { "<CMD>DapStepInto<CR>", "step into next instruction while debugging"},
        ["<F12>"] = { "<CMD>DapStepOut<CR>", "step out of current scope while debugging"},
        ["<S-F5>"] = { "<CMD>DapTerminate<CR>", "terminate debugging"},
        ["<leader>pQ"] = { "<CMD>DapTerminate<CR>", "terminate process while debugging"},
        ["<leader>pq"] = { "<CMD>DapClose<CR>", "close process while debugging"},
        ["<leader>po"] = { "<CMD>DapStepOut<CR>", "step out of current scope while debugging"},
        ["<leader>pp"] = { "<CMD>DapStepBack<CR>", "step back to previous instruction while debugging"},
        ["<leader>pP"] = { "<CMD>DapPause<CR>", "pause debugger while debugging"},
        ["<leader>pg"] = { "<CMD>DapGotoCurrentLine<CR>", "go to current liner while debugging"},
        ["<leader>pbb"] = { "<CMD>DapToggleBreakpoint<CR>", "toggle breakpoint"},
        ["<leader>pbc"] = { "<CMD>DapSetConditionalBreakpoint<CR>", "set breakpoint with condition" },
        ["<leader>pbB"] = { "<CMD>DapSetLogBreakpoint<CR>", "set breakpoint with log point message" },
        ["<leader>pbl"] = { "<CMD>DapListBreakpoints<CR>", "list breakpoints" },
        ["<leader>pbx"] = { "<CMD>DapClearBreakpoints<CR>", "clear breakpoints"},
        ["<leader>pe"] = { "<CMD>DapToggleMiniRepl<CR>", "toggle repl environment"},
        ["<leader>pl"] = { "<CMD>DapShowMiniLog<CR>", "show dap log"},
        ["<leader>pu"] = { "<CMD>DapUiToggle<CR>", "toggle dap ui"},
        ["<leader>pf"] = { "<CMD>DapUiFloatElement<CR>", "open floated element"},
        ["<leader>pE"] = { "<CMD>DapUiEval<CR>", "evaludate selected expression while debugging"},
    }
}

return M

