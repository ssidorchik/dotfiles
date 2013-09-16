""""""""""""""""""""""""""""""
" => NeoBundle
" """"""""""""""""""""""""""""
if has("vim_starting")
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand("~/.vim/bundle/"))
NeoBundleFetch "Shougo/neobundle.vim"


""""""""""""""""""""""""""""""
" => Include plugins
" """"""""""""""""""""""""""""
NeoBundle "altercation/vim-colors-solarized"
NeoBundle "kien/ctrlp"
NeoBundle "scrooloose/nerdtree"
NeoBundle "scrooloose/nerdtcommenter"
NeoBundle "tpope/vim-fugitive"


""" Plugins configuration """"

""""""""""""""""""""""""""""""
" => Nerd Tree
" """"""""""""""""""""""""""""
let NERDTreeShowBookmarks=1

map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>

""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_height = 20

"""""""""""""""""""""""""""""
" => Solarized Color Scheme
""""""""""""""""""""""""""""""
syntax enable
set background=dark
set t_Co=256
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized
call togglebg#map("<F5>")


filetype plugin indent on

NeoBundleCheck
