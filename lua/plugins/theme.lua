return {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false, -- load on startup
    priority = 1000, -- load before other plugins
    config = function()
        require('catppuccin').setup {
            flavour = 'auto', -- latte, frappe, macchiato, mocha
            background = { -- :h background
                light = 'latte',
                dark = 'frappe',
            },
        }
        vim.cmd.colorscheme 'catppuccin'
    end,
}
