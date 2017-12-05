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
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('scrooloose/nerdtree')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('907th/vim-auto-save')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('vim-syntastic/syntastic')
  call dein#add('tpope/vim-fugitive')

  call dein#add('slim-template/vim-slim')

  call dein#add('pangloss/vim-javascript')
  call dein#add('mxw/vim-jsx')

  call dein#add('leafgarland/typescript-vim')
  " TODO: Update to master when issue resolved
  " https://github.com/leafgarland/typescript-vim/issues/126
  call dein#add('Quramy/tsuquyomi', {'rev': 'v0.7.0'})

  call dein#add('ap/vim-css-color')
  call dein#add('groenewege/vim-less')

  " Required:
  call dein#end()
  call dein#save_state()

  if dein#check_install()
    call dein#install()
  endif
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
" => Unite
""""""""""""""""""""""""""""""

let g:unite_source_history_yank_enable = 1

"" Config Ag and use it instead of find
let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']

" Configure Ag and use it instead of grep
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
\ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
\  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'' --ignore ''bower_components'''
let g:unite_source_grep_recursive_opt = ''


call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#profile('default', 'context', {
\   'start_insert': 1,
\   'no_split': 1,
\   'smartcase': 1,
\   'prompt': '▶ ',
\   'previewheight': 40,
\   'direction': 'botright'
\ })


" General purpose
nnoremap <leader><Space> :Unite source<CR>
" Files
nnoremap <leader>f :<C-u>Unite -auto-preview -auto-resize file_rec/async:!<CR>
" Grepping
nnoremap <leader>g :<C-u>Unite -auto-preview -auto-highlight -auto-resize grep:.<CR>
nnoremap <leader>s :<C-u>UniteWithCursorWord -auto-preview -auto-highlight -auto-resize grep:.<CR>
" Yank history
nnoremap <leader>y :<C-u>Unite history/yank<CR>
" Quickly switch between recent things
nnoremap <leader>F :<C-u>Unite buffer tab file_mru directory_mru<CR>
nnoremap <leader>b :<C-u>Unite buffer bookmark<CR>
nnoremap <leader>m :<C-u>Unite file_mru<CR>
" Resume previous action
nnoremap <leader>r :<C-u>UniteResume -silent -auto-resize -immediately<CR>


autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  imap <buffer> <C-j> <Plug>(unite_select_next_line)
  imap <buffer> <C-k> <Plug>(unite_select_previous_line)
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  imap <silent><buffer><expr> <C-x> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
  imap <silent><buffer> <C-c> <Plug>(unite_exit)
  nmap <silent><buffer> <C-c> <Plug>(unite_exit)
endfunction


""""""""""""""""""""""""""""""
" => deoplete.vim
""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1


""""""""""""""""""""""""""""""
" => Syntastic
""""""""""""""""""""""""""""""
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_javascript_eslint_exec = 'eslint_d'
" Commented configuration left for projects without configured eslint flow plugin
" let g:syntastic_javascript_flow_exe = 'flow'
" let g:syntastic_javascript_checkers = ['eslint', 'flow']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['tsuquyomi']


""""""""""""""""""""""""""""""
" => Tsuquyomi
""""""""""""""""""""""""""""""
let g:tsuquyomi_disable_quickfix = 1
