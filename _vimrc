
" ==========================================================
"  Basic Settings
" ==========================================================

" syntax highlighting
syntax on

" umoznit nacteni odsazovaciho souboru pro dany typ souboru
filetype plugin indent on

" noncompatible with vi (necessary for a lot of cool things in vim)
set nocompatible

" disable backup and swap files
set nobackup
set noswapfile

" show what is typing as a command
set showcmd

" Rebind <Leader> key
let mapleader=","

" indenting
set autoindent          " indenting automatically
set tabstop=4           " <tab> inserts 4 spaces
set shiftwidth=4        " indent level is 4 spaces wide.
set softtabstop=4       " <BS> over an autoindent deletes both spaces.
set expandtab           " use spaces, not tabs, for autoindent/tab key.
set shiftround          " rounds indent to a multiple of shiftwidth
set smarttab            " Handle tabs more intelligently

" copying and pasting
" set clipboard=unnamedplus  " use system clipboard for pasting

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
" on first <TAB> complete only the longest common prefix, but on next <TAB>s
" complete the next full option
set wildmode=longest:full,full

" shorten some messages (to avoid 'hit ENTER messages' when message is too long)
set shortmess=aItT

" keep 70 lines of command line history
set history=70

" trailing whitespace when saving
autocmd BufWritePre * :%s/\s\+$//e

" Let cursor move past the last char in <C-v> mode
set virtualedit=block

" line numbers
set number              " display line numbers
set numberwidth=2       " using at least 2 columns (+ 1 space) for number column

" zvyraznit aktualni radek
set cursorline

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
"  Commands
" ==========================================================

nmap <leader>i :set list!<CR>
