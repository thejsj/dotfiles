"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let filepath = $HOME . "/.config/nvim/functions.vim"
if filereadable(filepath)
  exec "source " . filepath
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible          " disable compatibility to old-time vi
filetype plugin indent on " allows auto-indenting depending on file type
set guicursor=i:block
scriptencoding utf-8

set re=0 " https://jameschambers.co.uk/vim-typescript-slow


"
" Saving Files
"

set nobackup " disable backups
set nowritebackup
set swapfile
set dir=~/.vim/tmp
set autoread    " Automatically refresh any unchanged files
set autowrite   " Automatically write file when leaving buffer
set hidden      " Allow buffer switching without saving
set noautochdir " Set working directory to the current file
set browsedir=current


"
" Code Display
"
syntax enable             " Syntax highligthing
set t_Co=256
set background=dark

set nofoldenable  " Don't fold code

highlight clear SignColum
highlight clear LineNr

set ruler                                          " Show the ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
set showcmd                                        " Show partial commands in the status line
set tabpagemax=15                                  " Only show tabs
set showmode                                       " Display the current mode
set number                                         " Line numbers on
set relativenumber                                 " Relative numbers
set showmatch                                      " Show matching brackets/parenthesis

set spell                           " Spell checking on
set spell spelllang=en_us

" Show spaces and tabs as characters
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

" Indentation settings
set shiftwidth=2     " Indents of 2 spaces
set tabstop=2        " An indentation every 2 columns
set nojoinspaces     " Prevents inserting two spaces after punctuation on a join (J)
set softtabstop=2 expandtab
set autoindent

augroup FileTypes
  autocmd FileType haskell,puppet,ruby,yml,elm setlocal expandtab shiftwidth=2 softtabstop=2
  autocmd FileType javascript,css,scss,typescript,ts,jade,html,hbs,json setlocal expandtab shiftwidth=2 softtabstop=2
  autocmd FileType bash,shell,sh  setlocal expandtab shiftwidth=2 softtabstop=2
  autocmd FileType typescript :set makeprg=tsc
  autocmd FileType c,php,ptyhon,groovy setlocal expandtab shiftwidth=4 softtabstop=4
  autocmd FileType go setlocal shiftwidth=2
augroup END

" Set color column at 80
highlight ColorColumn ctermbg=237
set colorcolumn=80

set guifont=Source\ Code\ Pro\ for\ Powerline "make sure to escape the spaces in the name properly

" Mouse
set mouse=a   " Automatically enable mouse usage
set mousehide " Hide the mouse cursor while typing


" Copy/Paste
if has('clipboard')
    if has('unnamedplus') " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else
        set clipboard=unnamed
    endif
endif

"
" Cursor
"

set virtualedit=onemore         " Allow for cursor beyond last characther
set cursorline                  " Highlight current line
set backspace=indent,eol,start  " Backspace for dummies

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
    " Always switch to current file directory when a new buffer is opened
    autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
augroup END

"
" Search
"

set incsearch  " Find as you type search
set hlsearch   " Highlight search terms
set ignorecase " Case insensitive search

"
" Command menu
"
set wildmenu         " Show list instead of just completing
set wildmode=list:longest,full " Command <Tab> completion

"
" Statusline
"
set laststatus=2
set statusline+=%#warningmsg#
set statusline+=%*
set statusline+=%f
set statusline+=\ [%{&ff}/%Y]            " Filetype
set statusline+=\ [%{getcwd()}]          " Current dir

"
" Other
"

set shortmess+=filmnrxoOtT          " Abbrev of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Window compatiblity
set history=1000                    " Store history (Default is 20)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Key Bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let mapleader = " " " Maybe later
let mapleader = ","

"
" Global Mappings
"

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

" ; is better than :, and kj is better than ctrl-c
nnoremap ; :
nnoremap : ;

" Find merge conflict markers
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

map <Leader>c ;bd<CR>
map <Leader>w ;w<CR>

" Previous buffer
map <Tab>j ;bp<CR>
map <Tab>k ;bn<CR>

" Exit Insert mod easily
inoremap kj <Esc>;w<CR>
inoremap jk <Esc>;w<CR>

"
" Normal Mode
"

" escape search highliting by hitting return
nnoremap <CR> ;noh<CR><CR>

nnoremap <leader>ed :tabnew ~/.config/nvim/init.vim<cr>
nnoremap <leader>src :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>w ;tabclose<CR>

"
" Insert Mode
"

"Arrow Key Fix {
" https://github.com/spf13/spf13-vim/issues/780
if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
    inoremap <silent> <C-[>OC <RIGHT>
endif
" }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Custom Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:session_default_directory = FindSessionDirectory()
command! -nargs=1 E :call EditFileFromSessionDefaultDirectory(<f-args>)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" specify directory for plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'dense-analysis/ale'       " Code completion
Plug 'scrooloose/nerdtree'      " Show directory structure
Plug 'jistr/vim-nerdtree-tabs'  " use :NERDTreeTabsToggle to open a tab with NerdTree
Plug 'scrooloose/nerdcommenter' " Easier comments
Plug 'junegunn/fzf'             " Fuzzy file finder
Plug 'arzg/vim-colors-xcode'    " Theme
Plug 'tpope/vim-abolish'        " Replace multiple variants of word with :%S
Plug 'tpope/vim-fugitive'       " Git stuff
Plug 'tpope/vim-rhubarb'        " Github stuff (supports GBrowse)
Plug 'tpope/vim-surround'       " Surround things with quotes or brackets more easily
Plug 'vim-airline/vim-airline'  " Tabs at the top
Plug 'godlygeek/tabular'        " Easy alignment
Plug 'godlygeek/tabular'        " Easy alignment

" initialize plugin system
call plug#end()

colorscheme xcodedarkhc

" Ale

let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
let g:ale_completion_autoimport = 1
let g:ale_sign_column_always = 1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 1
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0

let g:ale_sign_error = ' •'
let g:ale_sign_warning = ' •'

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_ruby_sorbet_executable = 'bundle'
let g:ale_ruby_srb_executable = 'bundle'

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black'],
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint', 'tslint'],
\   'ruby': ['prettier'],
\}

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint', 'tslint', 'tsserver'],
\   'python': ['flake8'],
\   'ruby': ['srb', 'rubocop'],
\}

" Ale sign colors
hi link ALEErrorSign Error
hi link ALEWarningSign Title
hi SpellBad cterm=underline

nnoremap <buffer> <leader>t :ALEGoToDefinition<CR>
nnoremap <leader>t :ALEGoToDefinition<CR>
nnoremap <buffer> <leader>n :ALEGoToDefinition<CR>
nnoremap <buffer> <leader>d :ALEGoToDefinition<CR>
nnoremap <leader>d :ALEGoToDefinition<CR>
nnoremap <leader>e :ALEDetail<CR>
nnoremap <buffer> <leader>r :ALEDetail<CR>
nnoremap <buffer> <leader>u :ALEDetail<CR>
nnoremap <buffer> <leader>o :ALEDetail<CR>

"
" Vim test (Not Installed)
"

" Plug 'vim-test/vim-test'
let g:test#strategy = "vimterminal"
let test#project_root = g:session_default_directory
let test#ruby#bundle_exec = 1
let test#ruby#minitest#executable = 'RACK_ENV=test bundle exec ruby'
let g:test#strategy = "vimterminal"
let g:test#custom_transformations = {'RubyTransform': function('RubyTransform')}
let g:test#transformation = 'RubyTransform'

"
" FZF
"

nnoremap <silent> <C-p> :call CustomFZF()<CR>


"
" NerdCommenter
"

let NERDSpaceDelims=1
let g:NERDCustomDelimiters = { 'tf': { 'left': '#'} }
let g:NERDCustomDelimiters = { 'purs': { 'left': '--'} }
nnoremap <leader><space> <plug>NERDCommenterComment<CR>

"
" NERDTree
"

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

map <leader>e <plug>NERDTreeTabsToggle<CR>
map <leader>f <plug>NERDTreeFind<CR>
map <leader>w <plug>NERDTreeFind<CR>

"
" Airline
"

let g:airline_theme='simple'
let g:airline#extensions#tabline#enabled = 1
let g:airline_inactive_collapse=1
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#exclude_preview = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#ale#enabled = 1

"
" Figma Translation String
"

nnoremap <leader>ff :call EchoAndCopyPath()<CR>
xnoremap <leader>tt d:call TranslationString(1)<CR>
xnoremap <leader>tf d:call TranslationString(0)<CR>
" xnoremap <leader>t d " <CR>:echo echo getreg("")<CR>
nnoremap <leader>fa :call EchoAndCopyFilename()<CR>
