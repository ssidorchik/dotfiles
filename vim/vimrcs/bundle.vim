""""""""""""""""""""""""""""""
" => NeoBundle
" """"""""""""""""""""""""""""
if has("vim_starting")
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand("~/.vim/bundle/"))
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
NeoBundle "ap/vim-css-color"
NeoBundle "907th/vim-auto-save"
NeoBundle "bling/vim-airline"
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundle "ssidorchick/jshint.vim"
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
NeoBundle "Shougo/neocomplete.vim"

NeoBundleCheck

call neobundle#end()


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
let g:auto_save_in_insert_mode = 0


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
let g:unite_source_history_yank_enable = 1
let g:unite_source_rec_async_command = 'ag --nocolor --nogroup -g ""'
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
\ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
\  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'' --ignore ''bower_components'''
let g:unite_source_grep_recursive_opt = ''

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#profile('default', 'context', {
\   'direction': 'botright',
\   'prompt': '▶ ',
\   'no_split': 1,
\   'smartcase': 1
\ })

" General purpose
nnoremap [unite]<Space> :Unite -start-insert source<CR>
" Files
nnoremap [unite]f :Unite -start-insert -auto-preview -auto-resize file_rec/async:!<CR>
" Grepping
nnoremap [unite]g :Unite -auto-preview -auto-highlight -auto-resize grep:.<CR>
nnoremap [unite]s :UniteWithCursorWord -auto-preview -auto-highlight -auto-resize grep:.<CR>
" Yank history
nnoremap [unite]y :Unite history/yank<CR>
" Quickly switch between recent things
nnoremap [unite]F :Unite buffer tab file_mru directory_mru<CR>
nnoremap [unite]b :Unite buffer<CR>
nnoremap [unite]m :Unite file_mru<CR>
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


""""""""""""""""""""""""""""""
" => Neocomplete
""""""""""""""""""""""""""""""
"Note This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
  \ 'default' : '',
  \ 'vimshell' : $HOME.'/.vimshell_hist',
  \ 'scheme' : $HOME.'/.gosh_completions'
\ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h>  neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>   neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
inoremap <expr><C-k>  pumvisible()?"\<Up>":"\<C-k>"  
inoremap <expr><C-j>  pumvisible()?"\<Down>":"\<C-j>"  
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
