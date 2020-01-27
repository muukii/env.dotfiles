" vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
call vundle#rc()

Plugin 'itchyny/lightline.vim'
Plugin 'taohex/lightline-buffer'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'thinca/vim-quickrun'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'fatih/vim-go'
Plugin 'cfdrake/vim-carthage'
Plugin 'Shougo/NeoComplete'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/nerdtree'
Plugin 'rhysd/vim-crystal'
Plugin 'tikhomirov/vim-glsl'
Plugin 'tpope/vim-fugitive'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'bumaociyuan/vim-swift'

filetype plugin indent on

filetype plugin on
filetype indent on

" Syntax
syntax enable

colorscheme molokai
set t_Co=256
let g:molokai_original = 1
let g:rehash256 = 1

set laststatus=2
set showtabline=2
set noshowmode

set noundofile
set nobackup
"set noswapfile

set hidden
set wrap

set tabstop=2
set shiftwidth=2
set autoindent
set expandtab

set title
set mouse=a
set number
set numberwidth=5
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac
set cursorline
set autoread
set shiftround
set clipboard+=unnamed
set wildmode=longest:list,full
set list
set backspace=indent,eol,start
"set listchars=tab:¦\ ,eol:¬,trail:-,nbsp:%,extends:>,precedes:<
"set listchars=eol:¬,tab:▸\ 
set listchars=eol:¬,tab:▸\ 
"set fillchars=vert:\ ,fold:\ ,diff:\
"
" Fillchars Options {{{1
set fillchars=stl:\ 
set fillchars+=stlnc:\ 
set fillchars+=vert:\|
set fillchars+=fold:\⋅
set fillchars+=diff:-

" Folding {{{1
"
"set foldopen=all
set foldenable

" keybind {{{1
" like Emacs on InsertMode

imap <C-k> <right><ESC><S-d>a
imap <C-y> <ESC>pi
imap <C-d> <Del>

imap <C-a>  <Home>
imap <C-e>  <End>
imap <C-b>  <Left>
imap <C-f>  <Right>
imap <C-p>  <Up>
imap <C-n>  <Down>

" like Emacs on CommandMode
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>

" alias ESC
imap <C-c> <ESC>

set hidden  " allow buffer switching without saving
set showtabline=2  " always show tabline

" lightline
" use lightline-buffer in lightline
let g:lightline = {
\ 'colorscheme': 'powerline',
\ 'tabline': {
	\ 'left': [ [ 'bufferinfo' ], [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
	\ 'right': [ [ 'close' ], ],
	\ },
\ 'component_expand': {
	\ 'buffercurrent': 'lightline#buffer#buffercurrent2',
	\ },
\ 'component_type': {
	\ 'buffercurrent': 'tabsel',
	\ },
\ 'component_function': {
	\ 'bufferbefore': 'lightline#buffer#bufferbefore',
	\ 'bufferafter': 'lightline#buffer#bufferafter',
	\ 'bufferinfo': 'lightline#buffer#bufferinfo',
	\ },
\ }

" remap arrow keys
nnoremap <Left> :bprev<CR>
nnoremap <Right> :bnext<CR>

" lightline-buffer ui settings
" replace these symbols with ascii characters if your environment does not support unicode
let g:lightline_buffer_logo = '❯ '
let g:lightline_buffer_readonly_icon = '✤'
let g:lightline_buffer_modified_icon = '◉'
let g:lightline_buffer_git_icon = '✹'
let g:lightline_buffer_ellipsis_icon = '..'
let g:lightline_buffer_expand_left_icon = '‹ '
let g:lightline_buffer_expand_right_icon = ' ›'
let g:lightline_buffer_active_buffer_left_icon = ''
let g:lightline_buffer_active_buffer_right_icon = ''
let g:lightline_buffer_separator_icon = ' '

" lightline-buffer function settings
let g:lightline_buffer_show_bufnr = 1
let g:lightline_buffer_rotate = 0
let g:lightline_buffer_fname_mod = ':t'
let g:lightline_buffer_excludes = ['vimfiler']

let g:lightline_buffer_maxflen = 30
let g:lightline_buffer_maxfextlen = 3
let g:lightline_buffer_minflen = 16
let g:lightline_buffer_minfextlen = 3
let g:lightline_buffer_reservelen = 20

" fzf
set rtp+=~/.fzf
nnoremap <silent><C-p> :FZF<CR>

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" NERDTree
nnoremap <silent><C-e> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 2

" Syntax
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile Fastfile set filetype=ruby
au BufRead,BufNewFile Podfile set filetype=ruby

