return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
		{ "theHamsta/nvim-dap-virtual-text", opts = {} },
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")

		dapui.setup()
	end,
}
