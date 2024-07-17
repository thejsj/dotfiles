""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Restore cursor to file position in previous editing session
function! ResCur()
    if line("'\"") <= line("$")
	normal! g`"
	return 1
    endif
endfunction


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

function! FindSessionDirectory() abort
  if len(argv()) > 0
    return fnamemodify(argv()[0], ':p:h')
  endif
  return getcwd()
endfunction!


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


function! DeleteLinesWithStrings()
  " Save current cursor position
  let l:save_cursor = getpos(".")

  " Delete lines containing "puts " and "pp "
  g/puts /d
  g/pp /d

  " Restore cursor position
  call setpos('.', l:save_cursor)
endfunction

command! DeleteRubyPrintLines call DeleteLinesWithStrings()

command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
