"dein Scripts-----------------------------
set runtimepath+=~/.config/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.config/dein')
  call dein#begin('~/.config/dein')
  " Let dein manage dein
  call dein#add('~/.config/dein/repos/github.com/Shougo/dein.vim')
  " everything above this lines is Required

  " Add or remove your plugins here:
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
  call dein#add('vim-scripts/paredit.vim')
  call dein#add('guns/vim-sexp')
  call dein#add('tpope/vim-sexp-mappings-for-regular-people')
  let g:sexp_enable_insert_mode_mappings = 0


  call dein#add('WildUtah/nvim-setup-for-clojure')
  call dein#end() " Required from here down also
  call dein#save_state()
endif
if dein#check_install()
  call dein#install()
endif " ^ If you want to install not installed plugins on startup.
"End dein Scripts-------------------------

set mouse=""
set laststatus=2
set nocp
set visualbell
set backupdir=~/tmp/
set directory=~/tmp//
set backup
set tabstop=2
set shiftwidth=2
set ruler
set rulerformat=%25(%=\l\i\n\e\ %l\ \o\f\ %L%)
set showcmd
set et
set comments=sr:/*,mb:*,ex:*/
cnoreabbrev Q! q!
set updatetime=250

"find files easily
set path+=**

let mapleader = ","

" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
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

" For Japanese keyboards…
ino ／ /

"make op mode work better with parens
ono i9 i(
ono a9 a(
"search works better like this
set hlsearch
set incsearch
nnoremap // :noh<CR>
"maybe change to ^/$?
no h ^
no l $

"if we're using omnicoplete, please don't clutter
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif "maybe this too
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

no <tab> %

no  <Right> <C-w>l
no  <Left> <C-w>h
no  <Up> <C-w>k
no  <Down> <C-w>j

"clojure specific
"in fact, vim-fireplace specific
no <C-c><C-c> :Eval<cr>
ino <C-c><C-c> <ESC>:Eval<cr>

"git!
no <silent> <C-a> :!git add %<cr>:GitGutterAll<cr>

"Javascript specific
let g:jsx_ext_required = 0

"line positon preserve
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

set background=dark
filetype plugin indent on
syntax enable
colorscheme solarized

set cindent
set cino={1s,j1
