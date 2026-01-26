-- Set up nvim-cmp.
local cmp = require'cmp'

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  window = {},
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping(function(fallback)
      if vim.b._copilot_suggestion ~= nil then
        vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif has_words_before() then
        cmp.complete()
        if cmp.visible() then
            cmp.select_next_item()
        end
      elseif vim.b._copilot_suggestion ~= nil then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes(vim.fn['copilot#Accept'](), true, true, true), '')
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<Alt-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif has_words_before() then
        cmp.complete()
        if cmp.visible() then
            cmp.select_next_item()
        end
      elseif vim.b._copilot_suggestion ~= nil then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes(vim.fn['copilot#Accept'](), true, true, true), '')
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline({ '/', '?' }, {
--   mapping = cmp.mapping.preset.cmdline(),
 --  sources = {
   --  { name = 'buffer' }
 --  }
-- })

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
  -- mapping = cmp.mapping.preset.cmdline(),
  -- sources = cmp.config.sources({
    -- { name = 'path' }
  -- }, {
    -- { name = 'cmdline' }
  -- })
-- })
--
function CleanupJsDebug()
  local bufnr = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local new_lines = {}
  local modified = false

  for _, line in ipairs(lines) do
    -- Skip lines containing console.log
    if not line:match("console%.log") then
      -- Skip lines containing debugger
      if not line:match("debugger") then
        -- Replace it.only and describe.only
        local new_line = line
        if line:match("it%.only%(") or line:match("describe%.only%(") then
          new_line = line:gsub("it%.only%(", "it%(")
          new_line = new_line:gsub("describe%.only%(", "describe%(")
          modified = true
        end
        table.insert(new_lines, new_line)
      else
        modified = true
      end
    else
      modified = true
    end
  end

  -- Update buffer with the cleaned lines
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, new_lines)

  -- Show a message to the user about what was done
  if modified then
    print("Removed debug code and fixed test functions")
  else
    print("No changes needed - no debug code found")
  end
end

-- Command to run the cleanup function
vim.api.nvim_create_user_command("CleanupJsDebug", CleanupJsDebug, {
  desc = "Remove console.log, debugger statements, and fix test functions"
})
