set nocompatible

syntax on

" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Configure backspace to work properly on OS X
set backspace=indent,eol,start

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Show line number
set number

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Tabindent configuration
set tabstop=4
set shiftwidth=4
set expandtab

" Display hidden characters
set listchars=eol:$,tab:>-,trail:·,extends:>,precedes:<

" Set shortcuts for tabs navigation and manipulations
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <silent> <A-h> :tabmove -1<CR>
nnoremap <silent> <A-l> :tabmove +1<CR>

" Setting up the usage of Alt/Option key
" (do not forget to enable 'Use option as meta key' in OS X terminal preferences)
let c='a'
while c <= 'z'
    exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
    let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50
