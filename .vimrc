" long live vim
set encoding=utf-8
set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vundle
let $GIT_SSL_NO_VERIFY = 'true'
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" color schemes (why do I need anything else?)
Bundle 'altercation/vim-colors-solarized'
Bundle 'arzg/vim-colors-xcode'

" Plugins

" Display
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
" Bundle 'suan/vim-instant-markdown'
" Bundle 'jiangmiao/auto-pairs'
" Bundle 'airblade/vim-gitgutter'
" Bundle 'nathanaelkane/vim-indent-guides'

" Buffers/Files

" CTRL+P for for fuzzy finding files
" Bundle 'kien/ctrlp.vim'
Bundle 'junegunn/fzf'
" CTRL+P but for functions
" Bundle 'tacahiroy/ctrlp-funky'
" Show file tree
Bundle 'scrooloose/nerdtree'
" use :NERDTreeTabsToggle to open a tab with NerdTree
Bundle 'jistr/vim-nerdtree-tabs'
" <Leader>cc for commenting
Bundle 'scrooloose/nerdcommenter'
Bundle 'bling/vim-bufferline'

" Searching
" Use :Ag in vim to find files
Bundle 'rking/ag.vim'
" More detailed :jumps list
Bundle 'thinca/vim-poslist'
" Replace multiple variants of word with :%S
Bundle 'tpope/vim-abolish'

" Typescript
Bundle 'Quramy/tsuquyomi'

" Sessions
"" Use :Obsses to make more better vim sessions
Bundle 'tpope/vim-obsession'
Bundle 'dhruvasagar/vim-prosession'

" I know I need to learn these...
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rhubarb'
Bundle 'godlygeek/tabular'

" Syntax
Plugin 'dense-analysis/ale'
Bundle 'elzr/vim-json'
Bundle 'tpope/vim-markdown'
Bundle 'nono/vim-handlebars'
Bundle 'digitaltoad/vim-jade'
Bundle 'fatih/vim-go'
Bundle 'tikhomirov/vim-glsl'

" Auto Completion
Bundle 'Shougo/deoplete.nvim'
" 2 Dependencies needed by deoplete
Bundle 'roxma/nvim-yarp'
Bundle 'roxma/vim-hug-neovim-rpc'

Bundle 'carlitux/deoplete-ternjs'
"
Bundle 'vim-test/vim-test'

call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ag.vim
set runtimepath^=~/.vim/bundle/ag
set runtimepath+=~/.vim/bundle/deoplete.nvim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            Plugin Variables
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" checksyntax config
let g:checksyntax#auto_mode = 0

" airline config
let g:airline_theme='simple'
" let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_inactive_collapse=1
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#exclude_preview = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

let g:gitgutter_max_signs=9999

"function! airline#extensions#tabline#foo#format(bufnr, buffers)
  "return fnamemodify(bufname(a:bufnr), ':t')
"endfunction
"let g:airline#extensions#tabline#formatter = 'foo'

" Needed for Solarized
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"

" Syntastic
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_typescript_tsc_fname = ''

" let g:syntastic_javascript_checkers=[]

" if filereadable('./.jshintrc')
  " call add(g:syntastic_javascript_checkers, 'jshint')
" end

" if filereadable('.eslintrc')
  " call add(g:syntastic_javascript_checkers, 'eslint')
  " if filereadable('./node_modules/.bin/eslint')
    " let g:syntastic_javascript_eslint_exec='./node_modules/.bin/eslint'
  " end
" end

" if filereadable('.flowconfig')
  " call add(g:syntastic_javascript_checkers, 'flow')
" end

" if filereadable('./node_modules/standard/package.json')
  " call add(g:syntastic_javascript_checkers, 'standard')
  " let g:syntastic_javascript_standard_exec='standard'
" end

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
" let g:ctrlp_custom_ignore = {
  " \ 'dir':  '\.git$\|\.yardoc\|node_modules\|dist\|log\|tmp$|coverage\',
  " \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  " \ }

" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_dont_split = 'nerdtree'

" set grepprg=rg\ --color=never
" let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
" let g:ctrlp_use_caching = 0

" let g:ctrlp_max_files = 0
" let g:ctrlp_max_depth = 40

" vim-go
let g:go_fmt_command = "goimports"

" Indent Guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

" ag.vim
let g:ag_prg="rg --vimgrep"
let g:ag_working_path_mode="r"

" NERDCommenter
let NERDSpaceDelims=1
let g:NERDCustomDelimiters = { 'tf': { 'left': '#'} }
let g:NERDCustomDelimiters = { 'purs': { 'left': '--'} }

" Typescript-vim
let g:typescript_compiler_binary = 'tsc'

" Deoplete
let g:deoplete#enable_at_startup = 1

call deoplete#custom#option('sources', {
\ '_': ['ale'],
\})

let g:ale_completion_enabled = 0
set omnifunc=ale#completion#OmniFunc
let g:ale_completion_autoimport = 1
let g:ale_sign_column_always = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0

let g:ale_sign_error = ' •'
let g:ale_sign_warning = ' •'

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 0

let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_ruby_sorbet_executable = 'bundle'
let g:ale_ruby_srb_executable = 'bundle'

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black'],
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'ruby': ['prettier'],
\}

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'python': ['flake8'],
\   'ruby': ['srb', 'rubocop'],
\}

" Use tern_for_vim.
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

let g:airline#extensions#ale#enabled = 1

let g:surround_116 = "{% trans \"\r\" %}"

" let g:github_enterprise_urls = ['https://example.com']

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

function! EchoAndCopyPath()
  let l:full_path = expand('%:p')
  let l:path = substitute(l:full_path, g:session_default_directory,"", "")
  if l:path[0] == "/"
    let l:path = l:path[1:]
  endif
  echo l:path
  let @+ = l:path
endfunction

function! EchoAndCopyFilename()
  let l:path = expand('%')
  if l:path[0] == "/"
    let l:path = l:path[1:]
  endif
  echo l:path
  let @+ = l:path
endfunction

" https://github.com/tpope/vim-abolish/blob/master/plugin/abolish.vim#L120-L127
function! s:snakecase(word)
  let word = substitute(a:word,'::','/','g')
  let word = substitute(word,'\(\u\+\)\(\u\l\)','\1_\2','g')
  let word = substitute(word,'\(\l\|\d\)\(\u\)','\1_\2','g')
  let word = substitute(word,'[.-]','_','g')
  let word = substitute(word,' ','_','g') " Added by thejsj
  let word = tolower(word)
  return word
endfunction

function! FindFigmaPath(path)
  let l:parts = split(a:path, "/")
  let l:index = len(l:parts) - 1

  while (l:index > 0)
    if l:parts[l:index] == "figma"
      return '/' . join(l:parts[:l:index], "/")
    endif
    let l:index = l:index - 1
  endwhile

  return ''
endfunction

function! GetDictionaryPath()
  if !exists("g:translation_dictionary")
    echoerr "No translation dictionary set."
    return ''
  end

  let l:figma_path = FindFigmaPath(expand("%:p"))
  return l:figma_path . "/config/dict/en/web/dictionaries/" . g:translation_dictionary . ".json"
endfunction


function! OpenDictonary()
  let l:dictionary_path = GetDictionaryPath()
  if l:dictionary_path == ""
    echoerr "No translation dictionary set."
    return ''
  endif
  execute "edit " . l:dictionary_path
endfunction

function! TranslationString(use_react_component)
  let l:dictionary_path = GetDictionaryPath()
  if l:dictionary_path == ""
    echoerr "No translation dictionary set."
    return ''
  endif

  if filereadable(expand(glob(l:dictionary_path)))
    let l:dictionary_str = readfile(expand(glob(l:dictionary_path)))
    let l:dictionary = json_decode(join(l:dictionary_str, "\n"))
  else
    let l:dictionary = {}
  endif

  let l:text = getreg("")
  let l:quotes = ['"', "'", '`', "`"]
  if index(quotes, text[0]) != -1
    let l:text = l:text[1:]
  end
  if index(l:quotes, l:text[-1]) != -1
    let l:text = l:text[:-2]
  end
  let l:key = substitute(l:text, '\n$', '', '')
  let l:key = s:snakecase(l:key)
  let l:key = substitute(l:key, '[^A-z]', '', 'g')

  let l:translation_namespace = expand("%:r:h")

  if strlen(l:key) > 35
    " Remove last one
    let l:key = l:key[:40]
    let l:key = join(split(l:key, '_')[0:-2], '_')
  endif
  if exists("g:translation_namespace")
    let l:translation_namespace = g:translation_namespace
  endif
  let l:composite_key = l:translation_namespace . "." . l:key

  " Add entry to dictionary
  let l:dictionary[l:composite_key] = { 'string': l:text, 'context': '', }
  let l:dictionary_write_str = json_encode(l:dictionary)
  if filereadable(expand(glob(l:dictionary_path)))
    call writefile(split(l:dictionary_write_str, "\n", 1), expand(glob(l:dictionary_path)), "s")
  else
    call writefile(split(l:dictionary_write_str, "\n", 1), l:dictionary_path)
  endif

  let l:figma_l10n_directory = split(system("ls ~/.vscode/extensions | grep 'figma-l10n'"), "\n")[0]

  " This code must be executed in the figjam-l10n directory because it
  " requires the 'json-stable-stringify' package.
  " This code does not use newlines. For that reason, every statement needs
  " to have a `;' at the end.
  " This code uses variable substitution at the bottom for a path. That path
  " must be absolute.
  let text =<< trim END
cd ~/.vscode/extensions/$PLUGIN_DIRECTORY_NAME && node -e "const stringify = require('json-stable-stringify');
const fs = require('fs');
const dictionaryJsonStringify = (json) => {
  return stringify(json, {
    space: 2,
    cmp: function (a, b) {
      if (a.key === 'context') {
        return 1;
      } else if (b.key === 'context') {
        return -1;
      }
      return a.key < b.key ? -1 : 1;
    },
  });
};
const dictionaryFilePath = '$DICTIONARY_FILE_PATH_REPLACE';
const json = JSON.parse(fs.readFileSync(dictionaryFilePath).toString());
fs.writeFileSync(dictionaryFilePath, dictionaryJsonStringify(json));"
END

  let text = join(text, " ")
  let text = substitute(text, "$DICTIONARY_FILE_PATH_REPLACE", l:dictionary_path, "")
  let text = substitute(text, "$PLUGIN_DIRECTORY_NAME", l:figma_l10n_directory, "")

  call system(text)

  if a:use_react_component == 1
    call setreg("t", "<Tx id=\"" . l:composite_key .  "\"/>")
  else
    call setreg("t", "t(\"" . l:composite_key .  "\")")
  endif
  " Go back one space and set the contents of the register t
  execute 'normal! h"tp'
  return ''
endfunction

" http://stackoverflow.com/questions/17512794/toggle-error-location-panel-in-syntastic
" function! ToggleErrors()
    " let old_last_winnr = winnr('$')
    " lclose
    " if old_last_winnr == winnr('$')
        " " Nothing was closed, open syntastic error location panel
        " Errors
    " endif
" endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set re=0 " https://jameschambers.co.uk/vim-typescript-slow

set statusline+=%#warningmsg#
set statusline+=%*

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
" colorscheme solarized
colorscheme xcodedarkhc

let g:tsuquyomi_disable_quickfix = 1

" Ale sign colors
hi link ALEErrorSign    Error
hi link ALEWarningSign Title
hi SignColumn ctermbg=black
hi SpellBad cterm=underline

" Set color column at 80
set colorcolumn=80

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

set autowrite                       " Automatically write file when leaving buffer
set shortmess+=filmnrxoOtT          " Abbrev of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Window compatiblity
set virtualedit=onemore             " Allow for cursor beyond last characther
set history=1000                    " Store history (Default is 20)
set spell                           " Spell checking on
set spell spelllang=en_us
set hidden                          " Allow buffer switching without saving


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Never open files in the NERDTree buffer
" autocmd FileType nerdtree let t:nerdtree_winnr = bufwinnr('%')
" autocmd BufWinEnter * call PreventBuffersInNERDTree()

" function! PreventBuffersInNERDTree()
  " if bufname('#') =~ 'NERD_tree' && bufname('%') !~ 'NERD_tree'
    " \ && exists('t:nerdtree_winnr') && bufwinnr('%') == t:nerdtree_winnr
    " \ && &buftype == '' && !exists('g:launching_fzf')
    " let bufnum = bufnr('%')
    " close
    " exe 'b ' . bufnum
    " NERDTree
  " endif
  " if exists('g:launching_fzf') | unlet g:launching_fzf | endif
" endfunction

function! FindSessionDirectory() abort
  if len(argv()) > 0
    return fnamemodify(argv()[0], ':p:h')
  endif
  return getcwd()
endfunction!
let g:session_default_directory = FindSessionDirectory()

function! EditFileFromSessionDefaultDirectory(filename, ...) abort
  exe 'cd ' . g:session_default_directory

  if a:filename[0:1] == "js"
    let a:filename = "web/" . a:filename
  endif

  execute "edit " a:filename
endfunction!

function! CustomFZF()
  call fzf#run({ 'dir': '' . g:session_default_directory, 'sink': 'e', 'window': {'width': 0.9, 'height': 0.6}})
endfunction!
command! -nargs=1 E :call CustomFZF(<f-args>)

nnoremap <silent> <C-p> :call CustomFZF()<CR>

let g:test#strategy = "vimterminal"

function! RubyTransform(cmd) abort
  let command = substitute(a:cmd, '/\w*::', '/', 'g')
  " if g:test#strategy == "basic"
    " return substitute(command, '#', '\\\#', "g")
  " elseif g:test#strategy == "vimterminal"
    " return substitute(command, '#', '\\\#', "g")
    " " return command
  " endif
  return command
endfunction

let test#project_root = g:session_default_directory
let test#ruby#bundle_exec = 1
let test#ruby#minitest#executable = 'RACK_ENV=test bundle exec ruby'

let g:test#custom_transformations = {'RubyTransform': function('RubyTransform')}
let g:test#transformation = 'RubyTransform'

set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Broken down into easily includeable segments
"set statusline=%f\                     " Filename
"set statusline+=%w%h%m%r                 " Options
"set statusline+=\ [%{&ff}/%Y]            " Filetype
""set statusline+=\ [%{getcwd()}]          " Current dir
"set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
    " Always switch to current file directory when a new buffer is opened
    autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
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
set softtabstop=2 expandtab
set autoindent

augroup FileTypes
  autocmd FileType haskell,puppet,ruby,yml,elm setlocal expandtab shiftwidth=2 softtabstop=2
  autocmd FileType javascript,css,scss,typescript,ts,jade,html,hbs,json setlocal expandtab shiftwidth=2 softtabstop=2
  autocmd FileType bash,shell,sh  setlocal expandtab shiftwidth=2 softtabstop=2
  autocmd FileType typescript :set makeprg=tsc
  autocmd FileType c,php,ptyhon,groovy setlocal expandtab shiftwidth=4 softtabstop=4
  autocmd FileType go setlocal shiftwidth=2
  autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl
augroup END

" Set color column at 80
highlight ColorColumn ctermbg=237
set colorcolumn=80
augroup filetypedetect
    au BufRead,BufNewFile *.purs setfiletype haskell
    au BufRead,BufNewFile Jenkinsfile setfiletype groovy
augroup END

" Automatically refresh any unchanged files
set autoread

set guifont=Source\ Code\ Pro\ for\ Powerline "make sure to escape the spaces in the name properly

" Allow different vimrc files
set exrc
set secure

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Key Bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let mapleader = " " " Maybe later
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
map <leader>e <plug>NERDTreeTabsToggle<CR>
map <leader>f <plug>NERDTreeFind<CR>
map <leader>w <plug>NERDTreeFind<CR>

map <Leader>d ;bd<CR>
map <Leader>w ;w<CR>

" Previous buffer
map <Tab>j ;bp<CR>  " How I do it now
map <Leader>j ;bp<CR> " How I whould be doing it
map <Leader>h ;bp<CR>
" Next buffer
map <Tab>k ;bn<CR>
map <Leader>k ;bn<CR>
map <Leader>l ;bn<CR>
map <Leader>dw dw"0P<CR>


"
" Normal Mode
"

" escape search highliting by hitting return
nnoremap <CR> ;noh<CR><CR>

nnoremap <leader><space> <plug>NERDCommenterComment<CR>
nnoremap <leader>l ;NERDTreeTabsToggle<CR>
nnoremap <leader>k ;CheckSyntax<CR>
nnoremap <leader>ed :tabnew ~/.vimrc<cr>
nnoremap <leader>src :source ~/.vimrc<cr>
nnoremap <leader>h ;tabnew<CR>:ConqueTerm bash<CR>
nnoremap <leader>w ;tabclose<CR>
nnoremap <leader>a :Agr
nnoremap <leader>t :TsuDefinition<cr>

nnoremap <leader>ff :call EchoAndCopyPath()<CR>
xnoremap <leader>tt d:call TranslationString(1)<CR>
xnoremap <leader>tf d:call TranslationString(0)<CR>
" xnoremap <leader>t d " <CR>:echo echo getreg("")<CR>
nnoremap <leader>fa :call EchoAndCopyFilename()<CR>

" Copies current file path to the clipboard
" nmap <silent> <leader>fa :let @+ = expand("%")<CR>

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

set noautochdir
set browsedir=current

" open ag.vim
nnoremap <leader>a :Ag

" Switch between the last two files
" nnoremap <leader>f <Plug>(easymotion-prefix)
" nnoremap <leader><leader> <c-^>

"
" Insert Mode
"

"Arrow Key Fix {
" https://github.com/spf13/spf13-vim/issues/780
if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
    inoremap <silent> <C-[>OC <RIGHT>
endif
" }

"" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Exit Insert mod easily
inoremap kj <Esc>;w<CR>
inoremap jk <Esc>;w<CR>

command! -nargs=1 E :call EditFileFromSessionDefaultDirectory(<f-args>)
