" Do ":so%" after changing the config file to reflect the changes(only works in this file)
" For help about any nvim command (anything from this file) do: ':h <command>'

" Set the leader key to " " (space)
let mapleader =  " "

" Something for Windows 10 comptability
set nocompatible

" Fold/Unfold
nnoremap , za

" Plugins
call plug#begin("~/.vim/plugged")
    Plug 'tomasiser/vim-code-dark'          " Colorscheme

call plug#end()

syntax enable

filetype plugin on

" Theme (e.g. light or dark theme)
set background=dark

" Enables highlighting when searching with "/", to disable do // or ":nohl"
set hlsearch

" Make search canse insenitive, you can make it sensitive with \C
set ignorecase

" Highlights as you search
set incsearch

" Enable relative lines
set relativenumber

" Makes your current line show the actual line number in the file (used for "set relativenumber")
set number

" Enables autocompletion for file names
set path+=**

" Autocomplete commands, files, everything. Ctrl+n(n=next), Ctrl+p(p=previous)
set wildmode=longest,list,full

" Auto completion ignore case
set wildignorecase

" Markdown preview https://github.com/iamcco/markdown-preview.nvim =========================================================
nmap <C-s> <Plug>MarkdownPreview

" Enables you to increment (or decrement) letters with Ctrl+a (decrement - Ctrl+x)
set nrformats+=alpha


"================================================================================================================================================
" Copy/paste from and to system with Ctrl-c and Ctrl-p . Potentially better than sharing the vim copy/paste clipboard with the system. This will only put it to the system clipboard if you do Ctr+c (in visual mode) and Ctrl+p(any mode). If using this, disable the line "set clipboard=unnamedplus". (the system clipboard is in the "+ register)
"vnoremap <C-c> "+y
"noremap <C-v> "+P


" " Copy to clipboard
"vnoremap  <leader>y  "+y
"nnoremap  <leader>Y  "+yg_
"nnoremap  <leader>y  "+y
"nnoremap  <leader>yy  "+yy
"
"" " Paste from clipboard
"nnoremap <leader>p "+p
"nnoremap <leader>P "+P
"vnoremap <leader>p "+p
"vnoremap <leader>P "+P
" Makes vim share the copy paste clipboard with the system
set clipboard=unnamedplus
"==============================================================================


" Fold stuff
set foldenable
set foldmethod=marker

" tabing spacing ============
set tabstop=4
set expandtab

" Enables auto indentation. Indents the next line like the current one.
set autoindent

" vidi da li je essential, grupisati sa: set tabstop=
set softtabstop=4

set smartindent " Idk, some say you should use, some say you shouldn't

" Makes tabbing smarted and realizes you have 2 vs 4
" TODO:
set smarttab

" set the tab length in spaces
" auto indentation on new line
set shiftwidth=4

" ===========================

" Disable wrap
set nowrap

" F5 compiles currently open file based on file type
" Compile markdown (.md) files to the pdf equivalent, and open it in brave //TODO open it in $BROWSER
autocmd FileType markdown noremap <f5> <esc>:w<enter> :!pandoc %:p -o %:p:r.pdf <enter>
" Compile C++ code (TODO: open resulting program in new window or something like that?)
autocmd FileType cpp nnoremap <f5> <esc>:w<enter>:!g++ -std=c++17 -lncurses %:p -o %:p:r<enter>
autocmd FileType c nnoremap <f5> <esc>:w<enter>:!gcc %:p -o %:p:r<enter>

" Spell check (o for ortography??), staviti mozda da detektuje na kojoj sam tastaturi i da taj jezik checkuje?
nnoremap <leader>e :setlocal spell! spelllang=en_us<Enter>
nnoremap <leader>s :setlocal spell! spelllang=sr_RS<Enter>
"nnoremap <leader>l :setlocal spell! spelllang=sr_latin<Enter>



" Enables changing your cursor position with mouse (you should use this very rarely)
set mouse=a


" Enable wrap for markdown files
autocmd BufEnter *.md set wrap

" Vim-studio-dark colortheme for everything except for markdown (.md) files
autocmd BufEnter * colorscheme codedark
autocmd BufEnter *.md colorscheme gruvbox

" When you scroll up/down, it makes your screen move before your cursor hits the last/first line
set scrolloff=5

" Sets the process title to something related to the file name
set title

" Replace all globally is aliased to S (S = substitute)
nnoremap S :%s//g<left><left>

" Press "//" after searching to unhighlight
nnoremap // :noh<return>

set ruler " (default on)

" Probably useless - SECTION: - -------------------------------

" Enables a terminal (you already have a window manager and shortcuts, just use those)
nnoremap \ :te<enter> 

set encoding=utf-8
set fileencoding=utf-8

" Disable automatic commenting on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" TODO: vidi ovo, |luke smith|, syntax check za .sh fajlove, i da je sugestije(za .sh fajlove)
map <leader>c :!clear && shellcheck -x %<Enter>

" Something for multi window stuff
set hidden

" Undo stuff, idk
set undodir=~/.vim/undodir
set undofile

" Disable backup file
set nobackup
set noswapfile
set nowritebackup

" Status line
set statusline=
set statusline+=%*\ %<%.60F%*                      " path, trunc to 80 length
set statusline+=\ [%{strlen(&ft)?&ft:'none'}]      " filetype
set statusline+=%*\ %l:%c%*                        " current line and column
set statusline+=%*\ %p%%%*                         " percentage

" Something with terminal colors
set termguicolors

" For better navigation with wrapped lines
noremap j gj
noremap k gk

" Make Y consistent with D and C (yank til end)
nnoremap Y y$
