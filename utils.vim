" Switch between relative numbering and absolute
function! utils#relativeNumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunction

" Strip trailing spaces
function! utils#stripTrailingWhitespace()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

function! utils#nerdWrapper()
  if &filetype ==# '' " Empty buffer
    :NERDTreeToggle
  elseif expand('%:t') =~ 'NERD_tree' " In NERD_tree buffer
    wincmd w
  else " Normal file buffer
    :NERDTreeFind
  endif
endfunction

function! utils#intelligentVerticalResize(direction)
  let window_resize_count = 5
  let current_window_is_last_window = (winnr() == winnr("$"))

  if (a:direction == 'left')
    let [modifier_1, modifier_2] = ['+', '-']
  else
    let [modifier_1, modifier_2] = ['-', '+']
  endif

  let modifier = current_window_is_last_window ? modifier_1 : modifier_2
  let command = 'vertical resize ' . modifier . window_resize_count . '<CR>'
  execute command
endfunction

function! utils#runFile()
  if &filetype ==? 'ruby'
    let command = 'ruby %'
  elseif &filetype ==? 'sh'
    let command = 'bash %'
  elseif &filetype ==? 'julia'
    let command = 'julia %'
  elseif &filetype ==? 'python'
    let command = 'python %'
  elseif &filetype ==? 'perl'
    let command = 'perl %'
 else
    echom "Can't run current file (unsupported filetype: " . &filetype . ")"
  endif

  if exists('command')
    execute ':!' . command
  endif
endfunction

" Mode function for Lightline statusline
function! utils#lightLineMode()
  let fname = expand('%:t')
  return fname =~ 'NERD_tree' ? 'NT' :
        \ &ft == 'unite' ? 'Unite' :
        \ winwidth(0) > 70 ? lightline#mode() : ''
endfunction

" File format function for Lightline statusline
function! utils#lightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

" Filetype function for Lightline statusline
function! utils#lightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

" File encoding function for Lightline statusline
function! utils#lightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

" File name function for Lightline statusline
function! utils#lightLineFilename()
  let fname = expand('%:t')
  return fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ ('' != fname ? fname : '[No Name]')
endfunction
