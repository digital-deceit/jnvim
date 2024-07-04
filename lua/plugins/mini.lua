return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		local mini_surround = require("mini.surround")
		mini_surround.setup({})

		local mini_move = require("mini.move")
		mini_move.setup({})

		local mini_notify = require("mini.notify")
		mini_notify.setup({})
	end,
}
