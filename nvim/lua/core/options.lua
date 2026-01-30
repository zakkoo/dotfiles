-- Core editor options for a comfortable baseline.

local opt = vim.opt

opt.number = false -- Use statuscolumn for absolute line numbers.
opt.relativenumber = true -- Enable relative numbers for statuscolumn.
opt.tabstop = 4 -- Number of spaces a tab counts for.
opt.shiftwidth = 4 -- Number of spaces to use for autoindent.
opt.expandtab = true -- Use spaces instead of tabs.
opt.smartindent = true -- Smart auto-indenting.
opt.list = true -- Show whitespace characters.
opt.listchars = {
  tab = "▸ ",
  trail = "·",
  extends = "»",
  precedes = "«",
  nbsp = "␣",
} -- Define whitespace symbols.
opt.statuscolumn = "%s %=%{v:lnum}│%{v:relnum} " -- Show absolute + relative line numbers.
opt.wrap = false -- Disable line wrapping.
opt.termguicolors = true -- Enable true color support.
opt.signcolumn = "yes" -- Always show sign column.
opt.cursorline = true -- Highlight the current line.
opt.splitright = true -- Vertical splits open to the right.
opt.splitbelow = true -- Horizontal splits open below.
opt.ignorecase = true -- Ignore case when searching...
opt.smartcase = true -- ...unless the search contains uppercase.
opt.updatetime = 300 -- Faster completion.
opt.timeoutlen = 400 -- Shorter mapped sequence wait time.
opt.clipboard = "unnamedplus" -- System clipboard for yank/paste operations.

vim.g.mapleader = " " -- Set <leader> to space.
vim.g.maplocalleader = " " -- Set <localleader> to space.
