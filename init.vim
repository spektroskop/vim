set nocompatible
syntax on
filetype plugin indent on
set t_Co=256
let @/ = ""

let &showbreak="» "
let g:mapleader = "\<space>"

"""

lua require 'plugin'
lua require 'plugin.lightline'
lua require 'plugin.vim-which-key'
lua require 'leader'

runtime 'plugin/clever-f.vim'
runtime 'plugin/fzf.vim'
runtime 'plugin/golden-ratio.vim'
runtime 'plugin/undo-tree.vim'
runtime 'plugin/vim-go.vim'

"""

let g:gruvbox_contrast_dark = 'hard'
set background=dark
color gruvbox
highlight Normal ctermbg=black
highlight VertSplit ctermfg=235 ctermbg=NONE
highlight StatusLine cterm=NONE ctermbg=NONE
highlight StatusLineNC cterm=NONE ctermbg=NONE

"""

augroup vimrc
  autocmd!
  autocmd BufWritePre * %s/\s\+$//e
  autocmd FileType * setlocal formatoptions-=cro
  autocmd FileType * setlocal nocursorline
  autocmd TermOpen term://* startinsert
  autocmd TermClose term://* close
augroup END

"""

set backspace=indent,eol,start
set breakindent
set completeopt=menuone,noselect
set cpoptions+=n$
set expandtab
set hlsearch
set ignorecase smartcase
set incsearch
set laststatus=2
set lazyredraw
set nolist
set noshowcmd
set noshowmode
set noswapfile
set nowrap
set ruler
set scrolloff=1 sidescrolloff=2
set shortmess=filnxtToOI
set smarttab tabstop=4 softtabstop=4 shiftwidth=4
set splitright splitbelow
set textwidth=0 wrapmargin=0
set timeoutlen=500
set virtualedit=
set virtualedit=all
set winwidth=5 winminwidth=5 winheight=1 winminheight=1
set wrapscan

"""

tnoremap <Esc> <C-\><C-n>

command! W w
command! Q q
command! WQ wq
command! Wq wq

nmap Q <nop>
map <S-k> k

nmap <c-j> <c-w>w
nmap <c-k> <c-w>W

nnoremap <cr> <esc>
vnoremap <cr> <esc>gV
onoremap <cr> <esc>
inoremap <cr> <esc>`^

xnoremap p pgvy