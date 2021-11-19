#!/bin/bash

git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

cat << EOF | tee ${HOME}/.vim_runtime/my_configs.vim > /dev/null
"let g:ale_enabled = 0
"let g:ycm_global_ycm_extra_conf = '/home/jeff/ycm_global_ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript,rust': ['re!\w{2}'],
			\ }

let g:NERDTreeWinPos = "left"
set nofoldenable

command WWW w !sudo tee % > /dev/null
command! W w
set nu

EOF

