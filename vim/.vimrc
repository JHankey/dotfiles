""""""""""""""""""""""""""""""""""""
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

" Leader key timeout option
set notimeout
set nottimeout

" Vertical line ruler
set colorcolumn=100
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Disable line wrapping
set nowrap



""""""""""""""""""""""""""""""""""""
" Line
""""""""""""""""""""""""""""""""""""

" Show relative line numbers
set relativenumber
set number

" Enable Explore relative line numbers
let g:netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'
let g:netrw_liststyle = 3
let g:netrw_keepdir = 0
let g:netrw_winsize = 30
let g:netrw_banner = 0
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
hi! link netrwMarkFile Search


"""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""

" vim-plug UNIX install command below
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.vim/plugged')

" Lightline Status bar
Plug 'https://github.com/itchyny/lightline.vim'

" Fzf (fuzzy finder) integration
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Hook to ensure fzf is at latest version
Plug 'junegunn/fzf.vim'

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

" Set Y to copy to end of line (default is copy full line)
nnoremap Y y$

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

" Move lines
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv
inoremap <C-j> <esc>:m .+1<cr>==
inoremap <C-k> <esc>:m .-2<cr>==
nnoremap <leader>J :m .+1<cr>==
nnoremap <leader>K :m .-2<cr>==

" Keep cursor centered while doing various operations
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Move between splits
nnoremap <leader>h :wincmd h<cr>
nnoremap <leader>j :wincmd j<cr>
nnoremap <leader>k :wincmd k<cr>
nnoremap <leader>l :wincmd l<cr>

" Delete current buffer
nnoremap <leader>wq :quit<cr>

" Resize windows
nnoremap <leader>= :vertical resize +5<cr>
nnoremap <leader>- :vertical resize -5<cr>

" FZF bindings
nnoremap <leader>sg :GFiles<cr>
nnoremap <leader>sf :Files<cr>
nnoremap <leader>sb :Buff:cr>
nnoremap <leader>sr :Rg<cr>
nnoremap <leader>sS :Lines<cr>
nnoremap <leader>ss :BLines<cr>
nnoremap <leader>sm :Marks<cr>
nnoremap <leader>st :Tags<cr>
nnoremap <leader>sw :Windows<cr>
nnoremap <leader>sh :History<cr>
nnoremap <leader>sH :History:<cr>

" Open Explorer
nnoremap <leader>e :Vex



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
