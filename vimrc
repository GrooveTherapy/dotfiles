set nocompatible 
filetype plugin indent on

" Syntax highlighting rules
syntax enable						" show syntax highlighting
autocmd BufNewFile,BufRead *.xaml set syntax=xml 	" Manually set syntax hightlight rules for xaml files to xml

set number 		" Show numbers on the LHS of the editor
set t_Co=256		" Set 256 Color Mode (make sure you are using a terminal that supports this...)
colorscheme lucius 	" Use lucius.vim colorscheme at ~/.vimrc/colors and using the LuciusLight theme (see: http://www.vim.org/scripts/script.php?script_id=2536)
LuciusLight 		" This line specified which theme in the lucius colorscheme to use

" set mouse=a		" Enable the mouse

set wildmenu		" In GUI mode, tab will suggest commands for you
set cursorline		" Highlight the row the cursor is one
filetype indent on	" Load file type specific indenting rules 
set showmatch 		" Show corresponding end braces
" set showcmd 		" Show info about commands running

set hlsearch					" Highlight search matches
set incsearch					" Search as characters are entered
" nnoremap <leader><space> :nohlsearch<CR> 	" Remove search highlighting

set laststatus=2						" Show status line at the bottom of the screen
let g:airline_theme='wombat'					" Start airline with this this theme
let g:airline_powerline_fonts = 1				" Use powerline fonts
let g:airline#extensions#tabline#enabled = 1			" Show tabline at the top of the screen
let NERDTreeShowHidden=1					" Show hidden files in nerd tree

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0				" Set to false - this seems to improve performance quite a bit
let g:syntastic_check_on_wq = 0

" YCM Settings
let g:ycm_add_preview_to_completeopt = 0			" This line and below disable the preview window from YCM
set completeopt-=preview

set spell spelllang=en_us					" Set spell checking dictionary to english
set spell							" Turn on spell checking (z= gives suggestions on misspelling.  zg marks bad as good.  zw marks good and bad)

nnoremap <CR> o<ESC>						" Enter will insert a new line
nnoremap <BS> ddk						" goofing around with backspace behaviour (delete current line and go up line)
nnoremap <C-N> :NERDTreeToggle<CR>				" Toggle NERDTree by Ctrl+n
nnoremap <C-L> :bnext!<CR>					" CTRL-H go to previous buffer
nnoremap <C-H> :bprevious!<CR>					" CTRL-L go to next buffer 
nnoremap sa :wall<CR>						" Save all
nnoremap st :w<CR>						" Save this
nnoremap ca :qall<CR>						" Close all
nnoremap ct :bd<CR>						" Close this
nnoremap <C-j> 3j<CR>						" CTRL-J jump down a handful of lines
nnoremap <C-k> 3k<CR>						" CTRL-K jump up a handful lines
nnoremap <C-D> :sh<CR>						" Drop into (and out of!) the shell
set backspace=indent,eol,start  				" Modern backspace behaviour

" Folding settings
set foldmethod=indent
set foldlevel=99
nnoremap <space> za						" Space bar will open/close folds

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
 " alternatively, pass a path where Vundle should install plugins
 "call vundle#begin('~/some/path/here')

 " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'			" Vundle Vim package manager
Plugin 'fatih/vim-go'				" Syntax highlighting for Go
Plugin 'altercation/vim-colors-solarized' 	" Fancy color scheme (Doesn't work!)
Plugin 'nsf/gocode', {'rtp': 'vim/'}		" Autocomplete Daemon for Go
Plugin 'scrooloose/nerdtree'			" Interactive file finder!
" Plugin 'kien/ctrlp'				" Fuzzy file finder
Plugin 'Valloric/YouCompleteMe'			" Code completion.  Don't forget to install the compiled component 
Plugin 'bling/vim-airline'			" Status and buffer line 
Plugin 'vim-airline/vim-airline-themes'		" Change airline themes
Plugin 'scrooloose/syntastic'			" Syntax checker
" Plugin 'tpope/vim-surround'                  " Changing surround scoping

" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
"
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line
