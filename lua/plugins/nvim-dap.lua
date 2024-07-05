return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		{ "theHamsta/nvim-dap-virtual-text", opts = {} },
	},
	config = function()
		-- DAP UI setup
		local dapui = require("dapui")

		dapui.setup()

		vim.keymap.set("n", "<leader>de", dapui.eval, { desc = "[D]ap UI [E]val" })
		vim.keymap.set("n", "<leader>do", dapui.open, { desc = "[D]ap UI [O]pen" })
		vim.keymap.set("n", "<leader>dc", dapui.close, { desc = "[D]ap UI [C]lose" })
		vim.keymap.set("n", "<leader>dt", dapui.toggle, { desc = "[D]ap UI [T]oggle" })
		vim.keymap.set("n", "<leader>df", dapui.float_element, { desc = "[D]ap UI [F]loat Element" })

		-- DAP setup
		local dap = require("dap")

		vim.keymap.set("n", "<F1>", dap.continue, { desc = "[F1] Continue" })
		vim.keymap.set("n", "<F2>", dap.step_over, { desc = "[F2] Step Over" })
		vim.keymap.set("n", "<F3>", dap.step_into, { desc = "[F3] Step Into" })
		vim.keymap.set("n", "<F4>", dap.step_out, { desc = "[F4] Step Out" })
		vim.keymap.set("n", "<leader>dB", dap.toggle_breakpoint, { desc = "[T]oggle [B]reakpoint" })
		vim.keymap.set("n", "<leader>B", dap.set_breakpoint, { desc = "[B]reakpoint" })
		-- vim.keymap.set("n", "<Leader>lp", dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: ")))
		vim.keymap.set("n", "<leader>dr", dap.repl.open)
		vim.keymap.set("n", "<leader>dl", dap.run_last)
		-- vim.keymap.set({ "n", "v" }, "<Leader>dh", require("dap.ui.widgets").hover())
		-- vim.keymap.set({ "n", "v" }, "<Leader>dp", require("dap.ui.widgets").preview())
		-- vim.keymap.set("n", "<leader>df", function()
		-- 	local widgets = require("dap.ui.widgets")
		-- 	widgets.centered_float(widgets.frames)
		-- end)
		-- vim.keymap.set("n", "<leader>ds", function()
		-- 	local widgets = require("dap.ui.widgets")
		-- 	widgets.centered_float(widgets.scopes)
		-- end)
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
	end,
}
