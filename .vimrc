set exrc "local .vimrc file to be used if available in pwd
set secure

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim' "Vundle plugin manager

Bundle 'ycm-core/YouCompleteMe'
Bundle 'OmniSharp/omnisharp-vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'dense-analysis/ale'

Plugin 'vim-scripts/indentpython.vim' "Matches cloasely indents for python with PEP 8

Plugin 'tpope/vim-fugitive' "Git plugin for vim (i.e. :G, :Gstatus)

"Navigation
Plugin 'justinmk/vim-sneak'
Plugin 'tpope/vim-surround' "surround plugin cs{( changes {} to ()
Plugin 'scrooloose/nerdtree' "adds tree like file browser (mapped to <leader><C-n>)
Plugin 'preservim/nerdcommenter' "fast comments (i.e. <leader>c<space> [un]comments a line)
Plugin 'tpope/vim-speeddating' "Fast adding and subtracting dates (i.e. press <C-a> or <C-x> on: 29 mar 2020)
" Plugin 'terryma/vim-multiple-cursors'

Plugin 'jiangmiao/auto-pairs' "Auto close () {} etc
Plugin 'ryanoasis/vim-devicons' "Adds icons
" Plugin 'chrisbra/Colorizer' "Adds hex colors highlighting #aaffaa #ffaa11
Plugin 'lilydjwg/colorizer'
" Plugin 'ap/vim-css-color' "Adds hex colors highlighting #00ff88 #ff0000
Plugin 'frazrepo/vim-rainbow' "brackets' color pairs (i.e. [[]] middle ones have different color than outer ones)

Plugin 'Yggdroot/indentLine' "Adds vertical indents' lines
Plugin 'kshenoy/vim-signature' "Displays marks on a bar on the left

" Theming
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'} "needed for lightline
" Plugin 'itchyny/lightline.vim' "cool status bar at the bottom
Plugin 'rafi/awesome-vim-colorschemes' "predefined colorschemes (i.e. :colo gruvbox)



call vundle#end()            " required

filetype plugin indent on    " required

"Syntax highlighting on
syntax on

"Initializations
"---------------------------

let g:airline_theme='gruvbox'
let g:colorizer_auto_color = 1
let g:colorizer_auto_filetype='css,html,lua,vim'
"C# Autocomplete Omnisharp
	"asynchronous server
let g:OmniSharp_server_stdio = 1

"NerCommenter
filetype plugin on

"Autocomplete commands with menu
set wildmenu


" let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_auto_hover = 'CursorHold'
" augroup MyYCMCustom
  " autocmd!
  " autocmd FileType c,cpp let b:ycm_hover = {
    " \ 'command': 'GetDoc',
    " \ 'syntax': &filetype
    " \ }
" augroup END


"Spliting
set splitbelow
set splitright

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

colorscheme gruvbox

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
" set clipboard=unnamed

"MAPs and remaps
"---------------------------
"Normal mode Mappings

"hex highlighting
nmap <F2>           :ColorHighlight<CR>

"YCM shortcuts
nnoremap <leader>G  :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>g  :YcmCompleter GoToDefinition<CR>
nmap <leader>D <plug>(YCMHover)

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
map <leader>v/ /\v
    
    "NERD Tree
nnoremap <leader><C-n> :NERDTreeToggle<CR>

"---------------------------
"Visual Mode Mappings
vnoremap g/ y/<C-R>"<CR>

"---------------------------
"Insert mode Mappings
    "auto-pairs
inoremap <C-l> <C-[>la
inoremap <C-h> <C-[>ha
inoremap <C-k> <C-[>ka
inoremap <C-j> <C-[>ja


"Disable auto comments (after newline etc)
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

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
set ttymouse=sgr
