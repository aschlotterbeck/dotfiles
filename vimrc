set nocompatible              " required
filetype off                  " required

" Vundle settings
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Add your plugins here
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'preservim/nerdtree'

call vundle#end()
filetype plugin indent on    " required

colorscheme koehler
