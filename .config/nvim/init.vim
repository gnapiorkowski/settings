" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'ycm-core/YouCompleteMe'
Plug 'dart-lang/dart-vim-plugin'
Plug 'neoclide/coc.nvim', {'branch': 'release'} "Used for flutter
Plug 'OmniSharp/omnisharp-vim'
Plug 'vim-syntastic/syntastic'
Plug 'dense-analysis/ale'

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
Plug 'rafi/awesome-vim-colorschemes' "predefined colorschemes (i.e. :colo dracula)

call plug#end()


filetype plugin indent on    " required

"Syntax highlighting on
syntax on

"Initializations
"---------------------------

let g:airline_theme='dracula'
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

colorscheme dracula

"Enable lightline - cool bottom bar
set laststatus=2
"set noshowmode

"Autocomplete YouCompleteMe - added python to blacklist due to Kite
let g:ycm_filetype_blacklist = {
      \ 'dart': 1,
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
