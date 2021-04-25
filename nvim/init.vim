if !&compatible
      set nocompatible
endif

"reset augroup
augroup MyAutoCmd
    autocmd!
augroup END

"dein settings {{{
" dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
    call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir, [$MYVIMRC, s:toml_file])
    call dein#load_toml(s:toml_file)
    call dein#end()
    call dein#save_state()
endif
" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}
set runtimepath+=$HOME/.config/nvim/plugins/repos/github.com/Shougo/dein.vim
if dein#load_state(expand('~/.config/nvim/plugins'))
  call dein#begin(expand('~/.config/nvim/plugins'))
  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('tbodt/deoplete-tabnine', { 'build': './install.sh' })
  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
  call dein#install()
endif
filetype plugin indent on
syntax enable
syntax on


set number
set autoindent
set cursorline
set cursorcolumn
set tabstop=4
set shiftwidth=4
set softtabstop=0
set expandtab
set smarttab
set shiftround
set ignorecase
set smartcase
set wrapscan
set incsearch
set inccommand=split
"colorscheme molokai
"let g:molokai_original = 1
inoremap <silent> jj <ESC>:<C-u>w<CR>
nmap <Esc><Esc> :nohlsearch<CR><Esc>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 1

"---------------------------------
" startify
"---------------------------------
let g:startify_files_number = 5
let g:startify_list_order = [
        \ ['♻  最近使ったファイル:'],
        \ 'files',
        \ ['♲  最近使ったファイル(カレントディレクトリ下):'],
        \ 'dir',
        \ ['⚑  セッション:'],
        \ 'sessions',
        \ ['☺  ブックマーク:'],
        \ 'bookmarks',
        \ ]
let g:startify_bookmarks = ["~/.config/nvim/init.vim", "~/.config/nvim/dein.toml"]
let g:startify_session_autoload = 1

"-----------------------------------
"vim-flake8
"-----------------------------------
let g:flake8_show_quickfix=0
" to use colors defined in the colorscheme
highlight link Flake8_Error      Error
highlight link Flake8_Warning    WarningMsg
highlight link Flake8_Complexity WarningMsg
highlight link Flake8_Naming     WarningMsg
highlight link Flake8_PyFlake    WarningMsg
" let g:flake8_ignore = "E501, W293"

"---------------------------------
"jedi-vim
"---------------------------------
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 1
let g:jedi#auto_vim_configuration = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_on_dot = 0
let g:jedi#goto_command = "<C-i>"
let g:jedi#goto_assignments_command = "<C-g>"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<C-n>"
let g:jedi#rename_command = "<C-c>"
autocmd FileType python setlocal completeopt-=preview

if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif

"---------------------------------
"deoplete
"---------------------------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0
" disable autocomplete by default
let b:deoplete_disable_auto_complete=1
let g:deoplete_disable_auto_complete=1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_camel_case = 0
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_refresh_always = 0
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_list = 10000
let g:deoplete#max_abbr_width=0
let g:deoplete#max_menu_width=0
let g:echodoc_enable_at_startup=1

let g:deoplete#sources = {}

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

"---------------------------------
" w0rp/ale
"---------------------------------
"" flake8をLinterとして登録
let g:ale_linters = {
    \ 'python': ['mypy','flake8'],
    \ }

" 各ツールをFixerとして登録
 let g:ale_fixers = {
   \ 'python': ['black'],
   \ }

" 各ツールの実行オプションを変更してPythonパスを固定
let g:python3_host_prog = '/Users/yoshimuratakayuki/anaconda3/bin/python'
let g:ale_python_flake8_executable = g:python3_host_prog
let g:ale_python_flake8_options = '-m flake8 --max-line-length 100'
let g:ale_python_isort_executable = g:python3_host_prog
let g:ale_python_isort_options = '-m isort'
let g:ale_python_black_executable = g:python3_host_prog
let g:ale_python_black_options = '-m black -l 100'

" ついでにFixを実行するマッピングしとく
nmap <silent> <Leader>x <Plug>(ale_fix)
" ファイル保存時に自動的にFixするオプションもあるのでお好みで
let g:ale_fix_on_save = 1



" エラー行に表示するマーク
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'
" エラー行にカーソルをあわせた際に表示されるメッセージフォーマット
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" エラー表示の列を常時表示
let g:ale_sign_column_always = 1

" ファイルを開いたときにlint実行
let g:ale_lint_on_enter = 1
" ファイルを保存したときにlint実行
let g:ale_lint_on_save = 1
" 編集中のlintはしない
let g:ale_lint_on_text_changed = 'never'
" ファイル保存時に自動的にFixするオプションもあるのでお好みで
let g:ale_fix_on_save = 1

" lint結果をロケーションリストとQuickFixには表示しない
" 出てると結構うざいしQuickFixを書き換えられるのは困る
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0

" 有効にするlinter
let g:ale_linters = {
\   'python': ['mypy','flake8'],
\}

" 各ツールをFixerとして登録
"let g:ale_fixers = {
"    \ 'python': ['black'],
"    \ }
"--------------------------------
"python-syntax
"--------------------------------
let g:python_highlight_all = 1

"--------------------------------
"SuperTab
"--------------------------------
let g:SuperTabDefaultCompletionType = "<c-n>"
