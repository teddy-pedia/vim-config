"显示行号
set nu

"启动时隐去援助提示
set shortmess=atI

"语法高亮
syntax on

"不需要备份
set nobackup

set nocompatible

"没有保存或文件只读时弹出确认
set confirm

"鼠标可用
set mouse=a

"tab缩进
set tabstop=2
set shiftwidth=4
set expandtab
set smarttab

"文件自动检测外部更改
set autoread

"c文件自动缩进
set cindent

"自动对齐
set autoindent

"智能缩进
set smartindent

"高亮查找匹配
set hlsearch

"显示匹配
set showmatch

"显示标尺，就是在右下角显示光标位置
set ruler

"去除vi的一致性
set nocompatible

"设置键盘映射，通过空格设置折叠
nnoremap <space> @=((foldclosed(line('.')<0)?'zc':'zo'))<CR>
""""""""""""""""""""""""""""""""""""""""""""""
"不要闪烁
set novisualbell

"启动显示状态行
set laststatus=2

"浅色显示当前行
autocmd InsertLeave * se nocul

"用浅色高亮当前行
autocmd InsertEnter * se cul

"显示输入的命令
set showcmd

"被分割窗口之间显示空白
set fillchars=vert:/
set fillchars=stl:/
set fillchars=stlnc:/

" 插件安装
call plug#begin('~/.vim/plugged')
Plug 'joshdick/onedark.vim'
Plug 'preservim/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'
call plug#end()

filetype plugin indent on

" coc-actions
" ctrl + b 跳转到函数，并在新的tab页面中打开
nmap <silent> <C-b> :call CocAction('jumpDefinition', 'tab drop')<CR>

" coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" coc-nvim 插件管理
let g:coc_global_extensions = ['coc-json', 'coc-vimlsp', 'coc-tsserver', 'coc-snippets']

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
" Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" / + n打开or关闭NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" tab线对齐
let g:indentLine_color_term = 239 " 对齐线的颜色
let g:indentLine_char = '|' " 用字符串代替默认的标示线

" ctrl + p 搜索
nmap <C-P> :Files<CR>

" coc的配置
let g:coc_global_extensions = ['coc-json', 'coc-html']

" 配色方案
set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox
" colorscheme onedark
" colorscheme monokai

" airline
let g:airline#extensions#tabline#enabled = 1                " 设置开启tab样式
let g:airline#extensions#tabline#formatter = 'jsformatter'  " 设置默认tab栏样式

" airline-theme
"let g:airline_theme='solarized'
let g:airline_theme='angr'              " 好像还是比较喜欢这个颜色

" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 总是显示状态栏
set laststatus=2

" 禁止折行
set nowrap

" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'

syntax keyword cppSTLtype initializer_list

" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

"允许用退格键删除字符
set backspace=indent,eol,start

"编码设置
set encoding=utf-8

"共享剪切板
set clipboard=unnamed

inoremap jj <Esc>

" don't write backup file if vim is being called by "crontab -e"
au bufwrite /private/tmp/crontab.* set nowritebackup nobackup
" don't write backup file if vim is being called by "chpass"
au bufwrite /private/etc/pw.* set nowritebackup nobackup
