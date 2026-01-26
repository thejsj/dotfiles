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

require("lspconfig").tsserver.setup {
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  -- Options suggested by Claude to enable source file navigation
  init_options = {
    preferences = {
      includeInlayParameterNameHints = 'all',
      includeInlayParameterNameHintsWhenArgumentMatchesName = true,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayVariableTypeHints = true,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayFunctionLikeReturnTypeHints = true,
      includeInlayEnumMemberValueHints = true,
    }
  },
  -- Follow source maps to original files
  flags = {
    allow_incremental_sync = true,
  },
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      }
    }
  }
}
require("lspconfig").eslint.setup {}
require("lspconfig").rubocop.setup {}
require("lspconfig").zls.setup { -- zig
  -- Server-specific settings. See `:help lspconfig-setup`

  -- the following line can be removed if ZLS is in your PATH
  -- cmd = { '/Users/hiphipjorge/.config/nvim/zls' },
  cmd = { '/usr/local/bin/zls' },
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

-- File type association for JSX and TSX files
vim.cmd([[
  autocmd BufNewFile,BufRead *.jsx set filetype=javascriptreact
  autocmd BufNewFile,BufRead *.tsx set filetype=typescriptreact
]])

-- Show diagnostics under the cursor when holding position
vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
vim.api.nvim_create_autocmd({ "CursorHold" }, {
  pattern = "*",
  command = "lua OpenDiagnosticIfNoFloat()",
  group = "lsp_diagnostics_hold",
})

-- autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
-- autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()
