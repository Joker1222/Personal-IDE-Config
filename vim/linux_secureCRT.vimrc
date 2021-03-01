
"==============================================================================
" vim 内置配置 
"==============================================================================

" 设置 vimrc 修改保存后立刻生效，不用在重新打开
" 建议配置完成后将这个关闭，否则配置多了之后会很卡
" autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 关闭兼容模式
set nocompatible
" 避免delete退格无法向左删除字符
set backspace=2
set nu " 设置行号
set cursorline "突出显示当前行
" set cursorcolumn " 突出显示当前列
set showmatch " 显示括号匹配

" tab 缩进
set tabstop=4 " 设置Tab长度为4空格
set shiftwidth=4 " 设置自动缩进长度为4空格
set autoindent " 继承前一行的缩进方式，适用于多行注释

" 定义快捷键的前缀，即<Leader>
let mapleader=";" 

" ==== 系统剪切板复制粘贴 ====
" v 模式下复制内容到系统剪切板
"vmap <Leader>c "+yy
" n 模式下复制一行到系统剪切板
"nmap <Leader>c "+yy
" n 模式下粘贴系统剪切板的内容
"nmap <Leader>v "+p

" 开启实时搜索
set incsearch
" 搜索时大小写不敏感
set ignorecase
syntax enable
syntax on                    " 开启文件类型侦测
filetype plugin indent on    " 启用自动补全

filetype off

" 退出插入模式指定类型的文件自动保存
"au InsertLeave *.go,*.sh,*.php write

"==============================================================================
" 自定义快捷键 - 常用
"==============================================================================

nmap tt :NERDTreeToggle<cr>      " 打开nerdtree文件目录 
nmap tf :NERDTreeFind<cr>	 " 打开nerdtree文件目录并定位到当前文件位置
nmap <C-r> :GoReferrers<cr>  " 跳转引用
nmap qq :q!<cr> 		 " 不保存退出
nmap zz :wq<cr>			 " 保存退出
nmap no :noh<cr>		 " 取消高亮 

nmap  <C-e>  $
nmap  <C-a>  0
nmap  <C-j> <C-w>j
nmap  <C-h> <C-w>h
nmap  <C-k> <C-w>k
nmap  <C-l> <C-w>l
nmap  , }
nmap  . {

"==============================================================================
" 插件配置 
"==============================================================================

" 插件开始的位置
call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" 可以快速对齐的插件
"Plug 'junegunn/vim-easy-align'

" 用来提供一个导航目录的侧边栏
Plug 'scrooloose/nerdtree'

" 可以使 nerdtree Tab 标签的名称更友好些
Plug 'jistr/vim-nerdtree-tabs'
" c+x 折叠当前节点  s+o 展开当前节点 
" 可以在导航目录中看到 git 版本信息
"Plug 'Xuyuanp/nerdtree-git-plugin'

" 查看当前代码文件中的变量和函数列表的插件，
" 可以切换和跳转到代码中对应的变量和函数的位置
" 大纲式导航, Go 需要 https://github.com/jstemmer/gotags 支持
"Plug 'majutsushi/tagbar'

" 自动补全括号的插件，包括小括号，中括号，以及花括号
"Plug 'jiangmiao/auto-pairs'

" Vim状态栏插件，包括显示行号，列号，文件类型，文件名，以及Git状态
Plug 'vim-airline/vim-airline'

" 有道词典在线翻译
"Plug 'ianva/vim-youdao-translater'

" 代码自动完成，安装完插件还需要额外配置才可以使用
"Plug 'Valloric/YouCompleteMe'

" 可以在文档中显示 git 信息
"Plug 'airblade/vim-gitgutter'


" 下面两个插件要配合使用，可以自动生成代码块
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'

" 配色方案
" colorscheme neodark
"Plug 'KeitaNakamura/neodark.vim'
" colorscheme monokai
"Plug 'crusoexia/vim-monokai'
" colorscheme github 
"Plug 'acarapetis/vim-colors-github'
" colorscheme one 
"Plug 'rakr/vim-one'

" go 主要插件
"Plug 'fatih/vim-go', { 'tag': '*' }
" go 中的代码追踪，输入 gd 就可以自动跳转
"Plug 'dgryski/vim-godef'

" markdown 插件
"Plug 'iamcco/mathjax-support-for-mkdp'
"Plug 'iamcco/markdown-preview.vim'

" 搜索文件 一个非常强大的模糊搜索文件插件 
Plug 'ctrlpvim/ctrlp.vim'			
"帮助文档 :help ctrlp.txt   
"常用快捷键 
"按下 Esc 或 <Ctrl-c> 可退出ctrlp，返回到Vim窗口中
"按下 F5 用于刷新当前操作路径下的文件缓存，可以使用命令 let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp' 设置缓存文件存放路径
"使用 <Ctrl-k> 和 <Ctrl-j> 在模糊搜索结果列表中上下移动 (当然也可以使用键盘上的上下方向键)
"使用 <Ctrl-f> 和 <Ctrl-b> 在查找文件模式、查找缓冲区模式、查找MRU文件几种模式间进行切换 (cycle between modes)
"使用 <Ctrl-d> 在 路径匹配 和 文件名匹配 之间切换 (switch to filename search instead of full path) ，可以通过设置 let g:ctrlp_by_filename = 1 来设置默认使用 文件名匹配 模式进行模糊搜索
"使用 <Ctrl-r> 在 字符串模式 和 正则表达式模式 之间切换 (switch to regexp mode)
"使用 <Ctrl-t> 在新的Vim标签页中打开文件 (open the selected entry in a new tab)
"使用 <Ctrl-v> 垂直分割窗口打开文件
"使用 <Ctrl-x> 水平分割窗口打开文件
"使用 <Ctrl-p> 或` 选择前或后一条历史记录
"使用 <Ctrl-y> 用于当搜索的目标文件不存在时创建文件及父目录 (create a new file and its parent directories)
"使用 <Ctrl-z> 标记或取消标记多个文件， 标记多个文件后可以使用 <Ctrl-o> 同时打开多个文件 (mark/unmark multiple files and to open them)
":CtrlPClearAllCaches 清除文件搜索缓存-新增或删除文件后必须清除缓存才能找得到

" 插件结束的位置，插件全部放在此行上面
call plug#end()


"==============================================================================
" 主题配色 
"==============================================================================

" 开启24bit的颜色，开启这个颜色会更漂亮一些
"set termguicolors
" 配色方案, 可以从上面插件安装中的选择一个使用 
set background=dark " 主题背景 dark-深色; light-浅色


"==============================================================================
" vim-go 插件
"==============================================================================
"let g:go_fmt_command = "goimports" " 格式化将默认的 gofmt 替换
"let g:go_autodetect_gopath = 1
"let g:go_list_type = "quickfix"
"
"let g:go_version_warning = 1
"let g:go_highlight_types = 1
"let g:go_highlight_fields = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_function_calls = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_extra_types = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_generate_tags = 1
"
"let g:godef_split=2


"==============================================================================
" NERDTree 插件
"==============================================================================
" 显示行号
let NERDTreeShowLineNumbers=1
" 打开文件时是否显示目录
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=0
" 设置宽度
" let NERDTreeWinSize=31
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 打开 vim 文件及显示书签列表
let NERDTreeShowBookmarks=2
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1


"==============================================================================
"  majutsushi/tagbar 插件
"==============================================================================

" majutsushi/tagbar 插件打开关闭快捷键
nmap tb :TagbarToggle<CR>

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


"==============================================================================
"  nerdtree-git-plugin 插件
"==============================================================================
"let g:NERDTreeIndicatorMapCustom = {
"    \ "Modified"  : "✹",
"    \ "Staged"    : "✚",
"    \ "Untracked" : "✭",
"    \ "Renamed"   : "➜",
"    \ "Unmerged"  : "═",
"    \ "Deleted"   : "✖",
"    \ "Dirty"     : "✗",
"    \ "Clean"     : "✔︎",
"    \ 'Ignored'   : '☒',
"    \ "Unknown"   : "?"
"    \ }
"
"let g:NERDTreeShowIgnoredStatus = 1



"==============================================================================
"  Valloric/YouCompleteMe 插件
"==============================================================================

" make YCM compatible with UltiSnips (using supertab)
"let g:ycm_key_list_select_completion = ['<C-n>', '<space>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'
"
"" better key bindings for UltiSnipsExpandTrigger
"let g:UltiSnipsExpandTrigger = "<tab>"
"let g:UltiSnipsJumpForwardTrigger = "<tab>"
"let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


"==============================================================================
"  其他插件配置
"==============================================================================

" markdwon 的快捷键
"map <silent> <F5> <Plug>MarkdownPreview
"map <silent> <F6> <Plug>StopMarkdownPreview

" tab 标签页切换快捷键
:nn <Leader>1 1gt
:nn <Leader>2 2gt
:nn <Leader>3 3gt
:nn <Leader>4 4gt
:nn <Leader>5 5gt
:nn <Leader>6 6gt
:nn <Leader>7 7gt
:nn <Leader>8 8gt
:nn <Leader>9 8gt
:nn <Leader>0 :tablast<CR>


"==============================================================================
" GVim 的配置
"==============================================================================
" 如果不使用 GVim ，可以不用配置下面的配置
if has('gui_running')
        colorscheme one
    " 设置启动时窗口的大小
    set lines=999 columns=999 linespace=4

    " 设置字体及大小
        set guifont=Roboto\ Mono\ 13

    set guioptions-=m " 隐藏菜单栏
    set guioptions-=T " 隐藏工具栏
    set guioptions-=L " 隐藏左侧滚动条
    set guioptions-=r " 隐藏右侧滚动条
    set guioptions-=b " 隐藏底部滚动条
            " 在 gvim 下不会和 terminal 的 alt+数字的快捷键冲突，
    " 所以将 tab 切换配置一份 alt+数字的快捷键
    :nn <M-1> 1gt
    :nn <M-2> 2gt
    :nn <M-3> 3gt
    :nn <M-4> 4gt
    :nn <M-5> 5gt
    :nn <M-6> 6gt
    :nn <M-7> 7gt
    :nn <M-8> 8gt
        :nn <M-9> 9gt
        :nn <M-0> :tablast<CR>
endif

"==============================================================================
" ctrlp的配置
"==============================================================================
let g:NERDTreeChDirMode = 2
let g:ctrlp_working_path_mode = 'rw'      				" ctrlp 在当前目录打开
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20' 	" 底部显示搜索结果 搜索结果底部到顶部排序 最小高度1，最大高度20，搜索结果最大数目20，

"==============================================================================
" go-def的配置
"==============================================================================

"let g:godef_split=3 """左右打开新窗口的时候
"let g:godef_same_file_in_same_window=1 """函数在同一个文件中时不需要打开新窗口
