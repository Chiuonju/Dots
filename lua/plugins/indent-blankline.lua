return {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
        indent = {
            char = '▏',
            highlight = { -- Directly set the highlight groups here
                'RainbowRed',
                'RainbowYellow',
                'RainbowBlue',
                'RainbowOrange',
                'RainbowGreen',
                'RainbowViolet',
                'RainbowCyan',
            },
        },
        scope = {
            show_start = false,
            show_end = false,
            show_exact_scope = false,
        },
        exclude = {
            filetypes = {
                'help',
                'startify',
                'dashboard',
                'packer',
                'neogitstatus',
                'NvimTree',
                'Trouble',
            },
        },
    },
    config = function(_, opts) -- The config function receives the opts table
        local hooks = require 'ibl.hooks'

        -- Define the highlight groups (only once)
        local highlight_groups = {
            RainbowRed = { fg = '#E06C75' },
            RainbowYellow = { fg = '#E5C07B' },
            RainbowBlue = { fg = '#61AFEF' },
            RainbowOrange = { fg = '#D19A66' },
            RainbowGreen = { fg = '#98C379' },
            RainbowViolet = { fg = '#C678DD' },
            RainbowCyan = { fg = '#56B6C2' },
        }

        -- Register the hook to set highlights on colorscheme change
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            for group_name, config in pairs(highlight_groups) do
                vim.api.nvim_set_hl(0, group_name, config)
            end
        end)

        require('ibl').setup(opts) -- Pass the opts table to ibl.setup
    end,
}

