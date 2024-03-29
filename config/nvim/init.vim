set runtimepath+=~/.config/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.config/dein')
  call dein#begin('~/.config/dein')
  call dein#add('~/.config/dein/repos/github.com/Shougo/dein.vim')
  " everything above this lines is Required

  " You can specify revision/branch/tag.

  call dein#add("tpope/vim-fireplace")
  call dein#add("tpope/vim-surround")
  call dein#add("neovim/node-host")
  call dein#add("clojure-vim/nvim-parinfer.js")
  call dein#add("sheerun/vim-polyglot")
  call dein#add("altercation/vim-colors-solarized")
  call dein#add("guns/vim-clojure-highlight")
  "call dein#add("ntpeters/vim-better-whitespace")
  call dein#add('Yggdroot/indentLine')
  call dein#add('tpope/vim-commentary')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('vim-scripts/grep.vim')
  " call dein#add('vim-scripts/paredit.vim')
  call dein#add('guns/vim-sexp')
  call dein#add('tpope/vim-sexp-mappings-for-regular-people')
  call dein#add('tpope/vim-repeat')
  let g:sexp_enable_insert_mode_mappings = 0

  call dein#add('gabrielsimoes/cfparser.vim')

  call dein#add('ctrlpvim/ctrlp.vim')

  call dein#add('WildUtah/nvim-setup-for-clojure')
  call dein#end() " Required from here down also
  call dein#save_state()
endif
if dein#check_install()
  call dein#install()
endif 
"End dein Scripts^^^

set modelines=0

set laststatus=2
set visualbell
set backupdir=~/.local/tmp/
set undodir=~/.local/tmp/
set directory=~/.local/tmp//
set backup
set bkc=auto
set tabstop=2
set shiftwidth=2
set ruler
set rulerformat=%25(%=\l\i\n\e\ %l\ \o\f\ %L%)
set showcmd
set et
set mouse=
cnorea Q! q!
cnorea Wq wq
cnorea WQ wq
set updatetime=250

"find files easily
set path+=**

let mapleader = ","
let maplocalleader = ","

" grep.vim
nno <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Dirs = '.git node_modules'

"disable indentline, until you need it
let g:indentLine_enabled=0


"totally essential! don't use <esc>!
"type kj in insert mode for normal mode
ino kj <ESC>
nno ;; :w<CR>
ino <Esc> <Del>
"highlight Pmenu ctermfg=0 ctermbg=10

function! s:contest_mappings() abort
  "mark all C++ cerr lines as comments, for contest submissions
  nno <silent> <leader>r :%g-^ \+cerr-s=^\( \+\)\(c.\+\)$=\1/* \2 */<CR>:noh<CR>''
  "set cookie file for curl downloads in cfparser
  let g:cf_cookies_file='~/.local/cf_cookies'
endfunction
autocmd FileType cpp,c++,cxx call s:contest_mappings()

" For Japanese keyboards…
ino ／ /

"make op mode work better with parens
ono i9 i(
ono a9 a(

"search works better like this
set hlsearch
set incsearch
nnoremap // :noh<CR>
set ignorecase
set smartcase

"maybe change to ^/$?
no h ^
no l $
"no <Space> find a way not to rely on crutch of space

"if we're using omnicoplete, please don't clutter
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif "maybe this too
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"use tab to bounce parens in normal mode
no <tab> %
vno <tab> %
no % va(

"use tab to autocomplete in insert mode
ino <buffer> <tab> <C-x><C-i>
ino <buffer> <S-tab> <tab>

"no arrow keys
no  <Right> <C-w>l
no  <Left> <C-w>h
no  <Up> <C-w>k
ino <Up> <Esc><C-w>k
no  <Down> <C-w>j
ino <Down> <Esc><C-w>j

function! s:lisp_good_mappings() abort
  "vim-fireplace specific
  no <C-c><C-c> :Eval<cr>
  ino <C-c><C-c> <C-o>:Eval<cr>
  no <buffer> w W
  " no <buffer> e E
  " no <buffer> ge gE
  no <buffer> b B
  map >0 >)
  map <0 <)
  map <9 <(
  map >9 >(
  no <C-j> :let g:parinfer_mode = "indent"<CR>
  ino <C-j> <C-o>:let g:parinfer_mode = "indent"<CR>
  no <C-p> :let g:parinfer_mode = "paren"<CR>
  ino <C-p> <C-o>:let g:parinfer_mode = "paren"<CR>
endfunction
autocmd FileType clojure,lisp,scheme call s:lisp_good_mappings()

"git!
no <silent> <C-a> :!git add %<cr>:GitGutterAll<cr>

"React specific
let g:jsx_ext_required = 0

"line positon preserve
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

set background=dark
filetype plugin indent on
syntax enable
colorscheme solarized

set cindent
set cino={1s,j1
