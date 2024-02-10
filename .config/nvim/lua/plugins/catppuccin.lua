return {
  {
    "catppuccin/nvim",
    priority = 1000,
    name = "catppuccin",
    opts = {
      integrations = {
        alpha = true,
        cmp = true,
        gitsigns = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        lsp_trouble = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true },
        neotest = true,
        noice = true,
        notify = true,
        nvimtree = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        which_key = true,
      },
      custom_highlights = function(colors)
        return {
          ["@variable.member"] = { fg = colors.mauve },
          ["@string.special.symbol.ruby"] = { fg = colors.mauve },
          ["@string.special"] = { fg = colors.mauve },
          ["@conditional"] = { fg = "#fca7ea" },
          ["@constant"] = { fg = colors.mauve },
          ["@constant.builtin"] = { fg = colors.mauve },
          ["@keyword"] = { fg = "#fca7ea" },
          ["@keyword.function"] = { fg = "#fca7ea" },
          ["@property"] = { fg = colors.mauve },
          ["@type"] = { fg = colors.teal },
          ["@namespace"] = { fg = colors.teal },
          ["@lsp.type.class.ruby"] = { fg = colors.teal },
        }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
