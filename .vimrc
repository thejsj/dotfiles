" long live vim
set encoding=utf-8
set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" color schemes (why do I need anything else?)
Bundle 'altercation/vim-colors-solarized'

" Plugins

"
Bundle 'bling/vim-airline'
Bundle 'suan/vim-instant-markdown'
Bundle 'jiangmiao/auto-pairs'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'airblade/vim-gitgutter'
Bundle 'scrooloose/syntastic'
Bundle 'nathanaelkane/vim-indent-guides'

" Buffers/Files
Bundle 'kien/ctrlp.vim'
Bundle 'tacahiroy/ctrlp-funky'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'bling/vim-bufferline'
Bundle 'scroolose/nerdcommenter'

" Searching
Bundle 'rking/ag.vim'

" Sessions
Bundle 'tpope/vim-obsession'
Bundle 'dhruvasagar/vim-prosession'

" I know I need to learn these...
Bundle 'tpope/vim-surround'
" Bundle 'godlygeek/tabular'

" Syntax Files
Bundle 'jelera/vim-javascript-syntax'

" syntax files
" Bundle ujelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Bundle 'elzr/vim-json'
Bundle 'tpope/vim-markdown'
Bundle 'voithos/vim-python-syntax'
Bundle 'nono/vim-handlebars'
Bundle 'digitaltoad/vim-jade'
Bundle 'fatih/vim-go'
Bundle 'Valloric/YouCompleteMe'

call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            Plugin Variables
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" checksyntax config
let g:checksyntax#auto_mode = 0
let g:syntastic_auto_loc_list = 0

" airline config
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_inactive_collapse=1
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#exclude_preview = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

"function! airline#extensions#tabline#foo#format(bufnr, buffers)
  "return fnamemodify(bufname(a:bufnr), ':t')
"endfunction
"let g:airline#extensions#tabline#formatter = 'foo'

" Needed for Solarized
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" NERDTree
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" CtrlP
" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|dist\|log\|tmp$|coverage\',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_dont_split = 'nerdtree'
" This doesn't work
" let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" vim-go
let g:go_fmt_command = "goimports"

" Indent Guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

" ag.vim
let g:ag_prg="ag --vimgrep"
let g:ag_working_path_mode="r"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

" Restore cursor to file position in previous editing session
function! ResCur()
    if line("'\"") <= line("$")
	normal! g`"
	return 1
    endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Non-foldenable (Obviously!)
set nofoldenable

" disable backups
set nobackup
set nowritebackup
set swapfile
set dir=~/.vim/tmp

" Syntax highlighting and colors
syntax enable             " Syntax highligthing
set t_Co=256
set term=xterm-256color
set background=dark
colorscheme solarized

" Mouse
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

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

" Backspace
set backspace=indent,eol,start  " Backspace for dummies

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
set statusline+=%f
"set statusline=%<%f\                     " Filename
"set statusline+=%w%h%m%r                 " Options
set statusline+=\ [%{&ff}/%Y]            " Filetype
set statusline+=\ [%{getcwd()}]          " Current dir
"set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

set number           " Line numbers on
set relativenumber   " Relative numbers
set showmatch        " Show matching brackets/parenthesis
set incsearch        " Find as you type search
set hlsearch         " Highlight search terms
set ignorecase       " Case insensitive search
set wildmenu         " Show list instead of just completing
set wildmode=list:longest,full " Command <Tab> completion

set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

" Indentation settings
set shiftwidth=2     " Indents of 2 spaces
set tabstop=2        " An indentation every 2 columns
set nojoinspaces     " Prevents inserting two spaces after punctuation on a join (J)
autocmd FileType haskell,puppet,ruby,yml,javascript setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType c,php,ptyhon setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType go setlocal shiftwidth=2

" Set color column at 80
highlight ColorColumn ctermbg=3
set colorcolumn=80

" Automatically refresh any unchanged files
set autoread

set guifont=Source\ Code\ Pro\ for\ Powerline "make sure to escape the spaces in the name properly

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

" Broken down into easily includeable segments
"set statusline=%f\                     " Filename
"set statusline+=%w%h%m%r                 " Options
"set statusline+=\ [%{&ff}/%Y]            " Filetype
""set statusline+=\ [%{getcwd()}]          " Current dir
"set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

" ag.vim
set runtimepath^=~/.vim/bundle/ag

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Key Bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","

"*
" Global Mappings
"*

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

" ; is better than :, and kj is better than ctrl-c
nnoremap ; :
nnoremap : ;

" Find merge conflict markers
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

" NERDTree
map <C-e> <plug>NERDTreeTabsToggle<CR>
map <leader>e ;NERDTreeFind<CR>

map <Leader>d ;bd<CR>
map <Leader>w ;w<CR>
" Previous buffer
map <Tab>j ;bp<CR>
" Next buffer
map <Tab>k ;bn<CR>

"
" Normal Mode
"

" escape search highliting by hitting return
nnoremap <CR> ;noh<CR><CR>

map <leader>,<space> <plug>NERDCommenterComment<CR>
nnoremap <leader>l ;NERDTreeTabsToggle<CR>
nnoremap <leader>k ;CheckSyntax<CR>
nnoremap <leader>ed :tabnew ~/.vimrc<cr>
nnoremap <leader>src :source ~/.vimrc<cr>
nnoremap <leader>h ;tabnew<CR>:ConqueTerm bash<CR>
nnoremap <leader>w ;tabclose<CR>
nnoremap <leader>a :Ag

nmap <leader>f ;echo expand('%:p')<CR>
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" open ag.vim
nnoremap <leader>a :Ag

"
" Insert Mode
"

"Arrow Key Fix {
" https://github.com/spf13/spf13-vim/issues/780
if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
    inoremap <silent> <C-[>OC <RIGHT>
endif
" }

" Exit Insert mod easily
inoremap kj <Esc>;w<CR>
inoremap jk <Esc>;w<CR>

