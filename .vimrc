"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/home/alex/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/home/alex/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
" NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'AndrewRadev/vim-eco'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'valloric/MatchTagAlways'
" NeoBundle 'bling/vim-airline'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'klen/python-mode'
NeoBundle 'scrooloose/nerdtree'
" mapping RUSSIAN keyboard
NeoBundle 'powerman/vim-plugin-ruscmd'
NeoBundle 'tomtom/tcomment_vim'
" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }
NeoBundle 'Rykka/riv.vim'
" NeoBundle 'Shougo/unite.vim'
" NeoBundle 'Shougo/neomru.vim'
NeoBundle 'mileszs/ack.vim'
" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------



" CUSTOM SETTINGS

syntax on
syntax enable
set number
autocmd BufWritePre * :%s/\s\+$//e
set noswapfile
set clipboard=unnamedplus
set guioptions-=T  "remove toolbar

" new settings
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" highlight last inserted text
nnoremap gV `[v`]
inoremap jk <esc>


let riv_disable_folding=1

" CtrlP alternate settings
" let g:ctrlp_match_window = 'bottom,order:ttb'
" let g:ctrlp_switch_buffer = 0
" let g:ctrlp_working_path_mode = 0
" let g:ctrlp_user_command = 'ack-grep %s'






" end new settings

" CtrlP settings
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_follow_symlinks = 0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|idea)|www|node_modules|\.sass-cache$',
  \ 'file': '\v\.(exe|so|dll|pyc|orig|gif|png|jpg|JPG|jpeg|JPEG)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_lazy_update = 1
map <C-b> :CtrlPBuffer<CR>
" root dir by .hg or .git dir
let g:ctrlp_working_path_mode = 'rw'



" Unite plugin settings
" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" call unite#filters#sorter_default#use(['sorter_rank'])
" "call unite#custom#source('file_rec/async','sorters','sorter_rank', )
" " replacing unite with ctrl-p
" let g:unite_data_directory='~/.vim/.cache/unite'
" let g:unite_enable_start_insert=1
" let g:unite_source_history_yank_enable=1
" let g:unite_prompt='» '
" let g:unite_split_rule = 'botright'
" if executable('ag')
" let g:unite_source_grep_command='ag'
" let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4'
" let g:unite_source_grep_recursive_opt=''
" endif
" nnoremap <silent> <c-p> :Unite -auto-resize file file_mru file_rec<cr>




" COFFEESCRIPT
autocmd BufNewFile,BufReadPost *.coffee "setl shiftwidth=4 expandtab
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab


" COLORTHEMES
syntax enable
set background=dark
colorscheme solarized
" colorscheme molokai
" let g:molokai_original = 1
set colorcolumn=100

" KEY BINDINGS
" map <C-w> :bdelete<CR>
map <C-s> :w<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
map <C-n> :NERDTreeToggle<CR>

" MatchTagAlways

let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'eco' : 1,
    \}
" Filemanager settings
let g:netrw_liststyle= 3
let NERDTreeIgnore = ['\.pyc$']

" Python mode settings

let g:pymode_lint_ignore = "E501"
" disable rope
let g:pymode_rope = 0
" disable autocompletition by rope
let g:pymode_rope_lookup_project = 0
" disable folding
let g:pymode_folding = 0
let g:pymode_options_max_line_length = 97
let g:pymode_rope_goto_definition_bind = '<C-c>g'
let g:pymode_breakpoint_cmd = 'import ipdb; ipdb.set_trace() # XXX BREAKPOINT'
" don't show after save ling error window
let g:pymode_lint_cwindow = 0

" add new line without insert mode
nmap <F8> o<Esc>
nmap <F9> O<Esc>

" tab navigation like firefox
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

" maximize gvim on start
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window (for an alternative on Windows, see simalt below).
  set lines=999 columns=999
else
  " This is console Vim.
  if exists("+lines")
    set lines=50
  endif
  if exists("+columns")
    set columns=100
  endif
endif

" set solarized colors in gnome termanal for terminal vim
" reuires installed solarized for gnome terminal: https://github.com/Anthony25/gnome-terminal-colors-solarized
set t_Co=16


" remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e
