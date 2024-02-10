-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("VimEnter", {
  group = augroup("highligh_indent_line"),
  callback = function()
    vim.api.nvim_set_hl(0, "IndentBlankLineContextChar", { fg = "#6272a4", nocombine = true })
    vim.api.nvim_set_hl(0, "IndentBlankLineChar", { fg = "#44475a", nocombine = true })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("80_ruler"),
  pattern = "ruby,javascript,javascriptreact",
  callback = function()
    vim.api.nvim_set_option_value("colorcolumn", "80", {})
  end,
})
