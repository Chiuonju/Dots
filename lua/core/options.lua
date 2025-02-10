
-- Line numbers
vim.wo.number = true

-- Relative numbered lines
vim.o.relativenumber = true

-- Clipboard
vim.o.clipboard = 'unnamedplus'

-- Word wrap
vim.o.wrap = false

-- Linebreak
vim.o.linebreak = true

-- Mouse display
vim.o.mouse = 'a'

-- Auto indent
vim.o.autoindent = true
vim.o.smartindent = true

-- Case searching
vim.o.ignorecase = true
vim.o.smartcase = true

-- Indentation
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.breakindent = true

-- Minimalizing Screen lines
vim.o.scrolloff = 4

-- Minimalizing Screen columns
vim.o.sidescrolloff = 8

-- Highlighting the current line
vim.o.cursorline = false

-- Spliting windows
vim.o.splitbelow = true
vim.o.splitright = true

-- Search highlighting
vim.o.hlsearch = true

-- Showing modes
vim.o.showmode = false

-- Setting termguicolors
vim.opt.termguicolors = true

-- Travelling keys to next/prev lines
vim.o.whichwrap = 'bs<>hl'

-- Number column width
vim.o.numberwidth = 4

-- Swaping file
vim.o.swapfile = false

-- Showing tabs
vim.o.showtabline = 2

-- Backspacing on
vim.o.backspace = 'indent,eol,start'

-- Menu height
vim.o.pumheight = 10

-- Conceal level
vim.o.conceallevel = 0

-- Sign Column
vim.wo.signcolumn = 'yes'

-- File encoding
vim.o.fileencoding = 'utf-8'

-- Neovim command line height
vim.o.cmdheight = 1

-- Update time
vim.o.updatetime = 250

-- Waiting time for a mapped sequence to complete
vim.o.timeoutlen = 300

-- Backup files
vim.o.backup = false
vim.o.writebackup = false

-- Undo history
vim.o.undofile = true

-- Completion
vim.o.completeopt = 'menuone,noselect'

-- Messages
vim.opt.shortmess:append 'c'

-- 
