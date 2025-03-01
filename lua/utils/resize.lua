local M = {}

-- Window layout functions
M.window_layouts = {}

M.window_layouts.SetupCustomLayoutForCPP = function()
    vim.cmd 'vsplit'
    vim.cmd 'wincmd l'
    vim.cmd 'vertical resize 40'
    vim.cmd 'split'
    vim.cmd 'resize 15'
end

M.window_layouts.RESIZE = function()
    vim.cmd 'wincmd h'
    vim.cmd 'vertical resize 80'
end

-- Setup function
M.setup = function()
    -- This function will be called in keymaps.lua
end

return M
