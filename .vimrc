set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim' "Vundle plugin manager

"Auto complete plugin for Cfamily etc Disabled for python due to Kite Bundle
Bundle 'ycm-core/YouCompleteMe'
Plugin 'vim-scripts/indentpython.vim' "Matches cloasely indents for python with PEP 8
Plugin 'preservim/nerdcommenter' "fast comments (i.e. <leader>c<space> [un]comments a line)
Plugin 'scrooloose/nerdtree' "adds tree like file browser (mapped to <leader><C-n>)
Plugin 'tpope/vim-fugitive' "Git plugin for vim (i.e. :G, :Gstatus)
Plugin 'tpope/vim-surround' "surround plugin cs{( changes {} to ()
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'} "needed for lightline
Plugin 'justinmk/vim-sneak'
Plugin 'itchyny/lightline.vim' "cool status bar at the bottom
Plugin 'tpope/vim-speeddating' "Fast adding and subtracting dates (i.e. press <C-a> or <C-x> on: 29 mar 2020)
Plugin 'jiangmiao/auto-pairs' "Auto close () {} etc
" Plugin 'terryma/vim-multiple-cursors'
Plugin 'frazrepo/vim-rainbow' "brackets' color pairs (i.e. [[]] middle ones have different color than outer ones)
Plugin 'kshenoy/vim-signature' "Displays marks on a bar on the left
Plugin 'rafi/awesome-vim-colorschemes' "predefined colorschemes (i.e. :colo dracula)
"C# - disabled because YouCompleteMe supports C# and OmniSharp doesn't appear
"to be working
" Bundle 'OmniSharp/omnisharp-vim'
Plugin 'dense-analysis/ale'


call vundle#end()            " required

filetype plugin indent on    " required

"Syntax highlighting on
syntax on

"NerCommenter
filetype plugin on

"Autocomplete commands with menu

set wildmenu

"C# Autocomplete Omnisharp
	"asynchronous server
let g:OmniSharp_server_stdio = 1


"Autocomplete YouCompleteMe - added python to blacklist due to Kite
let g:ycm_filetype_blacklist = {
      \ 'python': 1,
      \ 'tagbar': 1,
      \ 'notes': 1,
      \ 'markdown': 1,
      \ 'netrw': 1,
      \ 'unite': 1,
      \ 'text': 1,
      \ 'vimwiki': 1,
      \ 'pandoc': 1,
      \ 'infolog': 1,
      \ 'leaderf': 1,
      \ 'mail': 1
      \}

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

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

"Python specific settings
au BufNewFile,BufRead *.py
    \ set tabstop=4
"    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix 
    \ set encoding=utf-8
set completeopt+=noinsert

"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set relativenumber
set number

let mapleader = ","
" set clipboard=unnamed

"MAPs and remaps

    "auto-pairs
    inoremap <C-'> ''<C-[>a

    "copy and paste to system clipboard
nnoremap <leader>p "+p
nnoremap <leader>y "+y
nnoremap <leader>d "+d

    "split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

    "tabs
nnoremap <C-t>n :tabnew<CR>
nnoremap <C-t>N <C-w>T
nnoremap <C-t>q :tabc<CR>
nnoremap <C-t>m :tabmove
nnoremap <C-t>o :tabo<CR>
nnoremap <C-t>r :tabdo

    "Diff
:map <leader>1 :diffget 1<CR>
:map <leader>2 :diffget 2<CR>
:map <leader>3 :diffget 3<CR>
:map <leader>4 :diffget 4<CR>
    
    "very magic search
map <leader>/ /\v
    
    "NERD Tree
nnoremap <leader><C-n> :NERDTreeToggle<CR>


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
