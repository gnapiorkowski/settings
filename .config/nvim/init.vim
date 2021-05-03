" Specify a directory for plugins
" -or Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

"Lnaguage support
    "Auto-Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        "Python
            "autocomplete
Plug 'zchee/deoplete-jedi'
                "Requires python modules: pynvim, jedi
            "auto-format code
Plug 'davidhalter/jedi-vim'
                "Does code-jumping and autocompletion, but deoplete is used for autocompletion, and it is disabled here
                "use pip install git+https://github.com/davidhalter/jedi to avoid errors with pandas
            "Code-checking for errors
        "C++ (clangd)
Plug 'deoplete-plugins/deoplete-clang'
        "Dart
" Plug 'dart-lang/dart-vim-plugin'
        "OpenGL Shaders
" Plug 'tikhomirov/vim-glsl'
        "Coc (vsCode like plugins)
" Plug 'neoclide/coc.nvim'
        "C#
" Plug 'OmniSharp/omnisharp-vim'
        "Linters
" Plug 'vim-syntastic/syntastic'

"Linting 
        "Python + C++ + VIM
Plug 'dense-analysis/ale'
        "Python - configured below, but ALE is used instead
" Plug 'neomake/neomake'

"Code formatting
Plug 'sbdchd/neoformat'
                "Requires python modules: yapf


"Music dev with sonic-pi
Plug 'lilyinstarlight/vim-sonic-pi'

Plug 'mattn/emmet-vim' "HTML unraveling i.e. type html:5,, or div>a>p,,
Plug 'lervag/vimtex' "LaTex plugin

" Plug 'vim-scripts/indentpython.vim' "Matches cloasely indents for python with PEP 8

Plug 'tpope/vim-fugitive' "Git plugin for vim (i.e. :G, :Gstatus)

Plug 'scrooloose/nerdtree' "adds tree like file browser (mapped to <leader><C-n>)

Plug 'justinmk/vim-sneak'
Plug 'preservim/nerdcommenter' "fast comments (i.e. <leader>c<space> [un]comments a line)
Plug 'jiangmiao/auto-pairs' "Auto close () {} etc
Plug 'tpope/vim-surround' "surround plugin cs{( changes {} to ()
Plug 'tpope/vim-speeddating' "Fast adding and subtracting dates (i.e. press <C-a> or <C-x> on: 29 mar 2020)

Plug 'ryanoasis/vim-devicons' "Adds icons
Plug 'Yggdroot/indentLine' "Adds vertical indents' lines
Plug 'kshenoy/vim-signature' "Displays marks on a bar on the left
" Plug 'chrisbra/Colorizer' "Adds hex colors highlighting #aaffaa #ffaa11
" Plug 'ap/vim-css-color' "Adds hex colors highlighting #00ff88 #ff0000


Plug 'lilydjwg/colorizer' "Adds hex colors highlighting #00ff88 #ff0000

" Theming
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rafi/awesome-vim-colorschemes'

call plug#end()


filetype plugin indent on    " required

"Syntax highlighting on
syntax on

"General settings
"---------------------------

colorscheme gruvbox

"Autocomplete commands with menu
set wildmenu

"Line numbering
set relativenumber
set number


"Spliting
set splitbelow
set splitright

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

"Enable mouse support
set mouse=a

"Enable lightline - cool bottom bar
set laststatus=2
"set noshowmode

"Tabstops for all
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent


"Disable auto comments (after newline etc)
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" set clipboard=unnamed

"Language specific settings
"---------------------------

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
    "Nerdformat configured here not to double-up au Buf...
        "Enable alignment
    \ | let g:neoformat_basic_format_align = 1
        "Enable tab to space conversion
    \ | let g:neoformat_basic_format_retab = 1
        "Enable trimmming of trailing whitespace
    \ | let g:neoformat_basic_format_trim = 1
let g:python3_host_prog = "$HOME/.config/nvim/neovim/bin/python"

    "Ruby specific settings (completion for SonicPi)
au BufNewFile,BufRead *.rb
    \ inoremap <leader>l <C-x><C-o>


"Keymap
"---------------------------

let mapleader = ","

    "Tab to cycle completions for coc
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


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


"Plugin Related
"---------------------------

"Deoplete (autocompetion) not used in Python, because it's broken (in case of pandas df.head completion fails)
let g:deoplete#enable_at_startup = 1
    "Normally traversing through completion list is <C-n> and <C-p> this allows to use Tab instead
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
    "Automatically close hints
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

"Emmet (HTML snipets)
let g:user_emmet_leader_key=','

"Airline theme
let g:airline_theme='gruvbox'

"colorizer settings -> #ffff00
let g:colorizer_auto_color = 1
let g:colorizer_auto_filetype='css,html,lua,vim'

"NerCommenter
filetype plugin on


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

"SocinPi Settings
let g:sonic_pi_autolog_enabled = 0

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

"Python code-jumping
    " disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0
    " open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"
        "<leader>d: go to definition
        "K: check documentation of class or method
        "<leader>n: show the usage of a name in current file
        "<leader>r: rename a name

"Neomake linting checking configured for Python but ALE is used instead
" let g:neomake_python_enabled_makers = ['pylint']
" call neomake#configure#automake('nrwi', 500)

"Ale linting
let g:ale_linters = {
    \ 'python': ['pylint'],
    \ 'vim': ['vint'],
    \ 'cpp': ['clang'],
    \ 'c': ['clang']
\}

"Nerdformat code formatting
    "C++ custom setting for clangformat
let g:neoformat_cpp_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['--style="{IndentWidth: 4}"']
\}
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']

    "Python specific
"Configured in Python specific settings
