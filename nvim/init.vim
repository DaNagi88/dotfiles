if !&compatible
    set nocompatible
endif

"reset augroup
augroup MyAutoCmd
    autocmd!
augroup END
augroup filetypedetect
augroup END

let g:python3_host_prog = '/Users/yoshimuratakayuki/anaconda3/bin/python'
source /Users/yoshimuratakayuki/.config/nvim/rc/dein.vim
source /Users/yoshimuratakayuki/.config/nvim/rc/map.vim
source /Users/yoshimuratakayuki/.config/nvim/rc/command.vim
source /Users/yoshimuratakayuki/.config/nvim/rc/option.vim
