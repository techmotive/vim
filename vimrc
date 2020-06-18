" import common config
source ~/.commonvimrc

nmap <leader><leader>o    :NERDTreeToggle<CR>
nmap <leader><leader>p    :TagbarToggle<CR>

"" 使更新 _vimrc 更容易
"nmap <leader>,s :source ~/.vimrc<CR>
"nmap <leader>,v :e ~/.vimrc
"" 译释：在normal模式下，先后按下 ,s 两个键执行_vimrc，而 ,v 则是编辑_vimrc
"map Y y$

"nnoremap <CR> Gzz
"vnoremap <CR> Gzz
"nnoremap <BS> gg


""vmap <Leader>y "+y
""vmap <Leader>d "+d
""nmap <Leader>p "+p
""nmap <Leader>P "+P
""vmap <Leader>p "+p
""vmap <Leader>P "+P
"vmap <Leader>cw cW
"vmap <Leader>dw dW

""nmap <Leader><Leader> *
"nmap gw *

"vnoremap <silent> y y`]
"vnoremap <silent> p p`]
"nnoremap <silent> p p`]


nnoremap <BS> gg
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
map <F8> :cn<CR>
map <F7> :cp<CR>
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


inoremap {<cr> {<cr><cr>}<ESC>ki    
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
"vmap <leader><leader> <Plug>(expand_region_expand)
"vmap <leader>s <Plug>(expand_region_shrink)


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

nnoremap <f12> <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap  <C-w><C-v><C-l>:e $MYVIMRC<cr>
inoremap jj <ESC> 
"nnoremap t f 

"nmap <leader>n [n

noremap yy "zyy
noremap y "zy
noremap p "zp
noremap d "zd
noremap dd "zdd
noremap x "zx

noremap <leader>cn :cn<cr>
noremap <leader>cp :cp<cr>
noremap <leader>n :cn<cr>

"## 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

set statusline=%F\ [%{&fenc}\ %{&ff}\ L%l/%L\ C%c]\ %=%{strftime('%Y-%m-%d\ %H:%M')}
set laststatus=2


" for easy motions

let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
" 重复上一次操作, 类似repeat插件, 很强大
map <Leader><leader>. <Plug>(easymotion-repeat)
nnoremap <silent> <leader>. :cd %:p:h<CR>

nnoremap gp `[v`]
map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

map <leader>sp :set nonu<cr> :set norelativenumber<cr> :set mouse-=a<cr>
map <leader>spn :set nu<cr> :set relativenumber<cr> :set mouse=<cr>

"2018-05-10 vim突破
imap ;dw <esc>ldwi
imap ;de <esc>ldei
imap ;db <esc>ldbi
imap ;b <esc>bi
imap ;B <esc>Bi
inoremap ;z <esc>ui
inoremap ;u <esc>u
inoremap ;r    <esc><C-r>i
imap ;e <esc>ea
imap ;E <esc>Ea
imap ;f <esc>$a
imap ;a <esc>^i
imap ;p <esc>pa
imap ;o <esc>o
imap ;O <esc>O
imap ;j <esc><Plug>(easymotion-w)
imap ;k <esc><Plug>(easymotion-b)
"nmap k <Plug>(easymotion-w)
"nmap j <Plug>(easymotion-b)
"vmap k <Plug>(easymotion-j)
"vmap j <Plug>(easymotion-k)
nmap j <Plug>(easymotion-w)
nmap k <Plug>(easymotion-b)
nmap <leader>h <Plug>(easymotion-j)
nmap <leader>l <Plug>(easymotion-k)
vmap j <Plug>(easymotion-j)
vmap k <Plug>(easymotion-k)
nmap yq d^
nmap yu d^
nmap dq d^
nmap du d^
nmap dp d$
nmap cp c$
nmap cu c^
vnoremap  <left>   <C-o>zz
vnoremap <right>    <C-i>zz
nnoremap  <left>   <C-o>zz
nnoremap <right>    <C-i>zz
noremap  <left>   <C-o>zz
noremap <right>    <C-i>zz
map <up>   <C-b> 
map <down> <C-f>
nmap gp $
nmap gu ^
"nnoremap m <Plug>(easymotion-w)
"nnoremap q <Plug>(easymotion-b)
"vnoremap m <Plug>(easymotion-j)
"vnoremap q <Plug>(easymotion-k)

silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

map <leader>u <Plug>(easymotion-linebackward)
map <leader>p <Plug>(easymotion-lineforward)

let g:EasyMotion_smartcase = 1
"map  / <Plug>(easymotion-sn)
"omap / <Plug>(easymotion-tn)
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

