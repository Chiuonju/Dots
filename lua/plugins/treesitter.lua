return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = {
      "bash", "c", "diff", "html", "lua", "luadoc",
      "markdown", "markdown_inline", "vim", "vimdoc",
      "cpp", "python",
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { "ruby", "cpp" },
    },
    indent = { enable = true, disable = { "ruby" } },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)

    vim.defer_fn(function()
      -- Treesitter highlight groups that typically have colors
      local highlight_groups = {
        "@keyword", "@keyword.function", "@keyword.operator", "@keyword.return",
        "@type", "@type.definition", "@type.builtin", "@storageclass", "@conditional", "@repeat",
        "@exception", "@include", "@namespace", "@preproc", "@define",
        "@macro", "@boolean", "@constant", 
        "@function", "@function.call", "@method", "@method.call",
        "@field", "@property", "@parameter", "@variable.builtin",
        "@punctuation.special", "@keyword.conditional",
        "@string", "@string.regex", "@string.escape",
      }

      -- Apply bold+italic ONLY if the highlight group already has a color
      for _, group in ipairs(highlight_groups) do
        local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
        if hl and (hl.fg or hl.ctermfg) then  -- Check if the group has a color
          vim.api.nvim_set_hl(0, group, { bold = true, fg = hl.fg })
        end
      end
    end, 200)  -- Delay to ensure Treesitter is fully loaded
  end,
}
