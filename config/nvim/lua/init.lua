require("mason").setup()
require("user.cmp")
require("user.lsp")

local function goto_first(str)
  local params = vim.lsp.util.make_position_params()
  vim.lsp.buf_request(0, str, params, function(err, result)
    if err or not result or vim.tbl_isempty(result) then
      vim.notify("No implementations found", vim.log.levels.INFO)
      return
    end

    -- Just go to the first location directly
    local first_result = result[1]
    vim.lsp.util.jump_to_location(first_result, "utf-8", true)
  end)
end

vim.keymap.set('n', 'gd', function()
  goto_first('textDocument/definition')
end, {noremap=true, silent=true })
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

vim.keymap.set('n', 'gy', function ()
  goto_first('textDocument/implementation')
end, {noremap=true, silent=true })
vim.keymap.set("n", "gY", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })

vim.keymap.set('n', 'gt', function ()
  goto_first('textDocument/type_definition')
end, {noremap=true, silent=true })
vim.keymap.set("n", "gT", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })


-- vim.keymap.set('n', 'gt', function()
  -- vim.lsp.buf.type_definition({on_list = function(options)
    -- if options and options.items and #options.items > 0 then
      -- vim.lsp.util.jump_to_location(options.items[1], "utf-8")
    -- end
  -- end})
-- end, {noremap=true})
-- vim.keymap("n", "gT", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { noremap = true, silent = true })


-- local function delete_ruby_print_lines()
  -- -- Save current cursor position
  -- local save_cursor = vim.api.nvim_win_get_cursor(0)

  -- -- Delete lines containing "puts " and "pp "
  -- vim.cmd("g/puts /d")
  -- vim.cmd("g/pp /d")

  -- -- Restore cursor position
  -- vim.api.nvim_win_set_cursor(0, save_cursor)
-- end

-- vim.api.nvim_create_user_command(
  -- 'DeleteRubyPrintLines',  -- Command name
  -- delete_ruby_print_lines, -- Function to call
  -- {}                         -- Optional command options
-- )
-- -- Check if the function is defined correctly
-- print("delete_lines_with_strings function loaded")

-- -- Create a Neovim command that calls the Lua function
-- vim.api.nvim_create_user_command(
  -- 'DeleteRubyPrintLines',  -- Command name
  -- function() delete_ruby_print_lines() end, -- Function to call
  -- {}                         -- Optional command options
-- )

-- -- Check if the command is created
-- print("DeleteRubyPrintLines command created")
