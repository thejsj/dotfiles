local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- Plug 'dense-analysis/ale'       " Code completion
Plug 'scrooloose/nerdtree'     -- Show directory structure
Plug 'jistr/vim-nerdtree-tabs' -- use :NERDTreeTabsToggle to open a tab with NerdTree
Plug 'scrooloose/nerdcommenter'-- Easier comments
Plug 'junegunn/fzf'            -- Fuzzy file finder
Plug 'tpope/vim-abolish'       -- Replace multiple variants of word with :%S
Plug 'arzg/vim-colors-xcode'
Plug 'tpope/vim-fugitive'      -- Git stuff
Plug 'tpope/vim-rhubarb'       -- Github stuff (supports GBrowse)
Plug 'tpope/vim-surround'      -- Surround things with quotes or brackets more easily
Plug 'vim-airline/vim-airline' -- Tabs at the top
Plug 'godlygeek/tabular'       -- Easy alignment
Plug 'github/copilot.vim'      -- Github Copilot
Plug 'ziglang/zig.vim'         -- Zig language support

-- Cmp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

-- Mason
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'vim-airline/vim-airline-themes'

-- zig
Plug 'ziglang/zig.vim'

vim.call('plug#end')
