" clear highlight with double-<Esc>
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" select completion with <Tab>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" visual cursor rows move
nnoremap j gj
nnoremap k gk

" exit insert mode
inoremap jj <Esc>
