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
    Plugin 'Yggdroot/indentLine'
    Plugin 'kien/ctrlp.vim'
    Plugin 'bling/vim-airline'
    Plugin 'flazz/vim-colorschemes'
call vundle#end()

filetype plugin indent on

syntax enable
set background=dark
set t_Co=256
colorscheme molokai 

set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab

let g:airline#extensions#tabline#enabled=1
set laststatus=2

set splitright
set splitbelow

let mapleader=","

function! rc:ifmodbnext()
    if &modifiable | bnext | endif
endfunction

function! rc:ifmodbprevious()
    if &modifiable | bprevious | endif
endfunction

function! rc:ifmodbdelete()
    if &modifiable | enew | bd! # | endif
endfunction

nmap <Leader>n <plug>NERDTreeTabsToggle<CR>
nmap <Leader>p :CtrlP<CR>
nmap <Leader>] :call rc:ifmodbnext()<CR> 
nmap <Leader>[ :call rc:ifmodbprevious()<CR>
nmap <Leader>q :call rc:ifmodbdelete()<CR>

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

nmap <Leader>h :vnew<CR>:wincmd l<CR>
nmap <Leader>v :new<CR>:wincmd j<CR>
nmap <Leader>w :resize -5<CR>
nmap <Leader>s :resize +5<CR>
nmap <Leader>a :vertical resize -5<CR>
nmap <Leader>d :vertical resize +5<CR>
