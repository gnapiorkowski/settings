set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'preservim/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Bundle 'Valloric/YouCompleteMe'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'justinmk/vim-sneak'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-speeddating'
Plugin 'jiangmiao/auto-pairs'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'frazrepo/vim-rainbow'
Plugin 'kshenoy/vim-signature'
Plugin 'rafi/awesome-vim-colorschemes'

call vundle#end()            " required
filetype plugin indent on    " required

"NerCommenter
filetype plugin on

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

au BufNewFile,BufRead *.py
    \ set tabstop=4
"    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix 
    \ set encoding=utf-8

"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set relativenumber
set number

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let mapleader = ","
set clipboard=unnamed

"MAPs and remaps

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
map <C-n> :NERDTreeToggle<CR>

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
