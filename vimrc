" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

filetype plugin on
autocmd! bufwritepost .vimrc source %
"autocmd WinEnter,FocusGained * :setlocal number relativenumber
"autocmd WinLeave,FocusLost   * :setlocal number norelativenumber

scriptencoding utf-8
"match OverLength /\%>80v.\+/

function! QuitAll()
	:execute "quit!"
	call QuitAll()
endfunction

function! ResizeCols(tim)
	:execute 'vertical resize '.a:tim
endfunction

function! Style_openmpi()
	:silent windo execute 'set tabstop=4'
	:silent windo execute 'set shiftwidth=4'
	:silent windo execute 'set softtabstop=0 expandtab'
endfunction

function! Style_freertos()
	:silent windo execute 'set tabstop=4'
	:silent windo execute 'set shiftwidth=4'
	:silent windo execute 'set softtabstop=4 noexpandtab'
endfunction

function! Style_linux()
	:silent windo execute 'set tabstop=8'
	:silent windo execute 'set shiftwidth=8'
	:silent windo execute 'set softtabstop=8 noexpandtab'
endfunction

function! Style_latex()
	:silent windo execute 'noremap  <silent> k gk'
	:silent windo execute 'noremap  <silent> j gj'
	:silent windo execute 'noremap  <silent> 0 g0'
	:silent windo execute 'noremap  <silent> $ g$'
	:silent windo execute 'set linebreak'
endfunction

function! Style_nolatex()
	:silent windo execute 'noremap  <silent> k k'
	:silent windo execute 'noremap  <silent> j j'
	:silent windo execute 'noremap  <silent> 0 0'
	:silent windo execute 'noremap  <silent> $ $'
	:silent windo execute 'set nolinebreak'
endfunction

function! Date()
	:execute 'normal O'
	:execute 'r! date'
	:execute 'normal o'
endfunction

function! Less_me()
	:execute 'w! /tmp/vimtmp'
	:execute '!less /tmp/vimtmp'
endfunction

function! Xclip_me()
	:execute 'w! /tmp/vimtmp'
	:execute 'silent !cat /tmp/vimtmp | xclip'
	:execute 'redraw!'
endfunction

function! Format_80_cols()
":execute 'normal 1GgqG'
	:execute 'normal Gma'
	:execute 'r! fold -s %'
	:execute 'normal `ad1G'
endfunction

" Yank to choose the structure
function! Cc_generate_debug_structures()
	:execute 'silent !rm -rf /tmp/output'
	:execute 'silent !mkdir -p /tmp/output'
	:execute 'vsplit /tmp/output/header.h'
	:execute 'normal p'
	:execute 'w'
	:execute 'silent !/home/z/generic-programming/clang-ast-parsing/1-good/generator /tmp/output/header.h > /tmp/output/header-gen.h'
	:execute 'silent !cformat /tmp/output'
	:execute 'e! /tmp/output/header-gen.h'
	:execute 'redraw!'
endfunction

function! Cc_warn()
	:execute 'silent normal ma[[k'
	:execute 'silent normal VY'
	:execute 'silent !rm -rf /tmp/output'
	:execute 'silent !mkdir -p /tmp/output'
	:execute 'silent vsplit /tmp/output/header.h'
	:execute 'silent normal p'
	:execute 'silent w /tmp/output/header.h'
	:execute 'silent !/home/z/generic-programming/clang-ast-parsing/3-generate-warn-err/generator /tmp/output/header.h | grep SEDME | sed s/XXX_SEDME_YYY/WARN/ > /tmp/output/header-gen.h'
	:execute 'silent q!'
	:execute 'silent normal ``k'
	:execute 'silent r !cat /tmp/output/header-gen.h'
	:execute 'redraw!'
	:execute 'normal ==$Jx'
	:execute 'startinsert!'
endfunction

function! Cc_trace()
	:execute 'silent normal ma[[k'
	:execute 'silent normal VY'
	:execute 'silent !rm -rf /tmp/output'
	:execute 'silent !mkdir -p /tmp/output'
	:execute 'silent vsplit /tmp/output/header.h'
	:execute 'silent normal p'
	:execute 'silent w /tmp/output/header.h'
	:execute 'silent !/home/z/generic-programming/clang-ast-parsing/3-generate-warn-err/generator /tmp/output/header.h | grep SEDME | sed s/XXX_SEDME_YYY/TRACE/ > /tmp/output/header-gen.h'
	:execute 'silent q!'
	:execute 'silent normal ``k'
	:execute 'silent r !cat /tmp/output/header-gen.h'
	:execute 'redraw!'
	:execute 'normal ==$Jx'
	:execute 'startinsert!'
endfunction

function! Tags()
	:execute 'silent !ctags -R'
	:execute 'redraw!'
endfunction

function! Cc_add_header()
	"let curline = getline('.')
	"call inputsave()
	"let str = input('Header name: ')
	:execute 'normal mm'
	let str = expand('%:t:r')
	let str = toupper(str)
	let defstr = str . '_H'
	"call inputrestore()
	let line1 = '#ifndef '. defstr
	let line2 = '#define '. defstr
	let lineX = '#endif /* '. defstr . ' */'

	" first line
	:execute 'normal 1GO' . line1
	" second line
	:execute 'normal o' . line2
	" thirt line blank ...
	:execute 'normal o'

	" last line
	:execute 'normal Go' . lineX
	"call setline('.', curline . ' ' . name)
	"echom a:000
endfunction

function! Diff_them()
	:execute 'windo diffthis'
	:execute 'normal zR'
endfunction

"function! DemoInput()
"	let curline = getline('.')
"	call inputsave()
"	let name = input('Enter name: ')
"	call inputrestore()
"	call setline('.', curline . ' ' . name)
"endfunction

"function! Open_file(...)
	"let ch = getline('.')[col('.') - 1]
	"while ch != ' '
		"echom ch
		":execute 'normal! h'
		"let ch = getline('.')[col('.') - 1]
	"endwhile
	"echom ch
"endfunction
"map <leader>p :call Open_file()



nnoremap <c-e> <c-g>
nnoremap <c-g> <c-e>

inoremap <leader>tn <esc>:tabnew<cr>:e<space>
     map <leader>tn <esc>:tabnew<cr>:e<space>
     map <leader>to :tabonly<cr>
     map <leader>tw :tabclose<cr>
     map <leader>tm :tabmove<cr>
     map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
     map <leader>tg{i} :tabm {i}<cr>
inoremap <leader>l <esc>:tabnext<cr>
     map <leader>l <esc>:tabnext<cr>
inoremap <leader>k <esc>:tabprevious<cr>
     map <leader>k <esc>:tabprevious<cr>
inoremap <leader>s <esc>:vsplit<cr><c-w>w:e<SPACE>
     map <leader>s <esc>:vsplit<cr><c-w>w:e<SPACE>
inoremap <leader>o <esc>:e<SPACE>
     map <leader>o <esc>:e<SPACE>
     map <leader>G  bveyy<esc>:silent !google-chrome-stable https://www.google.gr/search?q=<c-R>" >/dev/null 2>&1
     map <leader>a  bveyy<esc>:silent !google-chrome-stable http://lxr.free-electrons.com/ident?v=3.18\;i=<c-R>" >/dev/null 2>&1 &
inoremap <c-l> <esc><c-w>w
inoremap <c-h> <esc><c-w>W
     map <c-l> <esc><c-w>w
     map <c-h> <esc><c-w>W
inoremap <leader>p <esc><c-w><c-p>
     map <leader>p <esc><c-w><c-p>
inoremap <c-\> <esc>:vsplit<cr><c-w>w<c-]>
     map <c-\> <esc>:vsplit<cr><c-w>w<c-]>
     map <space> wbyeeb<esc>:set hlsearch<cr>:let @/='<c-R>"'<cr>
     map <c-@> <esc>/[}<cr>
inoremap <leader><esc>e :call QuitAll()<cr>
     map <leader><esc>e :call QuitAll()<cr>
inoremap <c-s> <esc>:w<cr>
     map <c-s> <esc>:w<cr>
     map <leader><c-s> <esc>:w! /tmp/1<cr><esc><esc>
     map <c-e> <esc>:q!<cr>
     map <leader>r : exec "normal i".nr2char(getchar())."\e"<cr>
"    map <leader><leader>r : exec "normal a".nr2char(getchar())."\e"<cr>
     map <cr> :call ResizeCols(85)<cr>
     map <leader>] :call ResizeCols(130)<cr>
inoremap <leader>i <esc>?include<cr>:nohl<cr>o#include <.h><left><left><left>
     map <leader>i <esc>?include<cr>:nohl<cr>o#include <.h><left><left><left>
inoremap <leader>I <esc>?include<cr>:nohl<cr>o#include ".h"<left><left><left>
     map <leader>I <esc>?include<cr>:nohl<cr>o#include ".h"<left><left><left>
     map <c-j> 6j
     map <c-k> 6k
     map <esc><c-j> 30j
     map <esc><c-k> 30k
inoremap <m-c-j> <esc>6<c-q>a
     map <m-c-j> <esc>6<c-q>
     map <tab> <esc>6<c-q>
inoremap <m-c-k> <esc>6<c-y>a
     map <m-c-k> <esc>6<c-y>
     map <s-tab> <esc>6<c-y>
     map <m-j> <esc>6<c-q>6j
     map <m-k> <esc>6<c-y>6k
     map <c-n> <esc>:next<cr>
     map <c-p> <esc>:prev<cr>
     map <2-leftMouse> byee<esc>:let @/='<c-R>"'<cr>
     map <rightMouse> <leftMouse>byee:vsplit<cr><c-w>w:cs find g <c-R>"<cr>
     map <middleMouse> i
     "map <ScrollWheelUp> <esc>30<c-y>
     "map <ScrollWheelDown> <esc>30<c-q>
     map <leader>< 0i//<esc>j
inoremap <c-a> <esc>0I
inoremap <c-e> <esc>A
inoremap <c-u> <esc>ua
inoremap <c-z> <esc><c-z>
inoremap <c-o> <esc>o
     map M i<cr><esc>
"inoremap <c-d> <space><right><esc>xbcw
inoremap <c-f> <space><c-right><right><esc>cw<backspace>
     map <leader>g <space>:grep --color <c-r>" %<cr>
     map <leader><leader>g <space>:!grep --color -rn <c-r>"<cr>
     "map <leader><cr> <esc>:w<cr>:!make<cr>
     map <leader><cr> <esc>:w<cr>:!make 2>/dev/null > /dev/null &<cr><cr>

set backspace=2 " make backspace work like most other apps
set cindent
set encoding=utf-8
set fileformat=unix
set hlsearch
set history=1000
set ignorecase
" set mouse=n
"set mouse-=a
set mouse=a
set noswapfile
set nocompatible
set noexpandtab
set nocp
set nu
set softtabstop=8
set shiftwidth=8
set timeoutlen=250
set ts=4
set tags=./tags;/
set tabstop=8
set wildmenu

syntax on
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
filetype plugin indent on

if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=0
	set cst
	set nocsverb
	if filereadable("cscope.out")
	cs add cscope.out
	elseif $CSCOPE_DB != ""
	cs add $CSCOPE_DB
	endif
	set csverb
endif


let g:clang_library_path='/home/z/.vim/bundle/YouCompleteMe/third_party/ycmd/libclang.so.4'
"let g:ycm_global_ycm_extra_conf="/home/z/bin/dot_ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_min_num_of_chars_for_completion = 1


map <leader><leader>O <esc>:vnew<cr> <esc><esc>:read !aarch64-linux-gnu-objdump -d
map <leader>O <esc>1GdG:read !aarch64-linux-gnu-objdump -d
map <c-q> 0v$h"qy

let g:ycm_confirm_extra_conf=0
"disable syntax checker highlights
let g:ycm_show_diagnostics_ui = 0
let g:ycm_min_num_of_chars_for_completion = 1

inoremap <c-j> <c-n>
inoremap <c-k> <c-p>

inoremap <leader>f  <esc>:call
     map <leader>f y<esc>:call


"""""""""""" F1-12 Keys Shortcuts """"""""""""""""""
" Show function list
map <F1> <esc>:Tlist<cr><c-w>ws:call ResizeCols(45)<cr>
map <F2> :call Tags()<cr>
map <F3> :call Style_openmpi()<cr><c-l>
" Switch to C source file
map <F4> <esc>:e %<.c<cr>
" Switch to Header source file
map <F5> <esc>:e %<.h<cr>
" Remove trailing white-space
map <F6> :%s/\s\+$//<cr>
map <F7> <esc>
map <F8> <esc>:cs f c
map <F9> <esc>:silent !cscope -kubR<cr>:cs add cscope.out<cr>
map <F10> <esc>
map <F11> <esc>:call Format_80_cols()<cr>
map <F12> <esc>:silent !make <cr>

"map <F12> <esc>:!silent ./mak 7 &<cr>
"map <F12> <esc>:w<cr><esc>:!make<cr><esc>:!scp examples/my root@rcar:<cr>

"map <F12> <esc>:!rm a.out<cr> :!make x11 <cr> :!./do_debug<cr>
"map <F12> <esc>:! ./vhost-inspect-module-make-scp<cr>
"map <F12> <esc>:! python parse.py <cr>
"map <F11> <esc>:! make; ./fast<cr>
"map <F11> <space>:!grep --color -rn <c-r>" drivers/gpu/drm/<cr>
"map <F10> <esc>:! ./guest-kernel-cp<cr>
