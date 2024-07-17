"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let filepath = $HOME . "/.config/nvim/functions.vim"
if filereadable(filepath)
  exec "source " . filepath
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua require('user.settings')

set guicursor=i:block
filetype plugin indent on " allows auto-indenting depending on file type
scriptencoding utf-8

"
" Code Display
"

syntax enable             " Syntax highligthing
highlight clear SignColum
highlight clear LineNr

" Show spaces and tabs as characters
" set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

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

" Copy/Paste
if has('clipboard')
    if has('unnamedplus') " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else
        set clipboard=unnamed
    endif
endif

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
    " Always switch to current file directory when a new buffer is opened
    autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
augroup END

" Important!!
if has('termguicolors')
  set termguicolors
endif

"
" Statusline
"
set statusline+=%#warningmsg#
set statusline+=%*
set statusline+=%f
set statusline+=\ [%{&ff}/%Y]            " Filetype
set statusline+=\ [%{getcwd()}]          " Current dir

"
" Other
"

set shortmess+=filmnrxoOtT          " Abbrev of messages (avoids 'hit enter')

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

lua require('user.plugins')

"
" FZF
"
nnoremap <silent> <C-p> :call CustomFZF()<CR>

"
" NerdCommenter
"
let g:NERDCustomDelimiters = { 'tf': { 'left': '#'} }
let g:NERDCustomDelimiters = { 'purs': { 'left': '--'} }
nnoremap <leader><space> <plug>NERDCommenterComment<CR>


let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']

lua require('user.plugin_settings')

map <leader>e <plug>NERDTreeTabsToggle<CR>
map <leader>f <plug>NERDTreeFind<CR>
map <leader>w <plug>NERDTreeFind<CR>
nnoremap <leader>m @@<CR>
nnoremap <leader>q @@<CR>

"
" Figma Translation String
"
nnoremap <leader>d :lua vim.diagnostic.open_float()<CR>
nnoremap <leader>ff :call EchoAndCopyPath()<CR>
xnoremap <leader>tt d:call TranslationString(1)<CR>
xnoremap <leader>tf d:call TranslationString(0)<CR>
" xnoremap <leader>t d " <CR>:echo echo getreg("")<CR>
nnoremap <leader>fa :call EchoAndCopyFilename()<CR>

lua require("mason").setup()
lua require("user.cmp")
lua require("user.lsp")


