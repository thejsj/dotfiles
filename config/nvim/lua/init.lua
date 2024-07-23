require("mason").setup()
require("user.cmp")
require("user.lsp")

vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gs", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })

local function delete_ruby_print_lines()
  -- Save current cursor position
  local save_cursor = vim.api.nvim_win_get_cursor(0)

  -- Delete lines containing "puts " and "pp "
  vim.cmd("g/puts /d")
  vim.cmd("g/pp /d")

  -- Restore cursor position
  vim.api.nvim_win_set_cursor(0, save_cursor)
end

vim.api.nvim_create_user_command(
  'DeleteRubyPrintLines',  -- Command name
  delete_ruby_print_lines, -- Function to call
  {}                         -- Optional command options
)
-- Check if the function is defined correctly
print("delete_lines_with_strings function loaded")

-- Create a Neovim command that calls the Lua function
vim.api.nvim_create_user_command(
  'DeleteRubyPrintLines',  -- Command name
  function() delete_ruby_print_lines() end, -- Function to call
  {}                         -- Optional command options
)

-- Check if the command is created
print("DeleteRubyPrintLines command created")
