return {
	"echasnovski/mini.nvim",
	event = "VeryLazy",
	version = false,
	config = function()
		require("mini.surround").setup()

		require("mini.move").setup()

		require("mini.ai").setup()
	end,
}
