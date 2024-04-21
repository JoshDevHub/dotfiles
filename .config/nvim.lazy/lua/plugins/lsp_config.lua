_timers = {}
local function setup_diagnostics(client, buffer)
  if require("vim.lsp.diagnostic")._enable then
    return
  end

  local diagnostic_handler = function()
    local params = vim.lsp.util.make_text_document_params(buffer)
    client.request("textDocument/diagnostic", { textDocument = params }, function(err, result)
      if err then
        local err_msg = string.format("diagnostics error - %s", vim.inspect(err))
        vim.lsp.log.error(err_msg)
      end
      if not result then
        return
      end
      vim.lsp.diagnostic.on_publish_diagnostics(
        nil,
        vim.tbl_extend("keep", params, { diagnostics = result.items }),
        { client_id = client.id },
        {}
      )
    end)
  end

  diagnostic_handler() -- to request diagnostics on buffer when first attaching

  vim.api.nvim_buf_attach(buffer, false, {
    on_lines = function()
      if _timers[buffer] then
        vim.fn.timer_stop(_timers[buffer])
      end
      _timers[buffer] = vim.fn.timer_start(200, diagnostic_handler)
    end,
    on_detach = function()
      if _timers[buffer] then
        vim.fn.timer_stop(_timers[buffer])
      end
    end,
  })
end

return {
  {
    "neovim/nvim-lspconfig",
    commit = "0351909f2b571f1645b347aedddc45c74b7ff062",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        ruby_ls = {
          cmd = { os.getenv("HOME") .. "/.rbenv/shims/ruby-lsp", "stdio" },
          on_attach = function(client, buffer)
            setup_diagnostics(client, buffer)
          end,
        },
        stimulus_ls = {
          cmd = { "stimulus-language-server", "--stdio" },
          filetypes = { "html", "eruby" },
        },
      },
    },
  },
}
