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
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('scrooloose/nerdtree')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('907th/vim-auto-save')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('w0rp/ale')
  call dein#add('nvim-telescope/telescope.nvim', { 'rev': '0.1.x' })
  call dein#add('nvim-lua/plenary.nvim')
  call dein#add('tmux-plugins/vim-tmux-focus-events')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('tpope/vim-obsession')

  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-rhubarb')
  call dein#add('junegunn/gv.vim')

  call dein#add('slim-template/vim-slim')

  call dein#add('pangloss/vim-javascript')
  call dein#add('mxw/vim-jsx')

  call dein#add('leafgarland/typescript-vim')
  call dein#add('Quramy/tsuquyomi')

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
let g:airline_powerline_fonts = 1


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
" let b:ale_linters = ['eslint']
let g:ale_linters = {
\ 'typescript': ['eslint', 'tsserver', 'typecheck'],
\ 'javascript': ['eslint']
\}
let b:ale_fixers = ['eslint', 'prettier']
let g:ale_linters_ignore = {
\ 'javascript': ['jshint', 'tsserver'],
\ 'javascript.jsx': ['jshint', 'tsserver'],
\}
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

let g:airline#extensions#ale#enabled = 1

noremap <leader>ff :<C-U>ALEFix prettier<CR>


""""""""""""""""""""""""""""""
" => Telescope
""""""""""""""""""""""""""""""
" Find files using Telescope command-line sugar.
lua << EOF
local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")
local previewers = require("telescope.previewers")

local new_maker = function(filepath, bufnr, opts)
  opts = opts or {}

  filepath = vim.fn.expand(filepath)
  vim.loop.fs_stat(filepath, function(_, stat)
    if not stat then return end
    if stat.size > 100000 then
      return
    else
      previewers.buffer_previewer_maker(filepath, bufnr, opts)
    end
  end)
end

require('telescope').setup{
  defaults = {
    buffer_previewer_maker = new_maker,
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<M-p>"] = action_layout.toggle_preview,
        -- Clears prompt
        ["<C-u>"] = false
      },
      n = {
        ["<M-p>"] = action_layout.toggle_preview
      },
    },
  }
}
EOF

nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>a <cmd>Telescope live_grep<cr>
nnoremap <leader>s <cmd>Telescope grep_string<cr>
nnoremap <leader>r <cmd>Telescope resume<cr>
nnoremap <leader>q <cmd>Telescope loclist<cr>
nnoremap <leader>ss <cmd>Telescope spell_suggest<cr>


""""""""""""""""""""""""""""""
" => Tsuquyomi
""""""""""""""""""""""""""""""
let g:tsuquyomi_disable_quickfix = 1
