let mapleader = "\<space>"

if has('nvim')
  nnoremap <leader>% :lua require'junkbox.util'.source()<cr>
  nnoremap <leader>5 :lua require'junkbox.util'.source()<cr>
  nnoremap <leader># :Telescope buffers<cr>
  nnoremap <leader>3 :Telescope buffers<cr>
  nnoremap <leader>@ :Telescope find_files<cr>
  nnoremap <leader>2 :Telescope find_files<cr>
  nnoremap <leader>/ :Telescope live_grep<cr>

  if exists(':terminal')
    nnoremap <leader>T :vsplit<bar>:terminal<cr>
  endif
else
  nnoremap <leader>% :source %<cr>
  nnoremap <leader>5 :source %<cr>
  nnoremap <leader># :Buffers<cr>
  nnoremap <leader>3 :Buffers<cr>
  nnoremap <leader>@ :Files<cr>
  nnoremap <leader>2 :Files<cr>
  nnoremap <leader>/ :Grep<cr>

  if exists(':terminal')
    nnoremap <leader>T :vertical terminal<cr>
  endif
endif

nnoremap <leader>q :Sayonara<cr>
nnoremap <leader>- :vsplit $PWD<cr>
nnoremap <leader>cd :lcd %:p:h<cr>:pwd<cr>

nnoremap <leader>G :vertical Git<cr>
nnoremap <leader>gp :Git push<cr>

nnoremap <leader>bb :buffers<cr>:buffer<space>
nnoremap <leader>bv :buffers<cr>:vertical sbuffer<space>
nnoremap <leader>ba :vertical ball<cr>
nnoremap <leader>bd :bdelete<cr>
nnoremap <leader>bD :OtherBuffersDo bdelete!<cr>
nnoremap <leader>bw :bwipeout<cr>
nnoremap <leader>bW :%bwipeout!<cr>
nnoremap <leader>bO :OtherBuffersDo bwipeout!<cr>
nnoremap <leader>bH :HiddenBuffersDo bwipeout!<cr>

nmap <silent> <leader>ww <Plug>(golden_ratio_resize)
nnoremap <leader>wf <C-w><Bar><C-w>_
nnoremap <leader>w= <C-w>=
nnoremap <leader>wo :only<cr>
nnoremap <leader>wr <C-w>r
nnoremap <leader>wc :close<cr>

nnoremap <leader>tw :set wrap!<cr>
nnoremap <leader>tg :GoldenRatioToggle<cr>
