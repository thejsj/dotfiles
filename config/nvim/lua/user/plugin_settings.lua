
-- Airline

vim.g.airline_theme='simple'
vim.g["airline#extensions#tabline#enabled"] = 1
vim.g.airline_inactive_collapse=1
vim.g["airline#extensions#bufferline#enabled"] = 0
vim.g["airline#extensions#tabline#buffer_idx_mode"] = 1
vim.g["airline#extensions#tabline#exclude_preview"] = 1
vim.g["airline#extensions#tabline#formatter"] = 'unique_tail_improved'

-- NERDTree

vim.g.NERDTreeShowBookmarks=1
vim.g.NERDTreeChDirMode=0
vim.g.NERDTreeQuitOnOpen=1
vim.g.NERDTreeMouseMode=2
vim.g.NERDTreeShowHidden=1
vim.g.NERDTreeKeepTreeInNewTab=1
vim.g.nerdtree_tabs_open_on_gui_startup=0

-- NerdCommenter

vim.g.NERDSpaceDelims=1

-- Copilot

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""

-- Theme
vim.cmd[[colorscheme xcodedarkhc]]
