vim技巧


## 读取Shell命令相关
【:r!date】 插入日期

上面这个命令，:r 是:read的缩写，!是表明要运行一个shell命令，意思是我要把shell命令的输出读到vim里来。


##创建标记

将光标移到某一行，使用ma命令进行标记。其中，m是标记命令，a是所做标记的名称。

创建标记后，可以使用'a命令，移动到指定标记行的首个非空字符。


	.   	最近编辑的位置
	0-9  	最近使用的文件
	∧   	最近插入的位置
	'   	上一次跳转前的位置
	"   	上一次退出文件时的位置
	[   	上一次修改的开始处
	]   	上一次修改的结尾处
	
	
选定一个词:ve

复制一个词:ye

删除一个词:ye

删除一个方法 {} 里所有的代码：di{ 

清空[]： di[ 


/ 的用法：



	初始，光标在1处：
	yyx
	123456
	789abc
		
	命令"d/a"，即将123456789删除：
	yyx
	abc
	命令"v/a"，即将选中123456789


用复制的内容替换指定文本：

	按v进入可可视模式，选中需要替换的文本，然后p把复制的内容替换掉选中的内容
	
	
	
##vim leader key

Vim's <leader> key is a way of creating a namespace for commands you want to define. Vim already maps most keys and combinations of Ctrl+(some key), so <leader>(some key) is where you (or plugins) can add custom behavior.


vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

nmap <Leader><Leader> V

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]


nnoremap <CR> G
nnoremap <BS> gg


通过以下的配置可以避免缓冲区的内容被删除的文本内容所覆盖（放到~/.vimrc文件的最后
" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()





g, 前一修改处
g; 后一修改处


在 CSS 中对属性进行排序
如果我们需要按照字母表顺序对 CSS 选择器中的行进行排序，只需在可视模式下选择选中的行并输入 :sort，然后就可以对它们进行排序。

h4 {
  font-size: 11px;
  margin: 15px;
  background: red;
}

##在插入模式下删除
如果需要在插入模式、Vim 命令行模式或 Shell 命令行中删除字符、单词或行，有以下的快捷方式：

<C-h> " delete back one character (backspace)
<C-w> " delete back one word
<C-u> " delete back to start of line
<C-k> " delete forward to end of line

##" 使更新 _vimrc 更容易
nmap ,s :source ~/.vimrc
nmap ,v :e ~/.vimrc
" 译释：在normal模式下，先后按下 ,s 两个键执行_vimrc，而 ,v 则是编辑_vimrc

#vim-插入格式化时间
：read !date +\%Y-\%m-\%d

#代码折叠
vim 自身支持多种折叠：手动建立折叠（manual）、基于缩进进行折叠（indent）、基于语法进行折叠（syntax）、未更改文本构成折叠（diff）等等，其中，indent、syntax 比较适合编程

" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

操作：za，打开或关闭当前折叠；

zi，打开所有折叠。

#快速开关注释
插件 NERD Commenter（https://github.com/scrooloose/nerdcommenter ）

常用操作：

<leader>cc，注释当前选中文本，如果选中的是整行则在每行首添加 //，如果选中一行的部分内容则在选中部分前后添加分别 /、/；
<leader>cu，取消选中文本块的注释。

#函数跳转

gd跳转。ctrl+o返回


#vim 多窗口操作

vim  -o  file1 file2 #水平分割成两半的窗口

vim  -O  file1 file2  #垂直分割两半的窗口

:sp 将当前窗口水平分割成两半

:vs 将当前窗口垂直分割成两半


#nerdtree 命令
o 打开关闭文件或者目录

t 在标签页中打开

T 在后台标签页中打开

! 执行此文件

p 到上层目录

P 到根目录

K 到第一个节点

J 到最后一个节点

u 打开上层目录

m 显示文件系统菜单（添加、删除、移动操作）

? 帮助

q 关闭

# Tagbar 命令
 p: 跳到定义位置，但光标仍然在tagbar原位置
 
 *: 展开所有标签

 =: 折叠所有标签
 
 o: 在折叠与展开间切换，按o键，折叠标签，再按一次o，则展开标签，如此来回切换

#v 命令

vi{ 选中{}中间的内容,不包括{}
va{ 选中{}中间内容，包括{}
vi( 选中()中间内容
vi< 选中<>中间内容
vi[ 选中[]中间内容
vit 选中中间的内容
vi” 选中”"中间内容
vi’ 选中”中间的内容
vis 选中一个句子
viw选中一个单词
vip 选中一个段落

#显示行号的好处

可以用123gg这样的命令快速跳转到指定行

#插件管理器  vundle

安装：

`git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle`

常用命令：

PluginInstall

PluginClean


#r命令使用

noremap <leader>1 yypVr=
我把这个定义<leader>1看作为一个函数，它执行以下操作：

*拷贝/复制当前行。 *粘贴在下面（然后向下移动到粘贴的版本）。 *选择被复制行。 *用= 替换每个字符。

#"zz"命令
会把当前行置为屏幕正中央

#t 命令
to

#历史记录
如果你知道你用过的某个搜索字串的开头, 你就可以在键入这个开头
部分之后再按上箭头键. 比如上例中"/o<Up>"
1Vim就会把"/one"放在命令
行上.
以":"开始的命令也有一个历史记录. 它让你找到用过的冒号命令重
复执行它.

#vimgrep

vimgrep /匹配模式/[g][j] 要搜索的文件/范围 
g：表示是否把每一行的多个匹配结果都加入
j：表示是否搜索完后定位到第一个匹配位置

vimgrep /pattern/ %           在当前打开文件中查找
vimgrep /pattern/ *             在当前目录下查找所有
vimgrep /pattern/ **            在当前目录及子目录下查找所有
vimgrep /pattern/ *.c          查找当前目录下所有.c文件
vimgrep /pattern/ **/*         只查找子目录

:cn                                          查找下一个
:cp                                          查找上一个
:copen                                    打开quickfix
:cw                                          打开quickfix
:cclose                                   关闭qucikfix
:help vimgrep                       查看vimgrep帮助


#使用vimdiff查看不同

`vimdiff main.c~ main.c`

跳到不同之处:[c ]c

dp: diff put	

do: diff obtain 



#set relativenumber(显示相对行号)

我无意间发现的一个十分实用的技巧，比set number显示行号更好用。通过这个设置，行号的显示会根据当前的光标的相对位置显示成偏移数，并动态变化。这个好处是，可以利用数字+j 数字+k来进行多行跳转，因为是编译行数，所以数字不会太大。否则就算要向下移动10行，我们可能也需要用138gg。



#前进后退

CTRL-O：后退
CTRL-I 或者 TAB： 前进


#00idesu [ESC] → 

会写下 “desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu desu “


#v2i/v2a
假设你有一个字符串 (map (+) ("foo")).而光标键在第一个 o 的位置。
v2i) → 会选择 map (+) ("foo")
v2a) → 会选择 (map (+) ("foo"))


#<C-N><C-P>           

插入模式下的单词自动完成


# visual 模式, 轻松添加其他的 HTML Tags)
:vmap ;b \"zdi<b><C-R>z</b><ESC>  :在visual模式下选中的文字前后分别加上<b>和</b>


#选中部分内容写入另外一个文件
用v选中，然后输入:w /another/file/name

:map   <f7>   :\'a,\'bw! /path/file
" 译释：map是映射一个normal模式下的键
" 这里是把F7键映射成把标记a到标记b中间的内容另存为一个文件/path/file


