require 'core.options'
require 'core.keymaps'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
    if vim.v.shell_error ~= 0 then
        error('Error cloning lazy.nvim:\n' .. out)
    end
end

vim.opt.rtp:prepend(lazypath)
require('lazy').setup {
    require 'plugins.neotree',
    require 'plugins.theme',
    require 'plugins.bufferline',
    require 'plugins.lualine',
    require 'plugins.treesitter',
    require 'plugins.telescope',
    require 'plugins.lsp',
    require 'plugins.autocompletion',
    require 'plugins.none-ls',
    require 'plugins.alpha',
    require 'plugins.indent-blankline',
    require 'plugins.gitsigns',
    require 'plugins.faster',
    require 'plugins.whichkey',
    require 'plugins.autopairs',
    require 'plugins.italicize',
    require 'plugins.luasnip',
    require 'plugins.toggleterm',
}
