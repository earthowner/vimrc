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



colorscheme mycolor

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
"git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"*****vim scriptes repo*****
Plugin 'The-NERD-tree'
"Plugin 'c.vim'
"******color scheme start
Plugin 'molokai'
Plugin 'SuperTab'
Plugin 'Solarized'
"Plugin 'Ultisnips'
"Plugin 'Syntastic'
"******color scheme end
"*****vim scripts git*****
Plugin 'easymotion/vim-easymotion'
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

"*************Plugin Lua*******************
:let g:lua_compiler_name = '/usr/local/bin/luac'
let g:lua_check_syntax = 1
:let g:lua_define_omnifunc = 1
let g:lua_check_globals = 1
:let b:lua_compiler_name = '/usr/local/bin/lualint'
