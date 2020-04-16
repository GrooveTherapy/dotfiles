set nocompatible 

set scrolloff=5     " show 5 lines above cursor

" PATHS
set path+=**	" add current directory to vim path
set wildignore+=**/__pycache__/**
set wildignore+=**/node_modules/**

" TAB BEHAVIOR
set tabstop=4		" show existing tab with 4 spaces width
set shiftwidth=4	" when indenting with '>', use 4 spaces width
set expandtab		" On pressing tab, insert 4 spaces
set smarttab        " <BS> deletes <Tab> in insert mode

" FILE FINDING
" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" BUFFER MANAGEMENT
set autoread                                    " automatically read buffers that have changed outside Vim
set hidden                                      " hide buffers instead of unloading
" Reread buffer when entering
au FocusGained,BufEnter * :silent! !
" Auto save buffer when leaving it
au FocusLost,WinLeave * :silent! noautocmd w

" SYNTAX HIGHLIGHTING
syntax enable						
filetype indent on	" Load file type specific indenting rules 
filetype plugin indent on

" LINE NUMBERS
set cursorline		" Highlight the row the cursor is one
set number		    " show absolute line number under cursor
" set relativenumber	" show line numbers relative to cursor

" MISCELLANEOUS
set mouse=a				        " Enable the mouse
set wildmenu			        " In GUI mode, tab will suggest commands for you
set showmatch 			        " Show corresponding end braces
set backspace=indent,eol,start  " Modern backspacing behaviour

" Fix for delay on <Esc>Shift+o sequence
" https://github.com/vim/vim/issues/24
set timeout timeoutlen=5000 ttimeoutlen=100

" SEARCH
set ic				" Ignore case when searching by default
set hlsearch		" Highlight search matches
set incsearch		" Search as characters are entered

" SPELLING
" z= gives suggestions on misspelling
" zg marks bad as good
" zw marks good and bad
set spelllang=en_us	" Set spell checking dictionary to English
" set spell			" Turn on spell checking 
set nospell			" Turn off spell checking


" FOLDING
set foldmethod=indent
set foldlevel=99

" PLUGINS
" https://github.com/junegunn/vim-plug#usage
" Specify a directory for plugins. Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Language support
Plug 'sheerun/vim-polyglot'

" Interactive file finder
Plug 'preservim/nerdtree'

" Status and buffer line 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" nouns and motions to modify surroundings
Plug 'tpope/vim-surround'

" Pair up brackets!
Plug 'jiangmiao/auto-pairs'

" Show indents with lines
Plug 'yggdroot/indentline'

Plug 'tpope/vim-commentary'

Plug 'ycm-core/YouCompleteMe'

Plug 'airblade/vim-gitgutter'

Plug 'junegunn/seoul256.vim'

Plug 'michaeljsmith/vim-indent-object'

Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'

" Some plugins I'd like to try out:
" Plug 'vim-syntastic/syntastic'
" Plug 'dense-analysis/ale'
" Plug 'tpope/vim-fugitive'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'mattn/emmet-vim'
" Plug 'junegunn/limelight.vim'

call plug#end()

" CONFIGURE PLUGINS
" vim-airline/vim-airline
let g:airline_theme='base16_eighties'		" Start airline with this this theme
let g:airline_powerline_fonts=1                 " Use powerline fonts
let g:airline#extensions#tabline#enabled = 1	" Show open buffers at top
" abbreviate mode to one letter, remove RHS stuff

" preservim/nerdtree
let NERDTreeShowHidden=1				" Show hidden files in nerd tree

" YouCompleteMe
let g:ycm_confirm_extra_conf = 0

" COLORS
" load colors after plugins if using plugin color instead of ~/.vimrc/colors
set t_Co=256						" Set 256 color mode. Your terminal must support this
" colorschemes at ~/.vimrc/colors
" colorscheme solarized
" set background=dark
" colorscheme lucius
" LuciusLight
" colorscheme seoul256
" set background=light

" CUSTOM COMMANDS
command LightMode :colorscheme lucius | :set background=light
command DarkMode :colorscheme monokai | :set background=dark
command ReloadVimrc :source $MYVIMRC
command NukeIt :%bdelete|:edit .
" TODO: make color mode contingent on time. LightMode during day, DarkMode
" during night
" https://stackoverflow.com/questions/3368748/conditional-colorscheme-in-vimrc
LightMode        " use darkmode by default

" KEY MAPPINGS
" I don't think I know the default commands well enough to know what should be
" overwritten. Try to learn defaults better and use custom remaps sparingly
" CTRL-H go to previous buffer
nnoremap <C-L> :bnext!<CR>
" CTRL-L go to next buffer 
nnoremap <C-H> :bprevious!<CR>
" Open fuzzy finder
nnoremap <C-P> :FZF<Cr>
" Toggle NERDTree by Ctrl+n
nnoremap <C-N> :NERDTreeToggle<CR>
