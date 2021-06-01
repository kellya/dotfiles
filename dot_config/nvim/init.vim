let g:plugged_home = '~/.vim/plugged'

call plug#begin(g:plugged_home)
  " UI related
  Plug 'chriskempson/base16-vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " Better Visual Guide
  Plug 'Yggdroot/indentLine'
  " syntax check
  Plug 'w0rp/ale'
  " Autocomplete
  Plug 'ncm2/ncm2'
  Plug 'roxma/nvim-yarp'
  Plug 'ncm2/ncm2-bufword'
  Plug 'ncm2/ncm2-path'
  Plug 'ncm2/ncm2-jedi'
  " Formater
  Plug 'Chiel92/vim-autoformat'
  " Theme
  Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
  " Python Plugins
  Plug 'Valloric/YouCompleteMe'
  Plug 'vim-syntastic/syntastic'
  Plug 'nvie/vim-flake8'
  Plug 'python-mode/python-mode'
  Plug 'airblade/vim-gitgutter'
  "
  "general development plugins
  Plug 'scrooloose/nerdtree'
  Plug 'flazz/vim-colorschemes'
  Plug 'davidhalter/jedi-vim'
  Plug 'ervandew/supertab'
  Plug 'ryanoasis/vim-webdevicons'
  Plug 'direnv/direnv.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-fugitive'
  Plug 'psf/black', { 'branch': 'stable' }
  " This was fun and all, but getting data out sucked, so if they ever get an
  " update, maybe try again
  "Plugin 'ActivityWatch/aw-watcher-vim'
  "
  " Bind zonefile stuff
  Plug 'seveas/bind.vim'
  "
  " extline extends rst stuff
  Plug 'drmikehenry/vim-extline'
  Plug 'brookhong/DBGPavim'
  Plug 'dhruvasagar/vim-table-mode'
  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'
  " Additional languages
  Plug 'nathanielc/vim-tickscript'
  Plug 'fatih/vim-go'
  Plug 'dbeniamine/cheat.sh-vim'
  Plug 'jacqueswww/vim-vyper'
  Plug 'tomlion/vim-solidity'
call plug#end()

filetype plugin indent on
" Set colors for spaceduck
if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif
let g:airline_theme = 'spaceduck'
if exists('+termguicolors')
      let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
      let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
      set termguicolors
    endif

   colorscheme spaceduck

" set the number style to hybrid
set number relativenumber


" READ FROM .vimrc

set nocompatible              " required
set splitright
filetype off                  " required
" Handy hack to force a write using sudo when you forget to 'sudo vi'
cmap w!! w !sudo tee > /dev/null %

set pastetoggle=<F10>

set incsearch
set encoding=utf-8
set wrap
set linebreak
set nolist

" Attempt to fix python/python3 issue
" To run py2 stuff, you can force with "vim --cmd 'let py2 = 1'
"if exists('py2') && has('python')
"elseif has('python3')
if !has('patch-8.1.201')
	silent! python3 1
endif

"let g:deoplete#enable_at_startup = 1
"Plugin 'Shougo/deoplete.nvim'

" Add all your plugins here (note older versions of Vundle used Bundle instead
" of Plugin)

" All of your Plugins must be added before the following line
filetype plugin indent on    " required
"Powerline setup
"set guifont=PowerLineSymbols\ DejaVu\ Sans\ Mono\ for\ Powerline\ 9
" set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 9
set guifont=Sauce\ Code\ Powerline\ Plus\ Nerd\ File\ Types\ 9
" set guifont=Anonymous\ Pro\ for\ Powerline\ Regular/9
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
set laststatus=2

"NerdTree map to <f2>
map <F2> :NERDTreeToggle<CR>

"colorscheme jellybeans

"Make python-friendly tabs
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set autoindent
set expandtab
"let &colorcolumn="80,".join(range(81,999),",")

augroup vimrc_autocmds
	autocmd!
	"highlight characters past col 80
	autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
	autocmd FileType python match Excess /\%80v.*/
	autocmd FileType python set nowrap
"    autocmd FileType rst set textwidth=80
    autocmd FileType markdown set textwidth=80
augroup END

set mouse=a

" python-mode settings
" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator
" modes)
" ]]            Jump on next class or function (normal, visual, operator
" modes)
" [M            Jump on previous class or method (normal, visual, operator
" modes)
" ]M            Jump on next class or method (normal, visual, operator
" modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
"let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_checker = "flake8,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
 let g:pymode_breakpoint = 1
 let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0
let g:riv_fold_level = 0
let g:riv_fold_auto_update = 0
nnoremap <space> za

let g:dbgPavimPort = 9000
let g:dbgPavimBreakAtEntry = 0
let g:dbgPavimOnce = 1

let python_highlight_all=1
syntax on

let g:pymode_python = 'python3'

" For table mode RST friendliness
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufWritePre *.py execute ':Black'
