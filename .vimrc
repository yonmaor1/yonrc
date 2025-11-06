" ~/.vimrc

" vim-plug "
" INIT
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" PLUGINS
call plug#begin()

" List your plugins here
Plug 'tpope/vim-sensible'
Plug 'morhetz/gruvbox'

call plug#end()

set nu
syntax on
colorscheme gruvbox
let g:gruvbox_transparent_bg = 1

" make background transparent
hi Normal guibg=NONE ctermbg=NONE
hi NonText guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi StatusLine guibg=NONE ctermbg=NONE
hi StatusLineNC guibg=NONE ctermbg=NONE

set tabstop=4
set shiftwidth=4
set expandtab
