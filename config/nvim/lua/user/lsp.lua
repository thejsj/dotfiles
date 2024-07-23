-- Set up lspconfig.
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
  -- capabilities = capabilities
-- }

-- local _timers = {}

-- local function setup_diagnostics(client, buffer)
  -- if require("vim.lsp.diagnostic")._enable then
    -- return
  -- end

  -- local diagnostic_handler = function()
    -- local params = vim.lsp.util.make_text_document_params(buffer)
    -- client.request("textDocument/diagnostic", { textDocument = params }, function(err, result)
      -- if err then
        -- local err_msg = string.format("diagnostics error - %s", vim.inspect(err))
        -- vim.lsp.log.error(err_msg)
      -- end
      -- if not result then
        -- return
      -- end
      -- vim.lsp.diagnostic.on_publish_diagnostics(
        -- nil,
        -- vim.tbl_extend("keep", params, { diagnostics = result.items }),
        -- { client_id = client.id }
      -- )
    -- end)
  -- end

  -- diagnostic_handler() -- to request diagnostics on buffer when first attaching

  -- vim.api.nvim_buf_attach(buffer, false, {
    -- on_lines = function()
      -- if _timers[buffer] then
        -- vim.fn.timer_stop(_timers[buffer])
      -- end
      -- _timers[buffer] = vim.fn.timer_start(200, diagnostic_handler)
    -- end,
    -- on_detach = function()
      -- if _timers[buffer] then
        -- vim.fn.timer_stop(_timers[buffer])
      -- end
    -- end,
  -- })
-- end

require("lspconfig").lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}
-- require("lspconfig").ruby_ls.setup({
  -- on_attach = function(client, buffer)
    -- -- setup_diagnostics(client, buffer)
  -- end,
-- })
require("lspconfig").sorbet.setup {
	root_dir = function()
		local cwd = vim.fn.getcwd()

		if string.find(cwd, "figma/figma") then
			return "/Users/jsilva/figma/figma/sinatra"
		else
			return cwd
		end
	end
}

require("lspconfig").tsserver.setup {}
require("lspconfig").eslint.setup {}
require("lspconfig").rubocop.setup {}
require("lspconfig").zls.setup {
  -- Server-specific settings. See `:help lspconfig-setup`

  -- the following line can be removed if ZLS is in your PATH
  cmd = { '/Users/hiphipjorge/.config/nvim/zls' },
  -- There are two ways to set config options:
  --   - edit your `zls.json` that applies to any editor that uses ZLS
  --   - set in-editor config options with the `settings` field below.
  --
  -- Further information on ZLS config options:
  -- https://github.com/zigtools/zls#configuration-options
  -- settings = {
    -- zls = {
      -- -- the following line can be removed if Zig is in your PATH
      -- zig_exe_path = '/path/to/zig_executable',
    -- }
  -- }
}

-- Function to check if a floating dialog exists and if not
-- then check for diagnostics under the cursor
function OpenDiagnosticIfNoFloat()
  for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
    if vim.api.nvim_win_get_config(winid).zindex then
      return
    end
  end
  -- THIS IS FOR BUILTIN LSP
  vim.diagnostic.open_float(0, {
    scope = "cursor",
    focusable = false,
    close_events = {
      "CursorMoved",
      "CursorMovedI",
      "BufHidden",
      "InsertCharPre",
      "WinLeave",
    },
  })
end

-- Show diagnostics under the cursor when holding position
vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
vim.api.nvim_create_autocmd({ "CursorHold" }, {
  pattern = "*",
  command = "lua OpenDiagnosticIfNoFloat()",
  group = "lsp_diagnostics_hold",
})

-- autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
-- autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()
