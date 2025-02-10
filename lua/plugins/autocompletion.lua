return { -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
        {
            'L3MON4D3/LuaSnip',
            build = (function()
                if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
                    return
                end
                return 'make install_jsregexp'
            end)(),
        },
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'rafamadriz/friendly-snippets',
    },
    config = function()
        local cmp = require 'cmp'
        local luasnip = require 'luasnip'
        require('luasnip.loaders.from_vscode').lazy_load()

        local kind_icons = {
            Text = '󰉿',
            Method = '󰆧',
            Function = '󰊕',
            Constructor = '',
            Field = '',
            Variable = '󰂡',
            Class = '󰠱',
            Interface = '',
            Module = '󰏗',
            Property = '',
            Unit = '',
            Value = '󰎠',
            Enum = '',
            Keyword = '󰌋',
            Snippet = '',
            Color = '󰏘',
            File = '󰈙',
            Reference = '',
            Folder = '󰉋',
            EnumMember = '',
            Constant = '󰇽',
            Struct = '',
            Event = '',
            Operator = '󰆕',
            TypeParameter = '󰊄',
        }

        cmp.setup {
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            completion = { completeopt = 'menu,menuone,noinsert' },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert {
                ['<C-j>'] = cmp.mapping.select_next_item(),
                ['<C-k>'] = cmp.mapping.select_prev_item(),
                ['<CR>'] = cmp.mapping.confirm { select = true },
                ['<C-c>'] = cmp.mapping.complete {},
                ['<C-l>'] = cmp.mapping(function()
                    if luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    end
                end, { 'i', 's' }),
                ['<C-h>'] = cmp.mapping(function()
                    if luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    end
                end, { 'i', 's' }),
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            },
            sources = cmp.config.sources {
                { name = 'nvim_lsp', priority = 1000 },
                { name = 'luasnip',  priority = 750 },
                { name = 'buffer',   priority = 500 },
                { name = 'path',     priority = 250 },
            },
            formatting = {
                fields = { 'kind', 'abbr', 'menu' },
                format = function(entry, vim_item)
                    vim_item.kind = string.format(' %s  %s', kind_icons[vim_item.kind] or '', vim_item.kind)
                    vim_item.menu = ({
                        nvim_lsp = '[LSP]',
                        luasnip = '[Snippet]',
                        buffer = '[Buffer]',
                        path = '[Path]',
                    })[entry.source.name]
                    return vim_item
                end,
            },
            experimental = {
                ghost_text = false, -- Faint inline text preview
            },
        }
    end,
}
