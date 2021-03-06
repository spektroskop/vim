" FIXME ødelegger paste
func! s:cleanWhitespace()
  let w:v = winsaveview()
  keeppatterns silent! %s/\s\+$//e
  keeppatterns silent! v/\_s*\S/d
  call winrestview(w:v)
endf

augroup vimrc
  autocmd!
  autocmd BufWritePre * call s:cleanWhitespace()
  autocmd CursorHold * echo
  autocmd FileType * setlocal formatoptions-=cro " FIXME funker ikke
  autocmd FileType * setlocal nocursorline
  autocmd InsertLeave * silent! set nopaste
  autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>
  autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
augroup END

if exists('##TermOpen') && exists('##TermClose')
  augroup terminal_events
    autocmd!
    autocmd TermOpen term://* if &ft != 'floaterm' | startinsert | endif
    autocmd TermClose term://* if &ft != 'floaterm' | Sayonara | endif
  augroup END
endif
