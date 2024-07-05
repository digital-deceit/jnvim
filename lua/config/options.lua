-- Sets Space as mapleader keymap
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Displays number of lines
vim.opt.number = true
-- Displays number of lines relative to current line
vim.opt.relativenumber = true
-- Displays sign column
vim.opt.signcolumn = "yes"
-- Enables mouse support
vim.opt.mouse = "a"
-- Changes how text is displayed
vim.opt.wrap = false
-- Wrapped line will continue idented
vim.opt.breakindent = true
-- Enable undo history
vim.opt.undofile = true
-- Ignore case in search pattern
vim.opt.ignorecase = true
-- Overrides 'ignorecase' if search contains upper case
vim.opt.smartcase = true
-- If nothing is typed during that time swap file gets written
vim.opt.updatetime = 250
-- Time in milliseconds to wait for a mapped sequenc
vim.opt.timeout = true
vim.opt.timeoutlen = 1000
-- Reads file again when changed outside Neovim
vim.opt.autoread = true
-- Shows search pattern in realtime
vim.opt.inccommand = "split"
-- Force vertical split to the right
vim.opt.splitright = true
-- Force horizontal split below
vim.opt.splitbelow = true
-- Highlights all matches on previous search
vim.opt.hlsearch = true
-- Highlights the text line of the cursor
vim.opt.cursorline = true
-- Keeps lines visible around the cursor
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
-- Enables 24-bit RGB color in the TUI
vim.opt.termguicolors = true
-- Enables list mode characters
vim.opt.list = true
vim.opt.listchars = { eol = "↵", tab = "▎ ", trail = "·", nbsp = "␣" }
-- Enables clipboard register +
vim.opt.clipboard = "unnamedplus"
-- Sets a custom clipboard
vim.g.clipboard = {
	name = "WslClipboard",
	copy = {
		["+"] = "clip.exe",
		["*"] = "clip.exe",
	},
	paste = {
		["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
		["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
	},
	cache_enabled = 0,
}
-- Disables backup file
vim.opt.backup = false
