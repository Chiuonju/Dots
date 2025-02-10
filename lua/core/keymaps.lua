-- <leader> = <Space>
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Command to toggle inline diagnostics
vim.api.nvim_create_user_command('DiagnosticsToggleVirtualText', function()
    local current_value = vim.diagnostic.config().virtual_text
    if current_value then
        vim.diagnostic.config { virtual_text = false }
    else
        vim.diagnostic.config { virtual_text = true }
    end
end, {})

-- Disabling <Space> in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

local opts = { noremap = true, silent = true }

-- Delete a single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts)

-- Vertical scroll and enter
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Clear search highlight
vim.keymap.set('n', '<leader>hl', '<cmd>nohlsearch<CR>', opts)

-- Resize
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>x', ':bdelete!<CR>', opts)
vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', opts)

-- Window Management
vim.keymap.set('n', '<leader>v', '<C-w>v', opts)
vim.keymap.set('n', '<leader>h', '<C-w>s', opts)
vim.keymap.set('n', '<leader>se', '<C-w>=', opts)
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts)

-- Line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Yanking
vim.keymap.set('v', 'p', '"_dP', opts)

-- Diagnostic
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts)

-- Navigating
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Select all
vim.keymap.set('n', '<C-a>', 'ggVG', opts)
-- Copy to system clipboard
vim.keymap.set('v', '<C-c>', ':y+<CR>', opts)
-- Paste
vim.keymap.set('n', '<leader>cc', '"+p', opts)
-- Save
vim.keymap.set('n', '<C-s>', ':w<CR>', opts)

-- Keybinding to toggle inline diagnostics (ii)
vim.keymap.set('n', '<Leader>ii', function()
    vim.cmd 'DiagnosticsToggleVirtualText'
end, { noremap = true, silent = true, desc = 'Toggle inline diagnostics' })
