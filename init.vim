"  _   _ _____ _____     _____ __  __
" | \ | | ____/ _ \ \   / /_ _|  \/  |
" |  \| |  _|| | | \ \ / / | || |\/| |
" | |\  | |__| |_| |\ V /  | || |  | |
" |_| \_|_____\___/  \_/  |___|_|  |_|

"""""""""""
" Plugins "
"""""""""""
call plug#begin('~/.local/share/nvim/plugged')

" Color Scheme
Plug 'atelierbram/Base2Tone-vim'
let g:deus_termcolors=256

" Diminactive
Plug 'blueyed/vim-diminactive'

"Sensible: Universal set of defaults
Plug 'tpope/vim-sensible'

" NerdTree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
:command NT NERDTreeToggle
:command NTF NERDTreeFind
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
"let NERDTreeShowHidden=1

" NerdTree Git Plugin
Plug 'Xuyuanp/nerdtree-git-plugin'

" Polyglot
Plug 'sheerun/vim-polyglot'

" Salt Stack
Plug 'saltstack/salt-vim'

" Autopairs: insert/deletes brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'

" FZF
set rtp+=/usr/local/opt/fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

let $BAT_THEME = 'Solarized (dark)'

map <C-f> <Esc><Esc>:Files!<CR>
inoremap <C-f> <Esc><Esc>:BLines!<CR>
map <C-g> <Esc><Esc>:BCommits!<CR>

" Nerdcommenter
Plug 'scrooloose/nerdcommenter'
" Usage " 
" <leader> cc (comment), cu (uncomment)
" <leader> - '\' be default

" Python
Plug 'klen/python-mode'
let g:pymode_folding = 0
let g:pymode_lint = 0
let g:pymode_motion = 0
let g:pymode_options_colorcolumn = 0
let g:pymode_rope = 0
let g:pymode_rope_completion = 0


" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required



""""""""""""""""""
" Configurations "
""""""""""""""""""

syntax on
colorscheme Base2Tone_ForestDark
filetype plugin indent on

let mapleader = ","

set showcmd                        " Show (partial) command in status line.
set showmatch                      " Show matching brackets.
set showmode                       " Show current mode.
set ruler                          " Show the line and column numbers of the cursor.
set number                         " Show the line numbers on the left side.
set formatoptions+=o               " Continue comment marker in new lines.
set textwidth=0                    " Hard-wrap long lines as you type them.
set autoread                       " Auto read new changes to file
set scrolloff=3                    " Always shows three lines of vertical context around the cursor

set mouse=a                        " Click on things

set hidden

set ic                             " case insensitive search
set hlsearch                       " highlight what you search for
set incsearch                      " type-ahead-find
set scs                            " smart case search

set colorcolumn=80                 " line length matters
set expandtab                      " use spaces instead of tabs
set shiftwidth=4                   " 1 tab == 2 spaces
set tabstop=4                      " 1 tab == 2 spaces
set autoindent
set smartindent

set splitbelow                     " all horizontal splits open to the bottom
set splitright                     " all vertical splits open to the right


set nobackup                       " no backup files
set noswapfile                     " no swap files
set clipboard=unnamed              " copying to vim copys to mac clipboard

" Markdown 79 lines.
autocmd Filetype markdown setlocal textwidth=79

" Python 120 lines.
"autocmd Filetype python setlocal textwidth=120

" Indentation.
filetype plugin indent on
autocmd Filetype bash setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype sh   setlocal ts=2 sts=2 sw=2
autocmd Filetype vim  setlocal ts=2 sts=2 sw=2
autocmd Filetype xml  setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
autocmd Filetype zsh  setlocal ts=2 sts=2 sw=2

" Python 3 
set encoding=utf-8

" Show bad whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

noremap :Q :q
noremap :W :w
noremap :X :x

" Mappings
imap jj <Esc> 
