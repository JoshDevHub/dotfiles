return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.close_if_last_window = true
    opts.event_handlers = {
      {
        event = "file_opened",
        handler = function(file_path)
          vim.api.nvim_command(":Neotree toggle")
        end,
      },
    }
  end,
}
