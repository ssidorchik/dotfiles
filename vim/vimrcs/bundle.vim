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
NeoBundle "editorconfig/editorconfig-vim"
NeoBundle 'Shougo/vimproc.vim', {
          \ 'build' : {
          \     'windows' : 'tools\\update-dll-mingw',
          \     'cygwin' : 'make -f make_cygwin.mak',
          \     'mac' : 'make -f make_mac.mak',
          \     'unix' : 'make -f make_unix.mak',
          \    },
          \ }
NeoBundle "Shougo/unite.vim"
NeoBundle "Shougo/neomru.vim"

NeoBundleCheck


""" Plugins configuration """"

""""""""""""""""""""""""""""""
" => Nerd Tree
" """"""""""""""""""""""""""""
let NERDTreeShowBookmarks=1

map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>


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
" => Unite
""""""""""""""""""""""""""""""

" The prefix key
nnoremap [unite] <Nop> " (Space)
nmap <Space> [unite]
let g:unite_enable_start_insert = 1
let g:unite_prompt = '▶ '
let g:unite_source_history_yank_enable = 1

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#profile('source/grep', 'context', { 'no_quit' : 1 })
call unite#set_profile('files', 'smartcase', 1)
" General purpose
nnoremap [unite]<Space> :Unite -start-insert source<CR>
" Files
nnoremap [unite]f :Unite -auto-resize -auto-preview -no-split file_rec/async:!<CR>
" Grepping
nnoremap [unite]g :Unite -auto-resize -auto-preview -no-split -auto-highlight grep:.<CR>
nnoremap [unite]s :UniteWithCursorWord -auto-preview -no-split -auto-highlight grep:.<CR>
" Yank history
nnoremap [unite]y :Unite -no-split history/yank<CR>
" Quickly switch between recent things
nnoremap [unite]F :Unite -no-split buffer tab file_mru directory_mru<CR>
nnoremap [unite]b :Unite -no-split buffer<CR>
nnoremap [unite]m :Unite -no-split file_mru<CR>
" Resume previous action
nnoremap [unite]r :UniteResume -silent -auto-resize -immediately<CR>


autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  imap <buffer> <C-j> <Plug>(unite_select_next_line)
  imap <buffer> <C-k> <Plug>(unite_select_previous_line)
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  imap <silent><buffer><expr> <C-x> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
  nmap <buffer> <Esc> <Plug>(unite_exit)
endfunction
