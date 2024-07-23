return {
	"MeanderingProgrammer/markdown.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
	config = function()
		local render_md = require("render-markdown")
		render_md.setup({})

		vim.keymap.set("n", "<leader>rm", render_md.toggle, { desc = "[R]ender [M]arkdown Toggle" })
	end,
}
