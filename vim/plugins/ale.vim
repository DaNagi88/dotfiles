" register linters and fixers
let g:ale_linters = {
    \ 'python': ['mypy','flake8'],
    \ }
 let g:ale_fixers = {
   \ 'python': ['black'],
   \ }

" set python paths
let g:ale_python_flake8_executable = g:python3_host_prog
let g:ale_python_flake8_options = '-m flake8 --max-line-length 100'
let g:ale_python_isort_executable = g:python3_host_prog
let g:ale_python_isort_options = '-m isort'
let g:ale_python_black_executable = g:python3_host_prog
let g:ale_python_black_options = '-m black -l 100'

" fix mapping and run on write file
nmap <silent> <Leader>x <Plug>(ale_fix)

" visual
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
let g:ale_echo_msg_format = '[%linter%][%code%: %severity%] %s '
let g:ale_sign_column_always = 1

" lint triggers
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_fix_on_save = 1

" set location-list and Quickfix
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0
