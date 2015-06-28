" noncompatible with vi
set nocompatible

" ==========================================================
"  Vundle
" ==========================================================

filetype off  " necessary for Vundle to work

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'jmcantrell/vim-virtualenv'

call vundle#end()

" ==========================================================
"  Basic Settings
" ==========================================================

" set correct filetypes
autocmd BufRead,BufNewFile *.md,*markdown
        \ setlocal filetype=markdown

" syntax highlighting
syntax on

" umoznit nacteni odsazovaciho souboru pro dany typ souboru
filetype plugin indent on

" disable backup and swap files
set nobackup
set noswapfile

" show what is typing as a command
set showcmd

" Rebind <Leader> key
let mapleader=","

" indenting automatically
set autoindent
" tab is 4 spaces wide
set tabstop=4
" use spaces, not tabs, for autoindent/tab key
set expandtab
" indent level is 4 spaces wide
set shiftwidth=2
" width of space used by <TAB> and <BS> keys
set softtabstop=2
" use 4 spaces for indentation in source codes of some languages
autocmd FileType python,java,c setlocal softtabstop=4 shiftwidth=4
" round indent to a multiple of shiftwidth
set shiftround
" handle tabs more intelligently
set smarttab
" but do not be to much intelligent in tex files
autocmd FileType tex setlocal nosmarttab

" soft (visual) wrapping
set wrap
" wrap on whitespace and some other characters (!@*-+;:,./?)
set linebreak
" auto-wrap comments (c), allow formatting command gq (q),
" remove comment leader when joint two comment lines (j)
set formatoptions=cqj

" copying and pasting
set clipboard=unnamedplus  " use system clipboard for pasting

" when a tab is closed, remove the buffer
set nohidden

" mouse
set mouse=a             " enable mouse

" easier moving code blocks
vnoremap < <gv
vnoremap > >gv

" keep 3 context lines above and below the cursor
set scrolloff=3

" wildmenu
set wildmenu
set wildignore=*.o,*.obj,*.swp,*~,*.pyc
" on 1st TAB complete the longest common prefix, on next TABs complete the next full option
set wildmode=longest:full,full

" shorten some messages (to avoid 'hit ENTER messages' when message is too long)
set shortmess=aItT

" length of command line history
set history=100

" trailing whitespace when saving
autocmd BufWritePre * :%s/\s\+$//e

" Let cursor move past the last char in <C-v> mode
set virtualedit=block

" line numbers
set number              " display line numbers
set numberwidth=2       " using at least 2 columns (+ 1 space) for number column

"" automatically reload _vimrc on save
"autocmd! bufwritepost _vimrc source %

" ==========================================================
"  Source code settings
" ==========================================================

" Allow visual break on ony character (nolinebreak).
" Highlight 80th column and set textwidth to 79 (important e.g. for comments
" to automatically break).
autocmd FileType python,java,javascript,haskell
    \  setlocal nolinebreak
    \ | setlocal colorcolumn=80
    \ | setlocal textwidth=79

" Note: comments can be aligned properly using 'gq' command.

" ==========================================================
"  Search
" ==========================================================
set ignorecase  " Default to using case insensitive searches,
set smartcase   " unless uppercase letters are used in the regex.
set incsearch   " Incrementally search while typing a /regex

" experimentalne: zvyraznovani vyhledavani
set hlsearch    " Highlight searches by default.

"Turn off highlighting on entering insert mode
nnoremap i :noh<CR>i

"Experimental : Turn off highlighting on pressing <enter>
nnoremap <CR>  :noh<CR>

"Experimental : very magic search by defaut
:nnoremap / /\v
:cnoremap %s/ %s/\v

" ==========================================================
"  Mappings
" ==========================================================

" remap qq to escape from insert mode
inoremap kj <Esc>

" navigating through splits with CTRL+j/k/l/m
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" make Y behave like other capitals, i.e. copy to the end of the line
map Y y$

" improve up/down movement on wrapped lines
nnoremap j gj
nnoremap k gk

" ==========================================================
"  Commands
" ==========================================================

" show whitespace (tabes and new lines)
nmap <leader>i :set list!<CR>

" ==========================================================
"  File Execution/Compilation (F5)
" ==========================================================

" Python: save and execute
autocmd FileType python map <buffer> <f5> :w<cr>:!python %<cr>

" AsciiDoc: save and convert to PDF
autocmd FileType asciidoc map <buffer> <f5> :w<cr>:!a2pdf %<cr>

"" LaTeX: call make (cc -> show the first error or No errors message)
"autocmd FileType tex map <buffer> <f5> :w<cr>:silent make\|redraw!\|cw<cr>

" ==========================================================
"  Solarized + theme options
" ==========================================================
set background=light
colorscheme solarized

" highlight current line
set cursorline

" toggle light and dark background with F4
call togglebg#map("<F4>")

" ==========================================================
"  AirLine
" ==========================================================

" display all the time
set laststatus=2

" set symbols
let g:airline_powerline_fonts = 0
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.branch = ''
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.whitespace = 'Ξ'

" use solarized color theme
let g:airline_theme = 'sol'

" top line (for tabs and buffers)
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number

" to avoid pause when leaving insert mode
set ttimeoutlen=50

" integration of other plugins
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#branch#enabled = 1

" ==========================================================
"  NerdTree
" ==========================================================
map <C-n> :NERDTreeToggle<CR>

" ==========================================================
"  Syntastic
" ==========================================================

" Python Checkers
let g:syntastic_python_checkers = ['pylint']

" write errors to loc list
"let g:syntastic_always_populate_loc_list = 1
" location list can be populated explicitly by :Errors

" jump automatically to first error
" let g:syntastic_auto_jump=1

" jump to next error
map <leader>e :lnext<CR>

" jump to previous error
map <leader>p :lprev<CR>

" ignore some messages (note: can be set in ~/.pylintrc)
" F403 = 'from foo import *' used
" E265 = block comment should start with '# '
" E501 = line too long
"let g:syntastic_python_pylint_args = '--disable="F403,E265,E501"'

"" messages filtering
"let g:syntastic_rst_rst2pseudoxml_quiet_messages = {"regex": "Unknown directive type"}
