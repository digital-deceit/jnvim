return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = {
		{ "\\", "<CMD>Neotree toggle<CR>", desc = "NeoTree Toggle" },
	},
	opts = {
		window = {
			position = "right",
			width = 35,
			mappings = {
				["\\"] = "close_window",
			},
		},
		filesystem = {
			hide_dotfiles = false,
			hide_gitignored = false,
			hide_hidden = false,
		},
	},
}
