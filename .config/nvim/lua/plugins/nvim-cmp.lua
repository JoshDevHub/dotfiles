return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")
    opts.mapping = cmp.mapping.preset.insert({
      ["<CR>"] = cmp.config.disable,
      ["<C-y>"] = cmp.mapping.confirm(),
    })
  end,
}
