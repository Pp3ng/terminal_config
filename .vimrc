""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   __   __   __     __    __
"  /\ \ / /  /\ \   /\ "-./  \
"  \ \ \"/   \ \ \  \ \ \-./\ \
"   \ \__|    \ \_\  \ \_\ \ \_\
"    \/_/      \/_/   \/_/  \/_/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=" "

filetype plugin on
filetype indent on
syntax enable

"closes the preview window after you jump to another buffer
set nobackup
set noswapfile
set autoread

set confirm

"encoding as utf-8
set encoding=utf-8
set fileencoding=utf-8

"number and relativenumber
set number
set relativenumber

"tab as 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" c and cpp auto indent
autocmd FileType c,cpp setlocal cindent

" the best set!!!!
inoremap jj <Esc>

"ingore case
set ignorecase
set smartcase
set incsearch

"auto save
autocmd BufLeave * silent! wall

"cursor position in the status line
set ruler

"highlight search
set hlsearch

"highlight c and cpp syntax
autocmd FileType c,cpp let g:cpp_experimental_template_highlight = 1
autocmd FileType c,cpp let c_no_curly_error = 1
autocmd FileType c,cpp let c_no_if0_error = 1
autocmd FileType c,cpp let c_no_error = 1
autocmd FileType c,cpp let c_no_asm_error = 1

"auto complete
set omnifunc=ccomplete#Complete
"set completeopt=menuone,noinsert,noselect
set completeopt=longest,menu
set cpt+=kspell
inoremap <C-Space> <C-x><C-o>

"compile and run c and cpp
"map <F5> :w<CR>:!g++ % -o %< && ./%<<CR>
map <F5> :w<CR>:!make %:r && ./%:r<CR>

"all comments to lower case
map <Leader>tl :%s,//\zs\U\(\w\+\),\L\1,g<CR>

"auto complete brackets
inoremap ( ()<Left>
inoremap {<CR> {<CR>}<C-o>k<C-o>A<CR>
inoremap [ []<Left>
inoremap " ""<Left>
inoremap ' ''<Left>

"remain the cursor position
set scrolloff=5

" fast load
set lazyredraw
set ttyfast

"leader
nnoremap <Leader>sc :nohlsearch<CR>
nnoremap <Leader>cl :%s/\s\+$
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>!! :q!<CR>
nnoremap <Leader>sp :set spell!<CR>
nnoremap <Leader>cc :%s/\/\/.*
" format c and cpp code 
nnoremap <Leader>cf :w<CR>:!clang-format -i %<CR>:e!<CR>

"hightlight the current line
set cursorline
set cursorcolumn
set virtualedit=all
