" Specify a directory for plugins
" -or Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'dart-lang/dart-vim-plugin'
Plug 'tikhomirov/vim-glsl'
Plug 'neoclide/coc.nvim', {'branch': 'release'} "Used for flutter
" Plug 'OmniSharp/omnisharp-vim'
" Plug 'dense-analysis/ale'
Plug 'vim-syntastic/syntastic'
Plug 'mattn/emmet-vim' "HTML unraveling i.e. type html:5,, or div>a>p,,
Plug 'lervag/vimtex' "LaTex plugin

Plug 'vim-scripts/indentpython.vim' "Matches cloasely indents for python with PEP 8

Plug 'tpope/vim-fugitive' "Git plugin for vim (i.e. :G, :Gstatus)

"Navigation
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround' "surround plugin cs{( changes {} to ()
Plug 'scrooloose/nerdtree' "adds tree like file browser (mapped to <leader><C-n>)
Plug 'preservim/nerdcommenter' "fast comments (i.e. <leader>c<space> [un]comments a line)
Plug 'tpope/vim-speeddating' "Fast adding and subtracting dates (i.e. press <C-a> or <C-x> on: 29 mar 2020)
" Plug 'terryma/vim-multiple-cursors'

Plug 'jiangmiao/auto-pairs' "Auto close () {} etc
Plug 'ryanoasis/vim-devicons' "Adds icons
" Plug 'chrisbra/Colorizer' "Adds hex colors highlighting #aaffaa #ffaa11
Plug 'lilydjwg/colorizer'
" Plug 'ap/vim-css-color' "Adds hex colors highlighting #00ff88 #ff0000
Plug 'frazrepo/vim-rainbow' "brackets' color pairs (i.e. [[]] middle ones have different color than outer ones)

Plug 'Yggdroot/indentLine' "Adds vertical indents' lines
Plug 'kshenoy/vim-signature' "Displays marks on a bar on the left

" Theming
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'} "needed for lightline
" Plug 'itchyny/lightline.vim' "cool status bar at the bottom
" Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'rafi/awesome-vim-colorschemes'

call plug#end()


filetype plugin indent on    " required

"Syntax highlighting on
syntax on

"Initializations
"---------------------------

let g:airline_theme='dracula'
let g:colorizer_auto_color = 1
let g:colorizer_auto_filetype='css,html,lua,vim'

colorscheme dracula

"C++ linting via syntastic and cpplint
let g:syntastic_cpp_checkers = ['cpplint']
let g:syntastic_c_checkers = ['cpplint']
let g:syntastic_cpp_cpplint_exec = 'cpplint'
" The following two lines are optional. Configure it to your liking!
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

"NerCommenter
filetype plugin on

"Autocomplete commands with menu
set wildmenu



"Spliting
set splitbelow
set splitright

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za


"Enable lightline - cool bottom bar
set laststatus=2
"set noshowmode

"Tabstops for all
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent

"Lua specific settings
au BufNewFile,BufRead *.lua
    \ set tabstop=4
    \ | set shiftwidth=4

"HTML specific settings
au BufNewFile,BufRead *.html
    \ set tabstop=2
    \ | set shiftwidth=2

"CSS specific settings
au BufNewFile,BufRead *.css
    \ set tabstop=2
    \ | set shiftwidth=2

"Python specific settings
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ | set softtabstop=4
    \ | set shiftwidth=4
    \ | set textwidth=79
    \ | set expandtab
    \ | set autoindent
    \ | set fileformat=unix 
    \ | set encoding=utf-8


"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set relativenumber
set number

let mapleader = ","
let g:user_emmet_leader_key=','
" set clipboard=unnamed

"MAPs and remaps
"---------------------------
"Normal mode Mappings

"Tab to cycle completions for coc

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


"hex highlighting
nmap <F2>           :ColorHighlight<CR>

    "copy and paste to system clipboard
nnoremap <leader>p "+p
nnoremap <leader>y "+y
nnoremap <leader>d "+d
vnoremap <leader>p "+p
vnoremap <leader>y "+y
vnoremap <leader>d "+d

    "split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

    "tabs
nnoremap <A-j> :ALEDetails
nnoremap <A-l> :tabprevious
nnoremap <C-t>n :tabnew<CR>
nnoremap <C-t>N <C-w>T
nnoremap <C-t>q :tabc<CR>
nnoremap <C-t>m :tabmove
nnoremap <C-t>o :tabo<CR>
nnoremap <C-t>r :tabdo

    "Diff
map <leader>1 :diffget 1<CR>
map <leader>2 :diffget 2<CR>
map <leader>3 :diffget 3<CR>
map <leader>4 :diffget 4<CR>

    "very magic search
map <leader>v/ /\v
    
    "NERD Tree
nnoremap <leader><C-n> :NERDTreeToggle<CR>

"---------------------------
"Visual Mode Mappings
vnoremap g/ y/<C-R>"<CR>

"---------------------------
"Insert mode Mappings
    "auto-pairs
noremap! <C-l> <right>
noremap! <C-H> <left>
noremap! <C-k> <up>
noremap! <C-j> <down>
inoremap <Leader>w <esc>lwi
inoremap <Leader>e <esc>lea
inoremap <Leader>b <esc>lbi


"Disable auto comments (after newline etc)
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Coc settings
    "use K to show documentation
nnoremap <silent> <leader>gd :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


"NERD commenter
    " Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
    " Use compact syntax for prettified multi-line comments
"let g:NERDCompactSexyComs = 1
    " Align line-wise comment delimiters flush left instead of following code indentation
"let g:NERDDefaultAlign = 'left'
    " Set a language to use its alternate delimiters by default
"let g:NERDAltDelims_java = 1
    " Add your own custom formats or override the defaults
"let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
    " Allow commenting and inverting empty lines (useful when commenting a region)
"let g:NERDCommentEmptyLines = 1
    " Enable trimming of trailing whitespace when uncommenting
"let g:NERDTrimTrailingWhitespace = 1

    " Enable NERDCommenterToggle to check all selected lines is commented or not 
"let g:NERDToggleCheckAllLines = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"----> Alacrity mouse fix
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a
