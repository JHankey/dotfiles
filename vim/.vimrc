"""""""""""""""""""""""""""""""""""""
" Basic setup
"""""""""""""""""""""""""""""""""""""
set nocompatible

" Enable syntax and plugin (for netrw)
syntax enable
filetype plugin on

" Search down into subfolders
" Provides tab-completion for all rile-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Statusline always on (doesn't need more than one tab open)
set laststatus=2

" Set color scheme
colorscheme ron

" Disables swapfiles
set noswapfile

" Enables mouse
set mouse=a



""""""""""""""""""""""""""""""""""""
" Line
""""""""""""""""""""""""""""""""""""

" Show relative line numbers
set relativenumber
set number

" Enable Explore relative line numbers
let g:netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'
let g:netrw_liststyle = 3


"""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""

" vim-plug UNIX install curl -fLo ~/.vim/autoload/plug.vim --create-dirs \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.vim/plugged')

" Lightline Status bar
Plug 'https://github.com/itchyny/lightline.vim'

call plug#end()



"""""""""""""""""""""""""""""""""""""
" Indents
"""""""""""""""""""""""""""""""""""""

" replace tabs with spaces
set expandtab
" 1 tab = 2 spaces
set tabstop=4 shiftwidth=4

" when deleting whitespace at the beginning of a line, delete 
" 1 tab worth of spaces (for us this is 2 spaces)
set smarttab

" when creating a new line, copy the indentation from the line above
set autoindent



"""""""""""""""""""""""""""""""""""""
" Search
"""""""""""""""""""""""""""""""""""""

" Ignore case when searching
set ignorecase
set smartcase
set hlsearch

" Highlight all pattern matches WHILE typing the pattern
set incsearch
set shortmess-=S



"""""""""""""""""""""""""""""""""""""
" Mix
"""""""""""""""""""""""""""""""""""""

" show the mathing brackets
set showmatch



"""""""""""""""""""""""""""""""""""""
" Keybindings
"""""""""""""""""""""""""""""""""""""

" j k for escape
imap jk <Esc>

" Set space to leader
nnoremap <SPACE> <Nop>
let mapleader=" "

" Toggle relative line number
nnoremap <leader>n :set relativenumber! number<cr>

" Toggle line numbers
" nnoremap <leader>N :set norelativenumber! nonumber!<cr>
noremap <leader>N :call ToggleNumbers()<cr>

" Clear last search highlight
nnoremap <leader>/ :noh<cr>

" Leader bindings for adding new line
map <leader>o o<Esc>
map <leader>O O<Esc>



"""""""""""""""""""""""""""""""""""""
" Functions 
"""""""""""""""""""""""""""""""""""""
function! ToggleNumbers()
  if (&number == 1 || &relativenumber == 1)
    set nonumber 
    set norelativenumber 
  elseif (&number == 0 && &relativenumber == 0)
    set number
    set relativenumber
  endif
endfunction
