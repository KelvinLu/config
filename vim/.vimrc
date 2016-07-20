set number
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'tpope/vim-fugitive'
    Plugin 'scrooloose/nerdtree'
    Plugin 'jistr/vim-nerdtree-tabs'
    Plugin 'valloric/youcompleteme'
    Plugin 'nathanaelkane/vim-indent-guides'
    Plugin 'kien/ctrlp.vim'
    Plugin 'bling/vim-airline'
    Plugin 'flazz/vim-colorschemes'
call vundle#end()

filetype plugin indent on

syntax enable
set background=dark
set t_Co=256
colorscheme molokai 

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
let g:indent_guide_start_level=2
let g:indent_guide_guide_size=1

let g:airline#extensions#tabline#enabled=1

let mapleader=","

nmap <Leader>n <plug>NERDTreeTabsToggle<CR>
nmap <Leader>p :CtrlP<CR>
nmap <Leader>. :bnext<CR>
nmap <Leader>, :bprevious<CR>
nmap <Leader>q :bp <BAR> bd #<CR>

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

nmap <Leader>h :vsp<CR>
nmap <Leader>v :sp<CR>
nmap <Leader>w :resize +5<CR>
nmap <Leader>s :resize -5<CR>
nmap <Leader>a :vertical resize -5<CR>
nmap <Leader>d :vertical resize +5<CR>
