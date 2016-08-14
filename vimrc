set nocompatible
filetype off

let $PATH = $PATH . ':' . expand("~/.local/bin")

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"Plugin 'flazz/vim-colorschemes'
Plugin 'mhinz/vim-startify' " adds start screen with cow
Plugin 'airblade/vim-gitgutter' "shows a git diff in the gutter (sign column)
"Plugin 'morhetz/gruvbox' "groove color scheme
Plugin 'bling/vim-airline' "lean & mean status/tabline for vim that's light as air.
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jgdavey/vim-railscasts' "code highlight theme
"Plugin 'jpo/vim-railscasts-theme'
Plugin 'tpope/vim-sensible' " a universal set of defaults
Plugin 'tpope/vim-surround' " quoting/parenthesizing made simple
Plugin 'tpope/vim-endwise' " adding end after if, do, def and several other keywords
Plugin 'scrooloose/syntastic' "syntax checker, opts below
Plugin 'ngmy/vim-rubocop' "Adds a :RuboCop command, which accept rubocop cli args
Plugin 'rizzatti/dash.vim' " will search for terms using Dash leader+D
Plugin 'danchoi/ri.vim' " ruby doc

Plugin 'scrooloose/nerdtree' " tree explorer plugin
Plugin 'Xuyuanp/nerdtree-git-plugin' " plugin of NERDTree showing git status flags
Plugin 'tpope/vim-commentary' " gcc to comment line, gc to visual
Plugin 'jiangmiao/auto-pairs' " auto closing brackets
Plugin 'tpope/vim-unimpaired' "[e and ]e exchange the current line with the one above or below
Plugin 'tpope/vim-repeat' " dot repeat last command
Plugin 'ctrlpvim/ctrlp.vim' " fuzzy find file
Plugin 'dyng/ctrlsf.vim' " code search and view tool
Plugin 'tpope/vim-fugitive' " git wrapper and status line branch

Plugin 'jeetsukumaran/vim-buffergator' " ,b to show open buffers
" Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-dispatch' " :Dispatch rspec % to run current spec
" Plugin 'majutsushi/tagbar' " need install Exuberant ctags 5.5
" Plugin 'godlygeek/tabular'
" Plugin 'mbbill/undotree'
" Plugin 'othree/html5.vim'
Plugin 'xolox/vim-misc'

Plugin 'Valloric/MatchTagAlways'

Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'plasticboy/vim-markdown'
" Plugin 'JamshedVesuna/vim-markdown-preview'

"Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-git'

Plugin 'vim-ruby/vim-ruby'
"Plugin 'tpope/vim-rails'
"Plugin 'tpope/vim-bundler'
Plugin 'slim-template/vim-slim.git'

call vundle#end()
syntax enable
filetype plugin indent on

augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END

" Only for ruby files, for example
autocmd BufWritePre *.rb :normal gg=G

let mapleader=","
set shell=/bin/bash\ -li

" Sets how many lines of history VIM has to remember
set history=500
set ruler
set showcmd
" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" enhanced command completion
set wildmenu

set visualbell

if has('mouse')
  set mouse=a
endif

" Don't redraw while executing macros (good performance config)
set lazyredraw

set cursorline
set hidden
set nofoldenable
"set modelines=0
" set clipboard=unnamed
"set synmaxcol=128
"set ttyscroll=10
"set encoding=utf-8
set wrap
set number
set hlsearch
set ignorecase
set smartcase

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

set nopaste

set smartindent
set cindent
set autoindent
" set softtabstop=4
set expandtab
" set noexpandtab
set softtabstop=2
set shiftwidth=2
" set smarttab

" set background=dark
set t_Co=256
colorscheme railscasts
let g:airline_theme='bubblegum'
set guioptions-=r
set guioptions-=L

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

"Syntastic options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_wq = 0

" let g:slime_target = "tmux"

let g:vim_json_syntax_conceal = 0

let g:lexical#spelllang = ['en_us', 'ru_ru']

" let g:acp_enableAtStartup = 0
" let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#enable_smart_case = 1
" let g:neocomplete#sources#syntax#min_keyword_length = 3
" let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" if !exists('g:neocomplete#keyword_patterns')
" 	let g:neocomplete#keyword_patterns = {}
" endif
" endif

let g:easytags_async = 1

" Automatically removing all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Enable omni completion.
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" autocmd FileType ruby setlocal omnifunc=rubycomplete#CompleteTags
" autocmd BufWritePost *.hs call s:check_and_lint()
" autocmd BufWritePost *.hs GhcModCheckAndLintAsync

let g:buffergator_viewport_split_policy = "B"
let g:buffergator_sort_regime = "mru"

let g:vim_markdown_folding_disabled = 1

let g:syntastic_haml_checkers = ['haml_lint']
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_erlang_checkers = ['syntaxerl', 'escript']

" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)


nmap <F8> :TagbarToggle<CR>
nnoremap <F5> :UndotreeToggle<cr>

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" Dash integration
nmap <silent> <leader>d <Plug>DashSearch

" format the entire file
nnoremap <leader>fef :normal! gg=G``<CR>

" set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

nmap <C-\> :NERDTreeFind<CR>
nmap <silent> <leader><leader> :NERDTreeToggle<CR>

let NERDTreeIgnore = ['\.pyc$', '\.retry$']

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

nmap <silent> // :nohlsearch<CR>
noremap ,hl :set hlsearch! hlsearch?<CR>

" Allows you to enter sudo pass and save the file
" " when you forgot to open your file with sudo
cmap w!! %!sudo tee > /dev/null %

" Allow to copy/paste between VIM instances
" "copy the current visual selection to ~/.vbuf
vmap <Leader>y :w! ~/.vbuf<CR>
" "copy the current line to the buffer file if no visual selection
nmap <Leader>y :.w! ~/.vbuf<CR>
" "paste the contents of the buffer file
nmap <Leader>p :r ~/.vbuf<CR>

au BufRead,BufNewFile {Vagrantfile,Gemfile,Capfile} set ft=ruby
" au BufRead,BufNewFile *.phtml set ft=php

" autocmd FileType ruby compiler ruby

" au FileType ruby setl sw=2 sts=2 et
" au FileType javascript setl sw=2 sts=2 et
" au FileType yaml setl sw=2 sts=2 et
" autocmd Filetype html setlocal ts=2 sw=2

if filereadable(expand("~/.vimrc.after"))
  source ~/.vimrc.after
endif
