func! myspacevim#before() abort

  " ------------------- START  -----------------------
  "
  "let g:python_host_prog = '/usr/local/bin/python2.7'
  "let g:python3_host_prog = '/usr/local/opt/python@3.9/bin/python3'
  let g:python3_host_prog = '~/venv3.9.7/bin/python'
  let g:loaded_python_provider = 0
  "let g:loaded_python3_provider = 0
  " markdown 语法隐藏禁用 plasticboy/vim-markdown(折行、语法隐藏、高亮等)
  let g:vim_markdown_conceal = 1
  "let g:vim_markdown_folding_disabled = 0
  " yaml 语法加亮
  let g:vim_markdown_frontmatter = 0
  let g:vim_markdown_toml_frontmatter = 0
  let g:vim_markdown_json_frontmatter = 0

  "" 重新映射 leader 键
  let g:mapleader = ','

  " 增加spacevim 背景透明模式
  func! s:transparent_background()
    highlight Normal guibg=NONE ctermbg=NONE
    highlight NonText guibg=NONE ctermbg=NONE
  endf
  autocmd ColorScheme * call s:transparent_background()

  "  设置自动屏幕边缘自动折行
  " -------------------------
  set wrap

  "" 重新映射 window 键位
  " let g:spacevim_windows_leader = 'c'

  "call SpaceVim#custom#SPC('nnoremap', ['s', 'f'], 'Vista finder', 'search ctags simbols', 1)
  "call SpaceVim#custom#SPC('nnoremap', ['s', 'F'], 'LeaderfFunction!', 'list functions', 1)

  "" 让file tree 显示文件图标，需要 terminal 安装 nerd font
  let g:spacevim_enable_vimfiler_filetypeicon = 1

  "" 书签选中之后自动关闭 quickfix window
  let g:bookmark_auto_close = 1

  "" ctrl + ] 查询 cppman
  "" 如果想让该快捷键自动查询 man，将Cppman 替换为 Cppman!
  "autocmd FileType c,cpp noremap <C-]> <Esc>:execute "Cppman " . expand("<cword>")<CR>

  "" 让光标自动进入到popup window 中间
  "let g:git_messenger_always_into_popup = v:true

  "" 设置映射规则，和 spacevim 保持一致
  "call SpaceVim#custom#SPC('nnoremap', ['g', 'm'], 'GitMessenger', 'show commit message in popup window', 1)
  "call SpaceVim#custom#SPC('nnoremap', ['g', 'l'], 'FloatermNew lazygit', 'open lazygit in floaterm', 1)

  " 设置默认的pdf阅览工具
  " let g:vimtex_view_method = 'zathura'



  " 保证在插入模式<F4>可以 toggle floaterm
  inoremap  <silent>   <F4>   :FloatermNew bash<CR>
  nnoremap  <silent>   <F4>   :FloatermNew bash<CR>
  tnoremap  <silent>   <F4>   <C-\><C-n>:FloatermNew<CR>

  let g:floaterm_keymap_new    = '<C-n>'
  let g:floaterm_keymap_prev   = '<C-h>'
  let g:floaterm_keymap_next   = '<C-l>'

  "" 关闭所有隐藏设置 浮动窗口
  let g:tex_conceal = ""

  "" 修复ctrl+m 多光标操作选择的bug，但是改变了ctrl+v进行字符选中时将包含光标下的字符
  set selection=inclusive
  set selectmode=mouse,key
  let g:multi_cursor_use_default_mapping=0
  let g:multi_cursor_start_word_key      = '<C-m>'
  let g:multi_cursor_select_all_word_key = '<A-m>'
  let g:multi_cursor_start_key           = 'g<C-m>'
  let g:multi_cursor_select_all_key      = 'g<A-m>'
  let g:multi_cursor_next_key            = '<C-m>'
  "let g:multi_cursor_prev_key            = '<C-p>'
  let g:multi_cursor_skip_key            = '<C-x>'
  let g:multi_cursor_quit_key            = '<Esc>'
  "
  " 焦点消失的时候自动保存
  "
  autocmd FocusLost * :wa
  autocmd FocusGained,BufEnter * :checktime

  " 设置可以高亮的关键字
  if has("autocmd")
    " Highlight TODO, FIXME, NOTE, etc.
    if v:version > 701
      autocmd  FileType c,py,sh call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
      autocmd  FileType c,py,sh call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
    endif
  endif

  " 自定义自己的spc快捷键
  " -------------------------
  " vim-table-mode  Markdown 文件自动制表
  call SpaceVim#custom#SPCGroupName(['k'], '+快速')
  call SpaceVim#custom#SPC('nore', ['k', 't'], 'TableModeToggle', 'MarkDown Tables', 1)
  " markdown table
  " map <leader>mt :TableModeToggle<cr>
  " 配置markdown快速编辑键 {{{
  autocmd Filetype markdown map <leader>w yiWi[<esc>Ea](<esc>pa)
  autocmd Filetype markdown inoremap <buffer> <leader>f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
  autocmd Filetype markdown inoremap <buffer> <leader>w <Esc>/ <++><CR>:nohlsearch<CR>"_c5l<CR>
  autocmd Filetype markdown inoremap <buffer> <leader>n ---<Enter><Enter>
  autocmd Filetype markdown inoremap <buffer> <leader>b **** <++><Esc>F*hi
  autocmd Filetype markdown inoremap <buffer> <leader>s ~~~~ <++><Esc>F~hi
  autocmd Filetype markdown inoremap <buffer> <leader>i ** <++><Esc>F*i
  autocmd Filetype markdown inoremap <buffer> <leader>d `` <++><Esc>F`i
  autocmd Filetype markdown inoremap <buffer> <leader>c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
  autocmd Filetype markdown inoremap <buffer> <leader>m - [ ]
  autocmd Filetype markdown inoremap <buffer> <leader>p ![](<++>) <++><Esc>F[a
  autocmd Filetype markdown inoremap <buffer> <leader>a [](<++>) <++><Esc>F[a
  autocmd Filetype markdown inoremap <buffer> <leader>1 #<Space><Enter><++><Esc>kA
  autocmd Filetype markdown inoremap <buffer> <leader>2 ##<Space><Enter><++><Esc>kA
  autocmd Filetype markdown inoremap <buffer> <leader>3 ###<Space><Enter><++><Esc>kA
  autocmd Filetype markdown inoremap <buffer> <leader>4 ####<Space><Enter><++><Esc>kA
  autocmd Filetype markdown inoremap <buffer> <leader>l --------<Enter>
  autocmd Filetype markdown inoremap <buffer> <leader>p3 ###<Space> <++> - 项目组合 ###<Esc>I,f
  autocmd Filetype markdown inoremap <buffer> <leader>p4 ####<Space> <++> - 项目组合 ####F[a
  "}}}

  " ------------------- END -----------------------
  "
endf

func! myspacevim#after() abort
  " ------------------- START  -----------------------
  " 放到此处用于重写 SpaceVim 映射的 F2
  " nnoremap  <F2>  :Vista!!<CR>
  nnoremap  <F9>  :TagbarToggle<CR>

  " Quickly save the current file
  nnoremap <leader>w :w<CR>

  " 去掉搜索高亮
  noremap <silent><leader>/ :nohls<CR>

  " vim 配合tmux 真彩色
  if has("termguicolors")
    " fix bug for vim
    "set t_8f=^[[38;2;%lu;%lu;%lum
    "set t_8b=^[[48;2;%lu;%lu;%lum
    "
    " enable true color
    set termguicolors
  endif

  " 代码折叠
  " 折叠方法
  " manual    手工折叠
  " indent    使用缩进表示折叠
  " expr      使用表达式定义折叠
  " syntax    使用语法定义折叠
  " diff      对没有更改的文本进行折叠
  " marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
  "set foldmethod=indent
  set foldmethod=expr
  set foldlevel=99
  "set foldlevel=4

  " 设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制, 不需要可以去掉
  " 好处：误删什么的，如果以前屏幕打开，可以找回
  " set t_ti= t_te=

  " F1 废弃这个键,防止调出系统帮助
  " I can type :help on my own, thanks.  Protect your fat fingers from the evils of <F1>
  noremap <F1> <Esc>"

  " Go to home and end using capitalized directions
  noremap H ^
  noremap L $

  " 新建tab  Ctrl+t
  nnoremap <C-t>     :tabnew<CR>
  inoremap <C-t>     <Esc>:tabnew<CR>

  " Quickly close the current window
  "nnoremap <leader>q :q<CR>

  " 交换 ' `, 使得可以快速使用'跳到marked位置
  nnoremap ' `
  nnoremap ` '

  " switch # *
  nnoremap # *
  nnoremap * #

  " 复制选中区到系统剪切板中
  vnoremap <leader>y "+y

  " disable showmatch when use > in php
  autocmd BufWinEnter *.php set mps-=<:>

  set expandtab  " 展开tab

" F3 显示可打印字符开关
"nnoremap <F3> :set signcolumn! signcolumn?<CR>
" set signcolumn=no
" F4 换行开关
"nnoremap <F4> :set wrap! wrap?<CR>

" F6 语法开关，关闭语法可以加快大文件的展示
nnoremap <F6> :set signcolumn! signcolumn?<CR>
"nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>

set pastetoggle=<F5>            "    when in insert mode, press <F5> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented

" F5 set paste问题已解决, 粘贴代码前不需要按F5了
" F5 粘贴模式paste_mode开关,用于有格式的代码粘贴
" Automatically set paste mode in Vim when pasting in insert mode
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" 分屏窗口移动, Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" 进入搜索Use sane regexes"
nnoremap / /\v
vnoremap / /\v


" 去掉搜索高亮
noremap <silent><leader>/ :nohls<CR>

" F10 run
"map <F10> :call SpaceVim#plugins#runner#open()<CR>
noremap <F10> :call SpaceVim#plugins#runner#open()<CR>

" autodir
"let g:spacevim_project_rooter_automatically = 0


" 处理背景不透明问题
"hi! Normal ctermbg=NONE guibg=NONE
"hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum

" 具体编辑文件类型的一般设置，比如不要 tab 等
" Disable syntax for md
autocmd BufRead,BufNewFile {*.markdown,*.mdown,*.mkdn,*.md,*.mkd,*.mdwn,*.mdtxt,*.mdtext,*.text} set filetype=markdown
    \ set expandtab
    \ set foldmethod=expr
    \ set foldlevel=99
autocmd FileType markdown setlocal syntax=off spell

" Other autocmd
autocmd FileType ruby,javascript,html,css,xml,markdown set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd BufRead,BufNewFile *.part set filetype=html
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript tabstop=4 shiftwidth=4 softtabstop=4 expandtab ai

" for # indent, python文件中输入新行时#号注释不切回行首
autocmd BufNewFile,BufRead *.py inoremap # X<c-h>#

autocmd BufNewFile,BufRead *.py
    \ set expandtab       |" replace tabs with spaces
    \ set autoindent      |" copy indent when starting a new line
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set foldmethod=indent
    \ set foldlevel=99

" 保存python文件时删除多余空格
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

  " ------------------- END -----------------------
endf
