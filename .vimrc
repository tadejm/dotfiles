set nocompatible                " choose no compatibility with legacy vi

call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'alvan/vim-closetag'
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'cyphactor/vim-open-alternate'
Plug 'dag/vim-fish'
Plug 'dsawardekar/ember.vim'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'elzr/vim-json'
Plug 'itchyny/lightline.vim'
Plug 'janko-m/vim-test'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'rorymckinley/vim-rubyhash'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/BufOnly.vim'
Plug 'w0rp/ale'
Plug 'yalesov/vim-emblem'
Plug 'sickill/vim-monokai'

" Staging
" Plug 'sheerun/vim-polyglot'

call plug#end()

filetype plugin indent on       " load file type plugins + indentation
set omnifunc=syntaxcomplete#Complete

set encoding=utf-8
set showcmd                     " display incomplete command
set number
" set relativenumber
set history=1000               " remember more Ex commands
set textwidth=120
set colorcolumn=120
set re=1
set laststatus=2
set hidden                      " Hides the buffer on buffer switch, preserves histoy

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive

if $SHELL =~ 'fish'
  set shell=/bin/sh
endif

set t_Co=256

if !has('nvim')
  set ttymouse=xterm2
endif

set mouse=a
set clipboard=unnamed

syntax enable
set background=dark
colorscheme monokai
set nocursorcolumn
set nocursorline
set norelativenumber
syntax sync minlines=256

set complete=.,b,u,]
set completeopt=menu,preview
" ignore Rubinius, Sass cache files
set wildignore+=tmp/**,*.rbc,.rbx,*.scssc,*.sassc
" ignore Bundler standalone/vendor installs & gems
set wildignore+=bundle/**
set wildignore+=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildignore+=*/vendor/**
set wildmenu      " show a navigable menu for tab completion
set wildmode=longest,list,full
set wildchar=<Tab> wildmenu wildmode=full
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  let g:ackprg = 'ag --nogroup --column --ignore-dir vendor/ruby'

  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " " Use ag in CtrlP for listing files. Lightning fast and respect .gitignore
  " let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  " let g:ctrlp_use_caching = 0
endif


" hi Search cterm=NONE ctermfg=grey ctermbg=blue

" disable cursor keys in normal mode
map <Left>  :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up>    :echo "no!"<cr>
map <Down>  :echo "no!"<cr>

" use space as <Leader> key instead of backslash
let mapleader=" "

" keyboard shortcuts
inoremap jj <ESC>

" quicker save
map <leader>w :w<cr>

" paste lines from unnamed register and fix indentation
nmap <leader>p pV`]=
nmap <leader>P PV`]=

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

map <leader>a :Ag<space>
" nmap <leader>q :Bdelete<CR>
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
" nmap <leader>Q :bufdo :Bdelete<CR>
" format JSON
" if executable('jsonpp')
map <Leader>q ! json_pp<CR>
" endif

" Make a simple "search" text object.
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+2':''<CR><CR>
      \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

" wrap git messages to 72 chars
autocmd Filetype gitcommit setlocal spell textwidth=72

" let g:tmuxline_preset = 'vim_powerline'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PROMOTE VARIABLE TO RSPEC LET
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
 :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>

let g:syntastic_check_on_open = 0
let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
" set  tatusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


" Removes trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e

" let test#strategy = "vimux"
let test#strategy = "basic"
" let test#ruby#rspec#executable = 'bundle exec rspec'
let test#ruby#rspec#options = {
  \ 'file':    '--format documentation'
\}
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>A :TestSuite<CR>
" nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" Run a given vim command on the results of alt from a given path.
" See usage below.
function! AltCommand(path, vim_command)
  let l:alternate = system("alt " . a:path)
  if empty(l:alternate)
    echo "No alternate file for " . a:path . " exists!"
  else
    exec a:vim_command . " " . l:alternate
  endif
endfunction

" Find the alternate file for the current path and open it
nnoremap <leader>, :w<cr>:call AltCommand(expand('%'), ':e')<cr>

augroup reload_vimrc
    autocmd!
    autocmd bufwritepost $MYVIMRC nested source $MYVIMRC
augroup END

let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "⭤"
  else
    return ""
  endif
endfunction

function! LightLineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

set rtp+=/usr/local/opt/fzf

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

command! -bar Tags if !empty(tagfiles()) | call fzf#run({
\   'source': "sed '/^\\!/d;s/\t.*//' " . join(tagfiles()) . ' | uniq',
\   'sink':   'tag',
\ }) | else | echo 'Preparing tags' | call system('ctags -R') | FZFTag | endif

command! FZFMru call fzf#run({
\  'source':  v:oldfiles,
\  'sink':    'e',
\  'options': '-m -x +s',
\  'down':    '40%'})

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader>b :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

nnoremap <silent> <Leader>C :call fzf#run({
\   'source':
\     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
\         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
\   'sink':    'colo',
\   'options': '+m',
\   'left':    30
\ })<CR>

" Open files in horizontal split
nnoremap <silent> <Leader>s :call fzf#run({
\ 'source': "git ls-files -o -c --exclude-standard",
\   'sink': 'e',
\   'down': '40%'
\ })<CR>

nnoremap <C-]> g<C-]>

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.erb'
