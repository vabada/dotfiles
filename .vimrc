set nocompatible              " be iMproved, required
filetype off                  " required

" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My plugins
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tpope/vim-commentary'
Plugin 'nvie/vim-flake8'
Plugin 'airblade/vim-gitgutter'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'tomtom/tinykeymap_vim'
Plugin 'vim-airline/vim-airline'

call vundle#end()            " required
filetype plugin indent on    " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" MY_VIMRC
" search related highlight
set hls

" <F6> redraws the screen and removes any search highlighting.
nnoremap <silent> <F6> :nohl<CR><C-d>

" set relativenumber
set number

" YAML tab = 2 blank spaces
autocmd FileType yaml setlocal ts=2 sw=2 expandtab

" https://github.com/nvie/vim-flake8
autocmd FileType python map <buffer> <F3> :call Flake8()<CR>
" http://stackoverflow.com/questions/235439/vim-80-column-layout-concerns
autocmd BufRead,BufNewFile   *.py highlight OverLength ctermbg=red ctermfg=white guibg=#592929
autocmd BufRead,BufNewFile   *.py match OverLength /\%81v.\+/

set expandtab           " enter spaces when tab is pressed
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent

" http://superuser.com/questions/99741/how-to-add-a-new-line-with-the-same-indentation
set autoindent          " copy indent from current line when starting a new line
set smartindent

" make backspaces more powerfull
set backspace=indent,eol,start
set ruler               " show line and column number
syntax on               " syntax highlighting
set showcmd             " show (partial) command in status line

" http://stackoverflow.com/questions/4477031/vim-auto-indent-with-newline
" imap <C-Return> <CR><CR><C-o>k<Tab>

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" vimcasts.org
filetype on

" Bash shell choosing from multiple matches
"set wildmode=longest,list
"zsh autocomplete menu
set wildmenu
set wildmode=full

" Extend Vim's default history
set history=10000

" for linux and windows users (using the control key)
map <C-S-]> gt
map <C-S-[> gT
map <C-1> 1gt
map <C-2> 2gt
map <C-3> 3gt
map <C-4> 4gt
map <C-5> 5gt
map <C-6> 6gt
map <C-7> 7gt
map <C-8> 8gt
map <C-9> 9gt
map <C-0> :tablast<CR>

" https://github.com/scrooloose/syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pep8']

" http://stackoverflow.com/a/15317146/2399154
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" http://stackoverflow.com/questions/19934060/vim-how-to-go-to-the-declaration-of-a-class-method-function-variable-etc
:set tags=./tags;

" essential.vim
filetype plugin on

" Temporary disable the arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" https://github.com/JamshedVesuna/vim-markdown-preview
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<C-m>'

" http://stackoverflow.com/questions/3961859/how-to-copy-to-clipboard-in-vim
set clipboard=unnamedplus
" set clipboard=unnamed

" http://vimcasts.org/episodes/spell-checking/
" Toggle spell checking on and off with `,s`
let mapleader = ","
nmap <silent> <leader>s :set spell!<CR>

" Set region to British English
set spelllang=en_gb

"http://stackoverflow.com/questions/2514445/turning-off-auto-indent-when-pasting-text-into-vim
" set paste

"https://stackoverflow.com/questions/1979520/auto-open-nerdtree-in-every-tab
autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror
autocmd VimEnter * wincmd w

"https://stackoverflow.com/questions/5057359/how-can-i-show-hidden-files-starting-with-period-in-nerdtree
let NERDTreeShowHidden=1
let g:NERDTreeDirArrows=0
"https://stackoverflow.com/questions/5601749/how-to-filter-out-files-by-extension-in-nerdtree
let NERDTreeIgnore = ['\.pyc$']
" https://github.com/kien/ctrlp.vim/issues/279
let g:ctrlp_show_hidden = 1

" http://vim.wikia.com/wiki/VimTip427
" if bufwinnr(1)
" 	map + <C-W>+
" 	map - <C-W>-
" 	map <c-x> <C-W>>
" 	map <c-m> <C-W><
" endif

" Delete blank spaces at EOL when saving file
" http://vim.wikia.com/wiki/Remove_unwanted_spaces
autocmd BufWritePre * %s/\s\+$//e

" https://github.com/lsdr/monokai
syntax enable
colorscheme monokai

"http://vim.wikia.com/wiki/Search_for_visually_selected_text
vnoremap // y/<C-R>"<CR>
