return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    opts.options = {
      component_separators = "",
      section_separators = "",
    }
    opts.sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
      lualine_c = { "filename", "diagnostics" },
      -- These will be filled later
      -- lualine_c = {'filename', 'diagnostics'},
      lualine_x = { "encoding", "fileformat", "filetype" },
    }
  end,
}
