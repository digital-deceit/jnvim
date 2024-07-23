return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{ "<leader>nt", "<cmd>Neotree toggle<cr>", desc = "Toggle NeoTree" },
	},
	opts = {
		window = {
			position = "right",
			width = 35,
		},
		filesystem = {
			hide_dotfiles = false,
			hide_gitignored = false,
			hide_hidden = false,
		},
	},
}
