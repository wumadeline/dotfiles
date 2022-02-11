" Python with venvs
let g:python3_host_prog = '~/.pyenv/versions/neovim3/bin/python'

""" Vim-Plug
call plug#begin('~/.local/share/nvim/plugged')

" Aesthetics
Plug 'vim-airline/vim-airline'                 " Customize status/tabline
Plug 'atelierbram/Base2Tone-vim'               " Duotone syntax highlighting
Plug 'ap/vim-css-color'                        " Preview hex colors directly in source code
Plug 'blueyed/vim-diminactive'                 " Dim inactive windows
Plug 'junegunn/goyo.vim'                       " Minimal, centered sessions
Plug 'junegunn/limelight.vim'                  " Focused editing that dims surrounding text

" NERDTree
Plug 'scrooloose/nerdtree'                     " File tree explorer
Plug 'Xuyuanp/nerdtree-git-plugin'             " Shows git status flags
Plug 'ryanoasis/vim-devicons'                  " Adds filetype-specific icons

" Functionalities
Plug 'airblade/vim-gitgutter'                  " Show git diff markers
Plug 'jiangmiao/auto-pairs'                    " Inserts/deletes brackets, parens, quotes in pairs
Plug 'Shougo/deoplete.nvim'                    " Autocompletion
Plug 'deoplete-plugins/deoplete-jedi'          " deoplete plugin for Python completion
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " CLI fuzzy finder (not a plugin, a wrapper for vim)
Plug 'junegunn/fzf.vim'                        " Plugin for fzf-based commands
Plug 'puremourning/vimspector'                 " Multi-language debugger
Plug 'scrooloose/nerdcommenter'                " Plugin for easy commenting
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
let g:airline#extensions#hunks#non_zero_only = 1 " Display git line diffs from hunks

" Base2Tone
set background=dark                            " Use dark background
colorscheme Base2Tone_EarthDark                " Dark brown-orange DuoTone syntax theme

" Deoplete
let g:deoplete#enable_at_startup = 1           " Open deoplete at start up

" FZF
set rtp+=/usr/local/opt/fzf

" GitGutter
set updatetime=250                             " Update sign column every quarter second (250 ms)
let g:gitgutter_enabled = 1                    " Always enable git gutter
let g:gitgutter_highlight_lines = 0            " Turn off line highlighting
let g:gitgutter_set_sign_backgrounds = 1       " Use GitGutter's background colors
" Theme's default values match the background, which messes with the preview
" window visibility. Change the background value to a different shade.
highlight DiffAdded   guifg=#736d5e guibg=#3f3a37 ctermfg=242 ctermbg=237
highlight DiffChanged guifg=#e6b84d guibg=#3f3a37 ctermfg=178 ctermbg=237
highlight DiffRemoved guifg=#6f5849 guibg=#3f3a37 ctermfg=59 ctermbg=237


"" Nerdtree
let g:NERDTreeIgnore = ['^node_modules$']      " Don't show node_modules in file tree
let g:NERDTreeShowHidden=1                     " Show hidden files
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Vimspector
let g:vimspector_enable_mappings = 'HUMAN'     " Enable standard mappings

"" Other Configurations
" Enable full GUI colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

" Setting SignColumn to the same background as Normal
" for GitGutter aesthetic purposes
highlight SignColumn           NONE
highlight link SignColumn Normal

" Visual and Formatting
set encoding=utf-8                             " Use UTF-8, needed for Python and GUI colors
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
autocmd Filetype python setlocal tw=119

""" Custom Mappings
nnoremap <SPACE> <Nop>
let mapleader = " "

" Deoplete
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" GitGutter
nnoremap <Leader>ha :GitGutterNextHunk<CR>
nnoremap <Leader>hb :GitGutterPrevHunk<CR>
nnoremap <Leader>ga :GitGutterStageHunk<CR>
nnoremap <Leader>gu :GitGutterUndoHunk<CR>

" Goyo
nnoremap <leader>g :Goyo<CR>

" FZF
nnoremap <C-p> :Files<CR>
nnoremap <C-g> :GFiles<CR>
nnoremap <C-o> :Buffers<CR>
nnoremap <C-f> :Rg<CR>

" Limelight
nnoremap <leader>li :Limelight<CR>
nnoremap <leader>lu :Limelight!<CR>

" NERDCommenter
vmap ++ <Plug>NERDCommenterToggle
nmap ++ <Plug>NERDCommenterToggle

" NERDTree
nmap <C-n> :NERDTreeToggle<CR>

" Split Navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Close buffer and jump to previous
nnoremap <C-c> :bp\|bd #<CR>

noremap :Q :q
noremap :W :w
noremap :X :x
