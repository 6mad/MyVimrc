runtime! debian.vim
"----------------------------------------------------------------
"----------------------------基本配置----------------------------
"----------------------------------------------------------------
set number  "显示行号
set relativenumber  "显示相对行号·
set cursorline  "高亮当前行
" set cursorcolumn  "高亮当前列
syntax on   "语法高亮
syntax enable
filetype on "侦测文件类型
filetype indent on    "开启文件类型检查，并且载入与该类型对应的缩进规则
filetype plugin on           "针对不同的文件类型加载对应的插件
filetype plugin indent on    " 启用自动补全
set showmode  "在底部显示，当前处于命令模式还是插入模式
set showcmd   "命令模式下，在底部显示，当前键入的指令
set mouse=a   "支持使用鼠标
set t_Co=256    "启用256色
set autoindent  "按下回车键后，下一行的缩进会自动跟上一行的缩进保持一致
set tabstop=2   "按下 Tab 键时，Vim 显示的空格数
set shiftwidth=4  "在文本上按下>>（增加一级缩进）、<<（取消一级缩进）或者==（取消全部缩进）时，每一级的字符数
set expandtab     "由于 Tab 键在不同的编辑器缩进不一致，该设置自动将 Tab 转为空格
set textwidth=80  "一行80个字符
set wrap        "自动折行，即太长的行分成几行显示
set linebreak   "只有遇到指定的符号（比如空格、连词号和其他标点符号），才发生折行。也就是说，不会在单词内部折行
set wrapmargin=2  "指定折行处与编辑窗口的右边缘之间空出的字符数
set scrolloff=5   "垂直滚动时，光标距离顶部/底部的位置（单位：行）
set sidescrolloff=15  "水平滚动时，光标距离行首或行尾的位置（单位：字符）。该配置在不折行时比较有用
set laststatus=2      " 总显示最后一个窗口的状态行；设为1则窗口数多于一个的时候显示最后一个窗口的状态行；0不显示最后一个窗口的状态行"
set ruler             "在状态栏显示光标的当前位置（位于哪一行哪一列）
set showmatch         "光标遇到圆括号、方括号、大括号时，自动高亮对应的另一个圆括号、方括号和大括号
set showtabline=2     "总是显示标签栏"
set hlsearch          "搜索时，高亮显示匹配结果
set ignorecase        "搜索忽略大小写
set nobackup        "不创建备份文件。默认情况下，文件保存时，会额外创建一个备份文件，它的文件名是在原文件名的末尾，再添加一个波浪号（〜）
set noswapfile
set helplang=cn                " 中文文档"
set nocompatible      "设置不兼容vi
set encoding=utf-8    "使用 utf-8 编码
set fenc=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1
set fileformat=unix
set fileformats=unix,mac,dos
set completeopt=preview,menuone
" set listchars=tab:>-,space:▯        "Tab和Space的显示
set list
set backupdir=~/.config/nvim/.backup/ "设置备份文件、交换文件、操作历史文件的保存位置
set autochdir   "自动切换工作目录。这主要用在一个 Vim 会话之中打开多个文件的情况，默认的工作目录是打开的第一个文件的目录。该配置可以将工作目录自动切换到，正在编辑的文件的目录。
set autoread    "打开文件监视。如果在编辑过程中文件发生外部改变（比如被别的编辑器编辑了），就会发出提示。
set wildmenu    "命令模式下，底部操作指令按下 Tab 键自动补全。第一次按下 Tab，会显示所有匹配的操作指令的清单；第二次按下 Tab，会依次选择各个指令。
set autowriteall "进行tag跳转的时候自动保存文件

"----------------------------------------------------------------
"----------------------------vim三种模式下光标样式------------------
"----------------------------------------------------------------
"set gcr=n-v-c:ver25-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r:hor50-Cursor/lCursor
"----------------------------------------------------------------
"----------------------------重新打开一个文件时跳到上一次编辑的地方
"----------------------------------------------------------------
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
"----------------------------------------------------------------
"----------------------------python3路径--------------------------
"----------------------------------------------------------------
let g:python3_host_prog="/usr/bin/python3"
"let g:loaded_python3_provider = 0
"----------------------------------------------------------------
"----------------------------插件管理-----------------------------
"----------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')
Plug 'preservim/nerdtree'                    "文件管理
Plug 'mbbill/undotree'
Plug 'itchyny/lightline.vim'                  "statusline
Plug 'bling/vim-bufferline'
Plug 'kien/rainbow_parentheses.vim'           "彩虹括号
Plug 'tpope/vim-surround'                     "成对括号
Plug 'easymotion/vim-easymotion'              "快速移动
Plug 'mhinz/vim-startify'                     "启动界面
Plug 'junegunn/fzf', {'do':{->fzf#install()}} "快速查找
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'               "快速注释
Plug 'yggdroot/indentline'                    "缩进条
Plug 'joshdick/onedark.vim'                  "主题
Plug 'liuchengxu/space-vim-dark'
Plug 'jiangmiao/auto-pairs'                  "括号补全
Plug 'machakann/vim-highlightedyank'          "高亮复制区域
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install()  }, 'for':['markdown','vim-plug']  }  "markdown
Plug 'dhruvasagar/vim-table-mode',{'for':['markdown','vim-plug']}
Plug 'dkarter/bullets.vim',{'for':['markdown','vim-plug']}
Plug 'lervag/vimtex'                          "LaTeX
"Plug 'neoclide/coc.nvim', {'branch': 'release'} "代码补全
"Plug 'github/copilot'                         "copilot 私人代码秘书？？还是教练？？哈哈
"Plug 'honza/vim-snippets'                     "snippets
"Plug 'SirVer/ultisnips'
"Plug 'Yggdroot/LeaderF', { 'do': './install.sh'  }  "快速查找
call plug#end()
"----------------------------------------------------------------
"----------------------------onedark设置-------------------------
"----------------------------------------------------------------
set termguicolors
let g:onedark_termcolors=256
let g:onedark_hide_endofbuffer=1
colorscheme onedark
hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
hi Comment guifg=#5C6370 ctermfg=59 cterm=italic
let g:lightline = {
    \ 'colorscheme': 'one',
    \ 'active': {
    \ 'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'helloworld' ] ],
    \ 'right': [ [ 'lineinfo' ],
    \              [ 'percent' ],
    \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
    \ },
    \ 'component': {
    \   'helloworld': 'Hello, hubin!'
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head',
    \   'filename': 'LightlineFilename'
    \ },
    \ }
function! LightlineFilename()
    let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
    "let modified = &modified ? ' +' : ''
    "return filename . modified
    return filename
endfunction
"----------------------------------------------------------------
"----------------------------snippets----------------------------
"----------------------------------------------------------------
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsListSnippets="<C-i>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" let g:UltiSnipsSnippetDirectories=["UltiSnips","mysnippets"]
"----------------------------------------------------------------
"----------------------------F5 一键编译运行---------------------
"----------------------------------------------------------------
func! CompileRunGcc()
    exec"w!"
    if &filetype =='c'
        exec"!g++ % -o %<"
        exec"!time ./%<"
    elseif &filetype =='cpp'
        exec":!g++ % -o %<"
        exec":call OpenFloatingWin()"
        exec":term time ./#<"
    elseif &filetype =='java'
        exec"!javac %"
        exec"!time java %<"
    elseif &filetype =='python'
        exec":call OpenFloatingWin()"
        exec ":term time python3 ./#"
    elseif &filetype =='go'
        exec"!go build %<"
        exec"!time go run %"
    elseif &filetype =='markdown'
        exec "MarkdownPreview"
    endif
endfunc
"----------------------------------------------------------------
"----------------------------markdown-preview设置----------------
"----------------------------------------------------------------
let g:mkdp_path_to_chrome = "C:/Program\ Files\ (x86)/Google/Chrome/Application"
"----------------------------------------------------------------
"----------------------------自动写入文件头-----------------------
"----------------------------------------------------------------
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.py,*.html,*.php,*.java exec ":call SetTitle()"
func SetTitle()
    if &filetype=='python'
        call setline(1, "#!/usr/bin/python3")
        call append(line("."), "#-*- encoding: UTF-8 -*-")
    endif
    if &filetype=='cpp'
        call setline(1, "/*************************************************************************")
        call append(line("."), "      > File Name: ".expand("%"))
        call append(line(".")+1, "      > Author: hubin")
        call append(line(".")+2, "      > Mail: 3240855315@qq.com")
        call append(line(".")+3, "      > Created Time: ".strftime("%c"))
        call append(line(".")+4, " ************************************************************************/")
        call append(line(".")+5, "#include<iostream>")
        call append(line(".")+6, "using namespace std;")
        call append(line(".")+7, "")
    endif
    if &filetype=='c'
        call setline(1, "/*************************************************************************")
        call append(line("."), "      > File Name: ".expand("%"))
        call append(line(".")+1, "      > Author: hubin")
        call append(line(".")+2, "      > Mail: 3240855315@qq.com")
        call append(line(".")+3, "      > Created Time: ".strftime("%c"))
        call append(line(".")+4, " ************************************************************************/")
        call append(line(".")+5, "#include<stdio.h>")
        call append(line(".")+6, "")
    endif
    if &filetype=='java'
        call setline(1, "package ".expand("%:r"))
        call append(line(".") , "")
        call append(line(".")+1 , "import java.util.*;")
        call append(line(".")+2 , "import java.lang.*;")
        call append(line(".")+3 , "import java.io.*;")
        call append(line(".")+4 , "")
        call append(line(".")+5 , "/*************************************************************************")
        call append(line(".")+6 , "      > File Name: ".expand("%"))
        call append(line(".")+7 , "      > Author: hubin")
        call append(line(".")+8  , "      > Mail: 3240855315@qq.com")
        call append(line(".")+9  , "      > Created Time: ".strftime("%c"))
        call append(line(".")+10 , " ************************************************************************/")
        call append(line(".")+11  , "")
        call append(line(".")+12  , "public class ".expand("%:r")." {")
        call append(line(".")+13  , "")
        call append(line(".")+14  , "}")
    endif
endfunc
autocmd BufNewFile * normal G "新建文件后，自动定位到文件末尾"
"----------------------------------------------------------------
"----------------------------fzf配置-----------------------------
"----------------------------------------------------------------
let g:fzf_layout = {'window':'call OpenFloatingWin()'}
"----------------------------------------------------------------
"----------------------------浮动窗口----------------------------
"----------------------------------------------------------------
function! OpenFloatingWin()
    let height = &lines - 3
    let width = float2nr(&columns - (&columns * 2 / 10))
    let col = float2nr((&columns - width) / 2)
    " 设置浮动窗口打开的位置，大小等。
    let opts = {
        \ 'relative': 'editor',
        \ 'row': height * 0.3,
        \ 'col': col + 30,
        \ 'width': width * 2 / 3,
        \ 'height': height / 2
        \ }
    let buf = nvim_create_buf(v:false, v:true)
    let win = nvim_open_win(buf, v:true, opts)
    " 设置浮动窗口高亮
    call setwinvar(win, '&winhl', 'Normal:Pmenu')
    setlocal
        \ buftype=nofile
        \ nobuflisted
        \ bufhidden=hide
        \ nonumber
        \ norelativenumber
        \ signcolumn=no
endfunction
"----------------------------------------------------------------
"---------------------------MarkdownPreview---------------------
"----------------------------------------------------------------
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
autocmd Filetype markdown inoremap <buffer> ,, <++>
autocmd Filetype markdown inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
autocmd Filetype markdown inoremap <buffer> ,w <Esc>/ <++><CR>:nohlsearch<CR>"_c5l<CR>
autocmd Filetype markdown inoremap <buffer> ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap <buffer> ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap <buffer> ,s ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap <buffer> ,i ** <++><Esc>F*i
autocmd Filetype markdown inoremap <buffer> ,d `` <++><Esc>F`i
autocmd Filetype markdown inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap <buffer> ,m - [ ]
autocmd Filetype markdown inoremap <buffer> ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,l --------<Enter>
function! s:isAtStartOfLine(mapping)
    let text_before_cursor = getline('.')[0 : col('.')-1]
    let mapping_pattern = '\V' . escape(a:mapping, '\')
    let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
    return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction
inoreabbrev <expr> <bar><bar>
    \ <SID>isAtStartOfLine('\|\|') ?
    \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
    \ <SID>isAtStartOfLine('__') ?
    \ '<c-o>:silent! TableModeDisable<cr>' : '__'

" 打开新的标签页自动打开Startify
"
autocmd TabNewEntered * :Startify

" Move lines Up and Down
nnoremap <DOWN> :m .+1<CR>==
nnoremap <UP> :m .-2<CR>==
vnoremap <DOWN> :m '>+1<CR>gv=gv
vnoremap <UP> :m '<-2<CR>gv=gv

" 在visual模式下快速缩进
vnoremap <Tab> >gv|
vnoremap <s-Tab> <gv
nnoremap > >>_
nnoremap < <<_


"----------------------------------------------------------------
"----------------------------快捷键映射--------------------------
"----------------------------------------------------------------
let mapleader = ";"
nnoremap <F5> :call CompileRunGcc()<CR>
inoremap <F5> <ESC> :call CompileRunGcc()<CR>
nnoremap  <Leader>fw :w!<CR>
nnoremap  <Leader>fq :q<CR>
nnoremap  <Leader>fs :source ~/.config/nvim/init.vim<CR>
nnoremap  <Leader>fu :UndotreeToggle<CR>
nnoremap  <Leader>ff :Files<CR>
nnoremap <silent> <Leader>ft :NERDTreeToggle<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>l :BLines<CR>
nnoremap <silent> <Leader>h :History<CR>
nnoremap <silent> <Leader>q :qall<CR>
nnoremap <silent> <Leader>hh :Startify<CR>
nnoremap <Leader>r :e! %<CR>
nnoremap <BackSpace> :nohl<CR>
inoremap jk <esc>
inoremap ,, <esc>:
nnoremap ,, :
"nnoremap <silent> <Leader>rg :Rg <CR>
"       \ci       注释
"       \\w       easymotion
"

"快捷切换tab
"
noremap <silent><leader>t :tabnew<cr>
noremap <silent><leader>c :tabclose<cr>
noremap <silent><leader>1 :tabn 1<cr>
noremap <silent><leader>2 :tabn 2<cr>
noremap <silent><leader>3 :tabn 3<cr>
noremap <silent><leader>4 :tabn 4<cr>
noremap <silent><leader>5 :tabn 5<cr>
noremap <silent><leader>6 :tabn 6<cr>
noremap <silent><leader>7 :tabn 7<cr>
noremap <silent><leader>8 :tabn 8<cr>
noremap <silent><leader>9 :tabn 9<cr>
noremap <silent><leader>0 :tabn 10<cr>
noremap <silent><s-tab> :tabnext<CR>
inoremap <silent><s-tab> <ESC>:tabnext<CR>


