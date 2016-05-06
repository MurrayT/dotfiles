" ==============
" Plugin support
" ==============
call plug#begin('~/.vim/plugged')

"Agnostic plugins
"----------------
" Commenting support (gc)
Plug 'tpope/vim-commentary'
" Automatic closing
Plug 'cohama/lexima.vim'
" CamelCase and snake_case motions
Plug 'bkad/CamelCaseMotion'
" Ultisnips snippets
" Plug 'SirVer/ultiSnips'
" Plug 'honza/vim-snippets'
"Supertab
Plug 'ervandew/supertab'
"surround.vim
Plug 'tpope/vim-surround'

"Syntax support
"--------------
"Python syntax
Plug 'mitsuhiko/vim-python-combined'
"Julia syntax
Plug 'JuliaLang/julia-vim'
"Sage syntax
Plug 'petRUShka/vim-sage'
"Ruby
Plug 'vim-ruby/vim-ruby'
"Elixir
" Plug 'elixir-lang/vim-elixir'

"Interface Improvements
"----------------------
"NerdTree File Browser
" Plug 'scrooloose/nerdtree', {'on': ['NERDTreeFind', 'NERDTreeToggle']}
"vimegar
"Plug 'tpope/vim-vinegar'
"Lightlint (statusline)
Plug 'itchyny/lightline.vim'
Plug 'edkolev/tmuxline.vim'

" Colorschemes
" -----------
" jellybeans
Plug 'nanotech/jellybeans.vim'

call plug#end()


"==============
"Basic Settings
"==============
set shell=/bin/zsh  "Set shell to zsh
set nu              "Line numbers on
set showmode        "always show mode
set textwidth=120   "Text width 120 chars
set pumheight=10    "max Completion window height
set timeoutlen=300  "Esc timeout
set lazyredraw      "Don't redraw in middle of macros
set showmatch       "show matching brackets
set matchtime=2     "highlight for 0.2s
set mouse=a


"===============
"Indent settings
"===============
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

"==============
"Split settings
"==============
set splitright
set splitbelow

"==============
"Search settings
"=============
set ignorecase
set smartcase
set wrapscan
set nohlsearch

"================
"Filetype settings
"=================
filetype off
" set runtimepath+=/opt/homebrew-cask/Caskroom/lilypond/2.18.2-1/LilyPond.app/Contents/Resources/share/lilypond/current/vim/
filetype plugin on
filetype indent on
let fortran_free_source=1
let fortran_more_precise=1
let fortran_do_enddo=1

"================
"Omnnicomplete
"==============
set completeopt-=preview                    " Don't show preview scratch buffers
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

"==================
"Key mappings
"=================

"set leader to space
let g:mapleader = "\<Space>"

"remove arrow keys and some other useless shit
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <bs> <nop>
nnoremap <delete> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap <Space> <nop>
inoremap <F1> <nop>
nnoremap <F1> <nop>
inoremap <F2> <nop>
nnoremap <F2> <nop>
inoremap <F3> <nop>
nnoremap <F3> <nop>
inoremap <F4> <nop>
nnoremap <F4> <nop>
nnoremap Q <nop>

"Useful <BS> and <CR>
nnoremap <CR> G
vnoremap <CR> G
nnoremap <BS> gg
vnoremap <BS> gg

"When searching center screen
noremap n nzz
noremap N Nzz

"Same when moving up and down
noremap <C-u> <C-u>zz
noremap <C-d> <C-d>zz

"Make H and L do beginning/end of line
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

"Y yanks to EOL
nnoremap Y y$

"annoying command window begone
map q: :q

" Use CamelCaseMotion instead of default motions
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

"remap for navigation
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
"fortran mappings to shiftF
" nmap <S-F> :set syntax=fortran<CR>:let b:fortran_fixed_source=!b:fortran_fixed_source<CR>:set syntax=text<CR>:set syntax=fortran<CR>
" nmap <C-F> :filetype detect<CR>
"==================
"Common thingys
"==================
" Yank and paste from clipboard
nnoremap ,y "+y
vnoremap ,y "+y
nnoremap ,yy "+yy
nnoremap ,p "+p

"============
"F-keys
"============


" nnoremap <silent> <F1> :call utils#nerdWrapper()<CR>
nnoremap <silent> <F2> :set paste!<CR>:set paste?<CR>
nnoremap <silent> <F3> :set nohlsearch!<CR>:set nohlsearch?<CR>
nnoremap <silent> <F4> :set list!<CR>:set list?<CR>
nnoremap <silent> <F5> :call utils#runFile()<CR>
nnoremap <silent> <F6> <ESC>:w<CR>:!make<CR>
nnoremap <silent> <F7> :call utils#relativeNumberToggle()<CR>

"===========
"windows and buffers
"===========
" Intelligent windows resizing using arrow keys
nnoremap <silent> <Right> :call utils#intelligentVerticalResize('right')<CR>
nnoremap <silent> <Left> :call utils#intelligentVerticalResize('left')<CR>
nnoremap <silent> <Up> :resize +1<CR>
nnoremap <silent> <Down> :resize -1<CR>

" Buffers navigation and management
nnoremap <silent> + :bn<CR>
nnoremap <silent> _ :bp<CR>

"============
"abbreviations
"===========
cmap ww wqall
cmap qq qall

"================
"commands
"============
command! Run :call utils#runFile()
nnoremap <silent> ,r :Run<CR>
"==========
"Plugin settings
"==============
" -----------------------------------------------------
" NERDTree
" -----------------------------------------------------
" let g:NERDTreeMinimalUI=1
" let g:NERDTreeWinSize=55
" let g:NERDTreeAutoDeleteBuffer=1

" -----------------------------------------------------
" Lightline settings
" -----------------------------------------------------
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'tab': {
      \   'active': [ 'filename' ],
      \   'inactive': [ 'filename' ]
      \ },
      \ 'active': {
      \   'left': [ [ 'mode' ], [ 'paste' ], [ 'readonly', 'filename' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'filetype', 'fileencoding', 'fileformat' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"HELP":&readonly?"RO":""}'
      \ },
      \ 'component_function': {
      \   'mode': 'utils#lightLineMode',
      \   'filename': 'utils#lightLineFilename',
      \   'filetype': 'utils#lightLineFiletype',
      \   'fileformat': 'utils#lightLineFileformat',
      \   'fileencoding': 'utils#lightLineFileencoding'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&readonly)'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }
"---------------------
"Ultisnips
"--------------------
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsListSnippets='<c-d>'

"=====================
"color and highlighting
"=====================
syntax on
set background=dark
colorscheme jellybeans

"=====================
"folding
"====================
augroup indentmanualfold
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

"=====================
"Filetype settings
"====================
autocmd FileType vim setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType make setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab

autocmd BufWritePre * call utils#stripTrailingWhitespace()
