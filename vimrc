"*********************************************基础配置***************************************************

syntax on
set number
hi Comment ctermfg=DarkCyan
set backspace=2
set mouse=a
set selection=exclusive
set selectmode=mouse,key
set hlsearch
set incsearch
set autoindent
set showmatch
set wildmenu
set noswapfile
set nobackup
set t_Co=256 
set tabstop=4
set softtabstop=4
"*****vim scripts git*****
"set background=dark						 "背景使用黑色
set encoding=utf-8
set fileencodings=utf-8
set termencoding=utf-8
set shiftwidth=4
autocmd InsertLeave * se nocul					"离开消除当前行高亮
autocmd InsertEnter * se cul				 	"输入显示当前行高亮
set ruler							"状态栏显示标尺
set showcmd
set showmode
set cmdheight=1 			 			"命令行（在状态行下）的高度，设置为1  
set statusline=%F%m%r%h%w\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "
set laststatus=0    " 启动显示状态行(1),总是显示状态行(2) 
set foldenable      " 允许折叠
set foldmethod=manual   " 手动折叠
set nocompatible 						 "去掉讨厌的有关vi一致性模式
set modifiable
set autoread
set autowrite
set clipboard=unnamed
if version >= 603
	set helplang=cn
	set encoding=utf-8
endif



colorscheme molokai

"**********************************************
map  <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G
nnoremap <F2> :g/^\s*$/d<CR> 
"map <F3> :tabnew .<CR>						"列出当前目录文件
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_smartcase = 0


map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l




autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>

"**********************************************插件安装***************************************************
"git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle插件管理安装
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/vundle'
"*****vim scriptes repo*****
Plugin 'The-NERD-tree'
"Plugin 'c.vim'
"******color scheme start
Plugin 'molokai'
Plugin 'Solarized'
"Plugin 'Ultisnips'
"Plugin 'Syntastic'
"******color scheme end
"*****vim scripts git*****
Plugin 'easymotion/vim-easymotion'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'xolox/vim-lua-ftplugin'
Plugin 'xolox/vim-misc'
"*****vim scripts local

"*****vim scripts other

call vundle#end()            " required
filetype plugin indent on    " required
"**********************************************插件配置***************************************************
"*************Plugin NERDTree**************
au VimEnter * NERDTree 


"*************Plugin YCM**************
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_part/ycmd/cpp/ycm/.ycm_extra_conf'
set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
"上下左右键的行为 会显示其他信息
"inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
"inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
"inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"


"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
"let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
"let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1	" 开启 YCM基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2	"从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1	" 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>	
""nnoremap <leader>lo :lopen<CR>	"open locationlist
"nnoremap <leader>lc :lclose<CR>	"close locationlist
inoremap <leader><leader> <C-x><C-o>
""在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
""注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>  


"*************Plugin Lua*******************
:let g:lua_compiler_name = '/usr/local/bin/luac'
let g:lua_check_syntax = 1
:let g:lua_define_omnifunc = 1
let g:lua_check_globals = 1
:let b:lua_compiler_name = '/usr/local/bin/lualint'
