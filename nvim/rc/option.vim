"--------------------------------------------------
" VISUAL
"--------------------------------------------------
"general
set number
set cursorline
set cursorcolumn
set display=lastline
set noshowmode

"highlight spaces at EOL
set list listchars=trail:\ 
highlight SpecialKey ctermbg=red

"status lines
set laststatus=2
" set statusline=%f%m%r%w%=[ENC=%{&fileencoding}][%l/%L],\ %P

"syntax
syntax enable

"bells
set visualbell
set noerrorbells

"color scheme
if has("termguicolors")
    set termguicolors
endif
colorscheme tender


"--------------------------------------------------
" MANIPULATION
"--------------------------------------------------
"command completion
set wildmenu
set wildmode=list:longest,full

"search settings
set incsearch
set ignorecase
set smartcase
set wrapscan
set hlsearch


"--------------------------------------------------
" EDITING
"--------------------------------------------------
"indent
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4


"--------------------------------------------------
" FILE OPERATION
"--------------------------------------------------
set nobackup
set autoread
set hidden

"undo history
if has('persistent_undo')
    let undo_path = expand('~/.vim/undo')
    exe 'set undodir=' .. undo_path
    set undofile
endif

"help options
set helplang=ja
