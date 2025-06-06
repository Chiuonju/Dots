return {
    'goolord/alpha-nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },

    config = function()
        local alpha = require 'alpha'
        local dashboard = require 'alpha.themes.dashboard' -- Or 'alpha.themes.startify' if that's your preference

        dashboard.section.header.val = {
            [[          ▀████▀▄▄              ▄█ ]],
            [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
            [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
            [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
            [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
            [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
            [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
            [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
            [[   █   █  █      ▄▄           ▄▀   ]],
        }

        dashboard.section.buttons.val = {
            dashboard.button('f', '󰱼  Find file', ':Telescope find_files <CR>'),
            dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
            dashboard.button('r', '󰄉  Recently used files', ':Telescope oldfiles <CR>'),
            dashboard.button('t', '󰺮  Find text', ':Telescope live_grep <CR>'),
            dashboard.button('c', '󰒓  Configuration', ':e ~/.config/nvim/init.lua<CR>'),
            dashboard.button('q', '󰅚  Quit Neovim', ':qa<CR>'),
        }

        local function footer()
            return "Don't Stop Until You Are Proud..."
        end

        dashboard.section.footer.val = footer()

        dashboard.section.footer.opts.hl = 'Type'
        dashboard.section.header.opts.hl = 'Include'
        dashboard.section.buttons.opts.hl = 'Keyword'

        dashboard.opts.noautocmd = true -- Corrected: Access opts via dashboard.opts
        alpha.setup(dashboard.opts) -- Pass the dashboard.opts table to alpha.setup
        vim.api.nvim_create_autocmd('User', {
            pattern = 'AlphaReady',
            callback = function()
                pcall(function()
                    require('lazy').load { plugins = { 'todo-comments.nvim' } }
                end)
                vim.schedule(function()
                    vim.cmd 'TodoQuickFix'
                end)
            end,
        })
    end,
}
