""""""""""""""""""""""""""""""
" => dein
" """"""""""""""""""""""""""""
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('nixprime/cpsm', {'build': 'sh -c "PY3=ON ./install.sh"'})
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('scrooloose/nerdtree')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('907th/vim-auto-save')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('w0rp/ale')
  call dein#add('Yggdroot/LeaderF', {'build': './install.sh'})
  call dein#add('tmux-plugins/vim-tmux-focus-events')

  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-rhubarb')
  call dein#add('junegunn/gv.vim')

  call dein#add('slim-template/vim-slim')

  call dein#add('pangloss/vim-javascript')
  call dein#add('mxw/vim-jsx')

  call dein#add('leafgarland/typescript-vim')
  " TODO: Update to master when issue resolved
  " https://github.com/leafgarland/typescript-vim/issues/126
  " call dein#add('Quramy/tsuquyomi', {'rev': 'v0.7.0'})

  call dein#add('ap/vim-css-color')
  call dein#add('groenewege/vim-less')

  " Required:
  call dein#end()
  call dein#save_state()
endif


" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
 call dein#install()
endif


""" Plugins configuration """"

""""""""""""""""""""""""""""""
" => Nerd Tree
" """"""""""""""""""""""""""""
let NERDTreeShowBookmarks=1

map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>


""""""""""""""""""""""""""""""
" => Nerd Commenter
" """"""""""""""""""""""""""""
let NERDSpaceDelims=1


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
" => GV
""""""""""""""""""""""""""""""
map <leader>gl :GV<CR>
map <leader>gf :GV!<CR>
map <leader>gv :GV?<CR>


""""""""""""""""""""""""""""""
" => Auto Save
""""""""""""""""""""""""""""""
let g:auto_save = 1
let g:auto_save_no_updatetime = 1
let g:auto_save_in_insert_mode = 0


""""""""""""""""""""""""""""""
" => Airline
""""""""""""""""""""""""""""""
set noshowmode
set laststatus=2
let g:airline_theme = 'solarized'


""""""""""""""""""""""""""""""
" =>  vim-javascript
""""""""""""""""""""""""""""""
let g:javascript_plugin_flow = 1


""""""""""""""""""""""""""""""
" => vim-jsx
""""""""""""""""""""""""""""""
let g:jsx_ext_required = 0


""""""""""""""""""""""""""""""
" => deoplete.vim
""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1

call deoplete#custom#option({
\ 'auto_complete_delay': 50,
\ 'auto_complete_start_length': 1,
\ 'enable_smart_case': 1
\ })


""""""""""""""""""""""""""""""
" => ale
""""""""""""""""""""""""""""""
let b:ale_linters = ['eslint']
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

let g:airline#extensions#ale#enabled = 1


""""""""""""""""""""""""""""""
" => LeaderF
""""""""""""""""""""""""""""""
let g:Lf_WindowHeight = 0.2
let g:Lf_PreviewResult = {
\ 'File': 1,
\ 'Buffer': 0,
\ 'Mru': 0,
\ 'Tag': 0,
\ 'BufTag': 1,
\ 'Function': 1,
\ 'Line': 1,
\ 'Colorscheme': 0
\}
nmap <leader>s <Plug>LeaderfRgCwordLiteralNoBoundary<CR>
noremap <leader>a :<C-U><C-R>=printf("Leaderf rg -e ")<CR>
noremap <leader>r :<C-U>Leaderf rg --stayOpen --recall<CR>
xnoremap <leader>s :<C-U><C-R>=printf("Leaderf rg -F --stayOpen -e %s ", leaderf#Rg#visual())<CR><CR>


""""""""""""""""""""""""""""""
" => Tsuquyomi
""""""""""""""""""""""""""""""
let g:tsuquyomi_disable_quickfix = 1
