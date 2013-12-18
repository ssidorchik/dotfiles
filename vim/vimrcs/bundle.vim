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
NeoBundle "kien/ctrlp.vim"
NeoBundle "scrooloose/nerdtree"
NeoBundle "scrooloose/nerdcommenter"
NeoBundle "tpope/vim-fugitive"
NeoBundle "groenewege/vim-less"
NeoBundle "slim-template/vim-slim"
NeoBundle "tpope/vim-rails"
NeoBundle "ap/vim-css-color"
NeoBundle "907th/vim-auto-save"
NeoBundle "bling/vim-airline"
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundle "wookiehangover/jshint.vim"

NeoBundleCheck


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
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower_components'

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


""""""""""""""""""""""""""""""
" => Fugitive
""""""""""""""""""""""""""""""
map <leader>gc :Gread<CR>
map <leader>ga :Gwrite<CR>
map <leader>gr :Gremove<CR>


""""""""""""""""""""""""""""""
" => Auto Save
""""""""""""""""""""""""""""""
let g:auto_save = 1
let g:auto_save_no_updatetime = 1


""""""""""""""""""""""""""""""
" => Airline
""""""""""""""""""""""""""""""
set noshowmode
set laststatus=2
let g:airline_theme = 'solarized'

""""""""""""""""""""""""""""""
" => Enhanced Javascript Syntax
""""""""""""""""""""""""""""""
"au FileType javascript call JavaScriptFold()
