""" Vim-Plug
call plug#begin('~/.local/share/nvim/plugged')

" Aesthetics
Plug 'vim-airline/vim-airline'                 " Customize status/tabline
Plug 'atelierbram/Base2Tone-vim'               " Duotone syntax highlighting
Plug 'blueyed/vim-diminactive'                 " Dim inactive windows
Plug 'junegunn/goyo.vim'                       " Minimal, centered sessions
Plug 'junegunn/limelight.vim'                  " Focused editing that dims surrounding text

" Functionalities
Plug 'jiangmiao/auto-pairs'                    " Inserts/deletes brackets, parens, quotes in pairs
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " CLI fuzzy finder (not a plugin, a wrapper for vim)
Plug 'junegunn/fzf.vim'                        " Plugin for fzf-based commands
Plug 'sheerun/vim-polyglot'                    " Language packs
Plug 'tpope/vim-sensible'                      " Universal set of vim defaults

" All Plugins must be added before the following line
call plug#end()
filetype plugin indent on

""" Plugin Configurations
syntax enable
syntax on

" Airline
let g:airline_theme='Base2Tone_EarthDark'      " Set Airline theme to match Base2Tone editor theme

" Base2Tone
set background=dark                            " Use dark background
colorscheme Base2Tone_EarthDark                " Dark brown-orange DuoTone syntax theme

" FZF
set rtp+=/usr/local/opt/fzf
let $BAT_THEME = 'Solarized (Dark)'
map <C-f> <Esc><Esc>:Files!<CR>

""" Other Configurations
" Visual andd Formatting
set encoding=utf-8                             " Use UTF-8
set number                                     " Show line numbers on the left side
set showmatch                                  " Show matching brackets
set formatoptions+=o                           " Continue comment marker in new lines
set textwidth=0                                " Hard-wrap long lines as you type them
" Flag whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Search
set ignorecase                                 " Case insensitive search
set incsearch                                  " Type-ahead find
set hlsearch                                   " Highlight search results
set smartcase                                  " Smart case search

" Formatting
set colorcolumn=80                             " Display ruler to indicate max line length
set expandtab                                  " Use spaces instead of tabs
set autoindent                                 " Automatically indent next line
set smartindent                                " Automatically insert extra level of indentation
set tabstop=4                                  " 1 tab == 4 spaces
set softtabstop=4                              " 1 tab == 4 spaces
set shiftwidth=4                               " 1 shift == 4 spaces"

" Splits
set splitbelow                                 " All horizontal splits open to the bottom
set splitright                                 " All vertical splits open to the right

""" Filetype-Specific Configurations
" Indentation
autocmd Filetype bash     setlocal ts=2 sts=2 sw=2
autocmd Filetype css      setlocal ts=2 sts=2 sw=2
autocmd Filetype html     setlocal ts=2 sts=2 sw=2
autocmd Filetype markdown setlocal ts=2 sts=2 sw=2
autocmd Filetype sh       setlocal ts=2 sts=2 sw=2
autocmd Filetype vim      setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml     setlocal ts=2 sts=2 sw=2
autocmd Filetype zsh      setlocal ts=2 sts=2 sw=2

" Max Width
autocmd Filetype markdown setlocal tw=79
autocmd Filetype python setlocal tw=79

""" Custom Mappings
let mapleader = ","

" Split Navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

noremap :Q :q
noremap :W :w
noremap :X :x
