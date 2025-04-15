return {
    'L3MON4D3/LuaSnip',
    dependencies = {
        'rafamadriz/friendly-snippets',
    },
    config = function()
        local luasnip = require 'luasnip'

        luasnip.config.set_config {
            history = true,
            updateevents = 'TextChanged,TextChangedI',
            enable_autosnippets = true,
            ext_opts = {
                [require('luasnip.util.types').choiceNode] = {
                    active = {
                        virt_text = { { ' Current Choice', 'GruvboxOrange' } },
                    },
                },
            },
        }

        -- Load snippets from various sources
        require('luasnip.loaders.from_vscode').lazy_load()
        require('luasnip.loaders.from_snipmate').lazy_load()
        require('luasnip.loaders.from_lua').lazy_load()

        -- Custom C++ snippets
        luasnip.add_snippets('cpp', {
            luasnip.snippet('Chiuonju', {
                luasnip.text_node {
                    '#include <bits/stdc++.h>',
                    '#define Chiuonju signed main',
                    '',
                    'using namespace std;',
                    '',
                    'const int maxN = 1e6 + 7;',
                    '',
                    'Chiuonju()',
                    '{',
                    '    ios_base::sync_with_stdio(false);',
                    '    cin.tie(nullptr); cout.tie(nullptr);',
                    '',
                    '}',
                },
            }),
            luasnip.snippet('fChiuonju', {
                luasnip.text_node {
                    '#include <bits/stdc++.h>',
                    '#define Chiuonju signed main',
                    '#define NAME ""',
                    'using namespace std;',
                    '',
                    'const int maxN = 1e6 + 7;',
                    '',
                    'Chiuonju()',
                    '{',
                    '    ios_base::sync_with_stdio(false);',
                    '    cin.tie(nullptr); cout.tie(nullptr);',
                    '    freopen(NAME".inp", "r", stdin);',
                    '    freopen(NAME".out", "w", stdout);',
                    '}',
                },
            }),
            luasnip.snippet('ChuongMC', {
                luasnip.text_node {
                    '#include <bits/stdc++.h>',
                    '#define ChuongMC signed main',
                    'using namespace std;',
                    '',
                    'const int maxn = 1e6 + 7;',
                    '',
                    'ChuongMC()',
                    '{',
                    '    ios_base::sync_with_stdio(false);',
                    '    cin.tie(nullptr); cout.tie(nullptr);',
                    '',
                    '}',
                },
            }),
            luasnip.snippet('fChuongMC', {
                luasnip.text_node {
                    '#include <bits/stdc++.h>',
                    '#define ChuongMC signed main',
                    '#define NAME ""',
                    '',
                    'using namespace std;',
                    '',
                    'const int maxn = 1e6 + 7;',
                    '',
                    'ChuongMC()',
                    '{',
                    '    ios_base::sync_with_stdio(false);',
                    '    cin.tie(nullptr); cout.tie(nullptr);',
                    '    freopen(NAME".inp", "r", stdin);',
                    '    freopen(NAME".out", "w", stdout);',
                    '',
                    '}',
                },
            }),
            luasnip.snippet('filing', {
                luasnip.text_node {
                    '    freopen(NAME".inp", "r", stdin);',
                    '    freopen(NAME".out", "w", stdout);',
                },
            }),
        })

        -- Clear snippet after leaving insert mode
        vim.api.nvim_create_autocmd('InsertLeave', {
            callback = function()
                if luasnip.session.current_nodes[vim.api.nvim_get_current_buf()] and not luasnip.session.jump_active then
                    luasnip.unlink_current()
                end
            end,
        })
    end,
    keys = {
        {
            '<c-j>',
            function()
                local luasnip = require 'luasnip'
                if luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                end
            end,
            mode = { 'i', 's' },
        },
        {
            '<c-k>',
            function()
                local luasnip = require 'luasnip'
                if luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                end
            end,
            mode = { 'i', 's' },
        },
    },
}
