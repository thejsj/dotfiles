" long live vim
set encoding=utf-8
set nocompatible

" checksyntax config
let g:checksyntax#auto_mode = 0

" airline config
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Non-foldenable
set nofoldenable

" disable backups
set nobackup
set nowritebackup
set noswapfile

" escape search highliting by hitting return
nnoremap <CR> :noh<CR><CR>

"Arrow Key Fix {
" https://github.com/spf13/spf13-vim/issues/780
if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
    inoremap <silent> <C-[>OC <RIGHT>
endif
" }

" vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
Bundle 'gmarik/vundle'

" color schemes
Bundle 'altercation/vim-colors-solarized'
Bundle 'sickill/vim-monokai'

" Plugins
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-surround'
Bundle 'godlygeek/tabular'
Bundle 'Valloric/YouCompleteMe'
Bundle 'suan/vim-instant-markdown'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'airblade/vim-gitgutter'

" syntax files
Bundle 'jelera/vim-javascript-syntax'
Bundle 'elzr/vim-json'
Bundle 'tpope/vim-markdown'
Bundle 'voithos/vim-python-syntax'
Bundle 'nono/vim-handlebars'
Bundle 'digitaltoad/vim-jade'


filetype plugin indent on " Automatically detect file types
syntax enable             " Syntax highligthing
set t_Co=256
set background=dark
colorscheme "monokai"

set mouse=a               " Automatically enable mouse usage
set mousehide             " Hide the mouse cursor while typing

scriptencoding utf-8

if has('clipboard')
    if has('unnamedplus') " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else
        set clipboard=unnamed
    endif
endif

" Always switch to current file directory when a new buffer is opened
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

set autowrite                       " Automatically write file when leaving buffer
set shortmess+=filmnrxoOtT          " Abbrev of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Window compatiblity
set virtualedit=onemore             " Allow for cursor beyond last characther
set history=1000                    " Store history (Default is 20)
set spell                           " Spell checking on
set hidden                          " Allow buffer switching without saving

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" Restore cursor to file position in previous editing session
function! ResCur()
    if line("'\"") <= line("$")
	normal! g`"
	return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

" Setup backup
set backup

set tabpagemax=15     " Only show tabs
set showmode          " Display the current mode

set cursorline        " Highlight current line

highlight clear SignColum
highlight clear LineNr

set ruler             " Show the ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
set showcmd           " Show partial commands in the status line

" Statusline
set laststatus=2

" Broken down into easily includeable segments
set statusline=%<%f\                     " Filename
set statusline+=%w%h%m%r                 " Options
set statusline+=\ [%{&ff}/%Y]            " Filetype
set statusline+=\ [%{getcwd()}]          " Current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

set number           " Line numbers on
set relativenumber   " Relative numbers
set showmatch        " Show matching brackets/parenthesis
set incsearch        " Find as you type search
set hlsearch         " Highlight search terms
set ignorecase       " Case insensitive search
set smartcase        " Case insensitive when uc present
set wildmenu         " Show list instead of just completing
set wildmode=list:longest,full " Command <Tab> completion

set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

set expandtab        " Tabs as spaces, not tabs
set shiftwidth=2     " Indents of 2 spaces
set tabstop=2        " An indentation every 2 columns
set nojoinspaces     " Prevents inserting two spaces after punctuation on a join (J)
autocmd FileType haskell,puppet,ruby,yml setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType c,go,php,ptyhon setlocal expandtab shiftwidth=4 softtabstop=4

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

 " Find merge conflict markers
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

"
" NERDTree
"
map <C-e> <plug>NERDTreeTabsToggle<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" ; is better than :, and kj is better than ctrl-c
nnoremap ; :
nnoremap : ;

" make copy/pasting nice
function! ToggleMouse()
    if &mouse == 'a'
        set mouse=r
        set nonu
    else
        set mouse=a
        set nu
    endif
endfunction
nnoremap <leader>m :call ToggleMouse()<CR>

" ctrl p settings
" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|dist\|log\|tmp$|coverage\',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

highlight ColorColumn ctermbg=2
set colorcolumn=80
