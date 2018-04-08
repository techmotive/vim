filetype on                   "检测文件类型
filetype indent on           "针对不同的文件类型采用不同的缩进格式
filetype plugin on           "允许插件
filetype plugin indent on     "启动自动补全

set autoread 
set ignorecase
set smartcase
set incsearch
set ai
set nu
set relativenumber
set ts=4
set expandtab
set mouse=a
set ruler
set smartindent
set autoindent
set nocompatible
set backspace=indent,eol,start
syntax on


let mapleader=" "
nmap <leader>w    :w!<cr>
nmap <leader>q    :q!<cr>
nmap <leader>x    :x!<cr>
nmap <leader>a    A
nmap <leader>v    V
nmap <leader>id    :read !date +\%Y-\%m-\%d<CR>

nmap <leader>r    <C-r>
nmap <leader>l    <C-w>l
nmap <leader>h    <C-w>h
nmap <leader>b    <C-w>B
nnoremap <leader>k    <C-o>
nnoremap <leader>j    <C-i> 
nmap <leader>o    :NERDTreeToggle<CR>
nmap <leader>p    :TagbarToggle<CR>

nmap fj    <C-f>zz
nmap fk    <C-b>zz
nmap gk    {
nmap gj    }

nmap lh ^
nmap le $
"nmap <leader>h H
"nmap <leader>l L
"nmap <leader>m M

" 使更新 _vimrc 更容易
nmap <leader>,s :source ~/.vimrc<CR>
nmap <leader>,v :e ~/.vimrc
" 译释：在normal模式下，先后按下 ,s 两个键执行_vimrc，而 ,v 则是编辑_vimrc
map Y y$

nnoremap <CR> G
nnoremap <BS> gg


"vmap <Leader>y "+y
"vmap <Leader>d "+d
"nmap <Leader>p "+p
"nmap <Leader>P "+P
"vmap <Leader>p "+p
"vmap <Leader>P "+P
vmap <Leader>cw cW
vmap <Leader>dw dW

nmap <Leader><Leader> *
nmap gw *

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]


nnoremap <BS> gg
nnoremap <leader>ls :E<CR>
nmap gr <Esc>:! clear;go run % <CR>
nmap gb <Esc>:! clear;go build % <CR>
nmap gi <Esc>:! clear;go install % <CR>
nmap gf <Esc>:! clear;gofmt -w  % <CR>

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif
execute pathogen#infect()
syntax on
filetype plugin indent on
let g:mkdp_path_to_chrome="chrome"
let g:mkdp_auto_close=0
map <F9> <Plug>MarkdownPreview
map <F10> <Plug>StopMarkdownPreview
map <F5> <Esc>:! clear;go run % <CR>
map <F1> <Esc>:! clear;gofmt -w  % <CR>
map <F8> :TagbarToggle<CR>
map <F7> :NERDTreeToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

"let g:neocomplete#enable_at_startup = 1

"YouCompleteMe 插件配置
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_python_binary_path = '/usr/bin/python3'
nmap<C-a> :YcmCompleter FixIt<CR>

" 让配置变更立即生效
set wildmenu

" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable


inoremap { {<cr><cr>}<ESC>ki    
"noremap ;q <esc>:q!<cr>
"noremap ;w <esc>:w!<cr>
"noremap ;x <esc>:x!<cr>
inoremap ;q <esc>:q!<cr>
inoremap ;w <esc>:w!<cr>
inoremap ;x <esc>:x!<cr>
 
imap ;' <esc>bdei"<esc>pa"
imap ;" <esc>bdei"<esc>pa"
imap ;( <esc>bdei(<esc>pa)
vmap ' xi"<esc>pa"<esc>
vmap ( xi(<esc>pa)<esc>

set cursorline "高亮当前行
set showmatch
set showcmd
set history=1000
set autowrite
filetype plugin indent on "自动检测文件类型并启动相关缩进插件
filetype plugin on "不同文件类型加载相应插件
colorscheme desert "配色沙漠 还有: torte, solarized, molokai, phd, ro
"autocmd BufWritePost $MYVIMRC source $MYVIMRC


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""快速选中""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 选中区块
Bundle 'terryma/vim-expand-region'
vmap <leader><leader> <Plug>(expand_region_expand)
vmap <leader>s <Plug>(expand_region_shrink)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""文件搜索""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'ctrlpvim/ctrlp.vim'

nnoremap <leader>1 yypVr=
set undofile

"noremap / /\v
"vnoremap / /\v

"nnoremap <tab> %
"vnoremap <tab> %

nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
inoremap jj <ESC> 
"nnoremap t f 

"nmap <leader>n [n

