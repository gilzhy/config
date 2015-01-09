runtime! debian.vim
if has("syntax")
  syntax on
endif

syn on                      "语法支持

"common conf {{             通用配置
" set autoindent              "自动缩进
" set smartindent             "自动选择对齐方式
" set expandtab               "设置tab和缩进
" set tabstop=4


" 设置 tabstop
set ts=4
set sw=4
set expandtab " 将 tab 用空格代替
set autoindent

" 自动显示括号匹配
set showmatch

set cursorline              "为光标所在行加下划线
set number                  "显示行号
set ignorecase              "检索时忽略大小写

" 编码支持
set fileencodings=utf-8,gb18030,gbk

set hls                     "检索时高亮显示匹配项
set helplang=cn             "帮助系统设置为中文
filetype plugin on
filetype indent on
set mouse=a

" 快捷键
map <C-s> :w<CR>
map <C-a> ggVG
map <C-l> ggVGd

:command Q q
:command W w
:command Qa qa
:command QA qa
:command WQ wq
:command Wq wq

" coding
imap () ()<left>
imap [] []<left>
imap "" ""<left>
imap '' ''<left>
imap <> <><left>
imap {} {}<left>
"imap **** ****<left><left>
"imap {} {<CR><CR>}<up><tab>

" django
"imap %% {% block  %}<CR><CR>{% endblock %}<up><up><left><left><left>
"imap {{ {{  }}<left><left><left>
"imap %if {% if  %}<CR><CR>{% endif %}<up><up><left><left><left>
"imap %for {% for  %}<CR><CR>{% endfor %}<up><up><left><left><left>
"imap precode <pre><code></code></pre><left><left><left><left><left><left><left><left><left><left><left><left><left>

" c & c++
ab #i #include
"imap using using namespace std;<CR>
"imap scanf scanf("%", &);<left><left><left><left><left><left>

"conf for tabs, 为标签页进行的配置，通过ctrl h/l切换标签等
let mapleader = ','
nnoremap <C-k> gt
nnoremap <C-j> gT
nnoremap <leader>t : tabe<CR>

" Markdown -> html
nnoremap <leader>m :!python -m markdown -x markdown.extensions.toc -x markdown.extensions.codehilite -x markdown.extensions.tables -x markdown.extensions.smarty -x mathjax % > %:r.html<CR>

"pathogen是Vim用来管理插件的插件
call pathogen#infect()

map fg : Dox<cr>
let g:DoxygenToolkit_authorName="Young"
let g:DoxygenToolkit_licenseTag="My own license\<enter>"
let g:DoxygenToolkit_undocTag="DOXIGEN_SKIP_BLOCK"
let g:DoxygenToolkit_briefTag_pre = "@brief "
let g:DoxygenToolkit_paramTag_pre = "@param "
let g:DoxygenToolkit_returnTag = "@return "
let g:DoxygenToolkit_briefTag_funcName = "no"
let g:DoxygenToolkit_maxFunctionProtoLines = 30

autocmd BufNewFile *.[ch],*.hpp,*.cpp,*.java exec ":call AddTitleC()"
autocmd BufNewFile *.py exec ":call AddTitleP()"

function AddTitleP()
	call append(0, "#coding=utf-8")
	call append(1, "")
	call append(2, "\"\"\"")
	call append(3, "".expand("%:t"))
	call append(4, "@version 1.0 ".strftime("%Y.%m.%d"))
	call append(5, "@author Jay Young" )
	call append(6, "\"\"\"")
	call append(7, "")
endfunction

function AddTitleC()
	call append(0, "/**")
	call append(1, " * ".expand("%:t"))
	call append(2, " * @version 1.0 ".strftime("%Y.%m.%d"))
	call append(3, " * @author Jay Young" )
	call append(4, " */")
	call append(5, "")
endfunction
 
 " 显示
":set list lcs=tab:\|\ 
:set list
:set listchars=tab:>-,trail:-
 
set t_Co=256
colors molokai
highlight TabLine term=underline cterm=bold ctermfg=White ctermbg=Black
highlight TabLineSel term=bold cterm=bold ctermbg=White ctermfg=Black

highlight Pmenu ctermbg=125 gui=bold
highlight PmenuSel ctermbg=28 gui=bold
highlight Search ctermbg=3 gui=bold
