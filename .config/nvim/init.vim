" .vimrc file

call plug#begin()
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'ntpeters/vim-better-whitespace'
Plug 'whatyouhide/vim-lengthmatters'
call plug#end()

filetype plugin indent on

" General Settings:
set autoindent                  " Automatically indent
set autoread                    " Automatically read changed files
set expandtab                   " Use spaces instead of tabs
set foldmethod=marker           " Collapse marker folds
set formatoptions=qroct         " see :help fo-table for info
set hlsearch                    " Highlight search matches
set ignorecase                  " Ignore search case...
set list lcs=trail:·,tab:»·     " Show whitespace characters
set smartcase                   " ... unless search contains caps
set incsearch                   " Incremental search
set nobackup                    " Don't write backup files
set nocompatible                " Don't start in vi compatibility mode
set nopaste                     " Don't paste, we want normal insert mode
set noswapfile                  " Don't write swap files
set nowritebackup               " Don't write backup files
set number                      " Show line numbers
set ruler                       " Show postion of pointer
set scrolloff=3                 " show context above/below cursorline
set shiftwidth=4                " 4 spaces tabbing
set showcmd                     " Show command
set showmode                    " Show mode in search
set smartindent                 " In a smarty way
set softtabstop=4               " 4 spaces tabbing
set splitright                  " splitting a window will put it to the right
set tabstop=4                   " 4 spaces tabbing
set ttyfast                     " Fast, nice updating

syntax enable                   " highlight syntax

" Unlimited persistent undo:
set undofile
set undodir=~/.config/nvim/undo

" Common typos
:command WQ wq
:command Wq wq
:command W w
:command Q q

" Keybindings:
let mapleader = ','

nmap <C-e> :NERDTreeToggle<CR>

" Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

nmap <leader>w :vsp<CR>
nmap <leader>e :sp<CR>

" Ctrl-P
let g:ctrlp_map = '<leader>o'

" Ack.vim
nnoremap <Leader>a :Ack!<Space>

" vim-better-whitespace
let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save = 1

" vim-lengthmatters
let g:lengthmatters_on_by_default = 0
nmap <leader>0 :LengthmattersToggle<CR>
