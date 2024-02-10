return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        stimulus_ls = {
          cmd = { "stimulus-language-server", "--stdio" },
          filetypes = { "html", "eruby" },
        },
      },
    },
  },
}
