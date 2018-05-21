set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" -----------------------------
" IMPORTANT:
" Keep Plugin commands between vundle#begin/end.

" plugin on GitHub repo
Plugin 'scrooloose/nerdtree.git'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0

Plugin 'elzr/vim-json'
" Plugin 'minibufexpl.vim'
Plugin 'AutoComplPop'
Plugin 'surround.vim'
Plugin 'Markdown'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'Townk/vim-autoclose'

" plugin from http://vim-scripts.org/vim/scripts.html --- Plugin 'L9'
" Git plugin not hosted on GitHub --- Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine --- Plugin 'file:///home/gmarik/path/to/plugin'
" -----------------------------

call vundle#end()            " requiredfiletype plugin indent on    " required
filetype indent on
syntax enable

" ---- CUSTOM SETTINGS -------
colorscheme molokai
set guifont=Consolas:h11:b:cTURKISH:qDRAFT

" tagbar
map <F6> :Tagbar <CR>

map <F5> :NERDTree <CR>

" open Nerd Tree when there was no file on the command line:
function! StartUp()
      if 0 == argc()
          NERDTree
     end
endfunction
autocmd VimEnter * call StartUp()

autocmd FileType python setlocal et sta sw=4 sts=4
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType java set omnifunc=javacomplete#Complete
if has("autocmd") && exists("+omnifunc")
     autocmd Filetype *
   \ if &omnifunc == "" |
   \   setlocal omnifunc=syntaxcomplete#Complete |
   \ endif
endif


map <c-p> :CtrlP <CR>
let g:ctrlp_custom_ignore = 'coverage\|dist\|dist-*\|node_modules\|DS_Store\|git'
" open ctrl p file in new buffer
let g:ctrlp_switch_buffer = 0
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-v>', '<2-LeftMouse>'],
    \ 'AcceptSelection("v")': ['<cr>', '<RightMouse>'],
    \ }


set number
set showcmd
set cursorline
set wildmenu
set showmatch
set hlsearch
set incsearch
" move vertically by visual line:
nnoremap j gj
nnoremap k gk
" set paste
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd BufWritePre *.js %s/\s\+$//e

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
