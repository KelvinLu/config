set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'tpope/vim-fugitive'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'scrooloose/nerdtree'
    Plugin 'jistr/vim-nerdtree-tabs'
    Plugin 'valloric/youcompleteme'
    Plugin 'Yggdroot/indentLine'
    Plugin 'KelvinLu/vim-bbye'
    Plugin 'kien/ctrlp.vim'
    Plugin 'bling/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'flazz/vim-colorschemes'
    Plugin 'tpope/vim-sleuth'
call vundle#end()

filetype plugin indent on

syntax enable
set background=dark
set t_Co=256
colorscheme wombat256mod

set number
let &colorcolumn='80,'.join(range(81, 999), ',')
highlight ColorColumn guibg=#3a3a3a ctermbg=236

set hlsearch

set mouse=a
set backspace=indent,eol,start
set ignorecase smartcase

let g:airline#extensions#tabline#enabled=1
let g:airline_theme='wombat'
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
set laststatus=2

set splitright splitbelow

autocmd BufWritePre * %s/\s\+$//e
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

let mapleader=","

function RCifmodbnext()
    if &modifiable | bn! | endif
endfunction

function RCifmodbprevious()
    if &modifiable | bp! | endif
endfunction

function RCifmodbdelete()
    if &modifiable
        if &modified
            let l:choice = confirm("Buffer has unwritten changes, write them before closing buffer?", "&Yes\n&No\n&Cancel", 3)
            if l:choice == 1
                silent w
            elseif l:choice == 3
                return 0
            endif
        endif
        Bdelete!
    endif
endfunction

function RCenewnobuflisted()
    enew!
    setl noswapfile
    setl bufhidden=wipe
    setl buftype=
    setl nobuflisted
endfunction

noremap <PageUp> <C-u>
noremap <PageDown> <C-d>

nmap <Leader>. i
imap <Leader>. <Esc>

nmap <Leader>n <plug>NERDTreeTabsToggle<CR>
nmap <Leader>p :CtrlP<CR>
nmap <Leader>] :call RCifmodbnext()<CR>
nmap <Leader>[ :call RCifmodbprevious()<CR>
nmap <Leader>q :call RCifmodbdelete()<CR>

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

nmap <Leader>h :vnew<CR>:wincmd l<CR>:call RCenewnobuflisted()<CR>
nmap <Leader>v :new<CR>:wincmd j<CR>:call RCenewnobuflisted()<CR>
nmap <Leader>w :resize -5<CR>
nmap <Leader>s :resize +5<CR>
nmap <Leader>a :vertical resize -5<CR>
nmap <Leader>d :vertical resize +5<CR>
