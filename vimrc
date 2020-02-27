"put this line first in ~/.vimrc
set modifiable      " Allow changes to my options
"set nocompatible | filetype indent plugin on | syn on
"set guioptions=M
if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif

if &compatible
    set nocompatible               " Be iMproved
endif

filetype plugin indent on
syntax enable

nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

nmap <C-v> :vertical resize +1<cr>
nmap <C-b> :vertical resize -1<cr>
nmap :ed :edit %:p:h/

" Install vim-plug
"   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" vim-plug required:
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

"Plug 'junegunn/vim-easy-align'
" Code Completion Plugin
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif

  Plug 'flazz/vim-colorschemes'        " All the fancy colorschemes
  Plug 'ctrlpvim/ctrlp.vim'            " Find files with ctrl-p
  Plug 'powerline/powerline'           " Powerline config
  Plug 'vim-syntastic/syntastic'       " Syntax Checking
  Plug 'unblevable/quick-scope'        " Highlights occurrences of characters for quick moving
  Plug 'kien/rainbow_parentheses.vim'  " Highlights matching parens/braces
  Plug 'fatih/vim-go', { 'for': 'go' } " Golang helper
  Plug 'jlanzarotta/bufexplorer'       " Easy buffer selection
  Plug 'vimwiki/vimwiki'               " Take notes and such in a wiki
  Plug 'scrooloose/nerdcommenter'      " Easy line/block commenting
  Plug 'SirVer/ultisnips'              " Snippets
  Plug 'honza/vim-snippets'            " Snippets
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'              " Fuzzy find
  Plug 'christoomey/vim-tmux-navigator'" Seamlessly switch between tmux panes and vim splits
  Plug 'camspiers/animate.vim'         " Animate resizing windows
  Plug 'camspiers/lens.vim'            " Automatically resize windows

call plug#end()
let g:deoplete#enable_at_startup = 1

sy on               " Enable Syntax Highlighting
set background=dark " Use a dark background
" set scrolloff=999   " Keep the cursor in the center of the screen

colorscheme xoria256 " Colorscheme to use

set nowrap          " Do not wrap lines
set hidden          " Hide buffers, don't close them
set visualbell      " No annoying beeping please
set tabstop=4       " 4 spaces is a good tab
set shiftwidth=4    " No tabs, only spaces
set expandtab       " Show matching block character for .2 seconds
set showmatch       " Show matching brackets
set matchtime=2     "   for 2 seconds
set linespace=14    " Add a little line padding
set number          " Turn on line numbering
set showcmd         " Show the command being typed
set autowrite       " Autowrite files
set ttymouse=xterm2 " Mouse behaviour emulation
set smartindent     " Try to be smart about indenting
set autoindent      " Automatically indent code blocks
set copyindent      " Copy the previous indenting
set smartcase       " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab        " insert tabs on the start of a line according to shiftwidth, not tabstop
set shiftround      " Use multiples of shiftwidth when shifting text
set history=1000    " Big history buffer
set undolevels=1000 " Big under buffer
" set nohlsearch      " Don't highlight my search results
set title           " Put the file name in the title bar
set formatoptions=c " Automatically wrap comment lines and insert a leading comment character
set tw=120          " Break lines at 120 chars
set foldenable      " Enable folding, but make it manual
set foldmethod=manual

" Ignore wildcard expansion for these types of files
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
set wildignore+=*/vendor/**
set wildignore+=*/public/forum/**

" Create backup and swap directories if they don't exist
if !isdirectory("~/.vim/backup")
    call mkdir("~/.vim/backup", "p")
endif

if !isdirectory("~/.vim/swap")
    call mkdir("~/.vim/swap", "p")
endif

set backupdir=~/.vim/backup// " Set custom backup directory
set directory=~/.vim/swap//   " Set custom swap directory

set laststatus=2    " Status line height
set encoding=utf-8  " Character encodign
set noshowmode

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Simple Brace/Parens Completion
inoremap {<CR> {<CR>}<C-c>O
inoremap (<SPACE> ()<C-c>i

" Powerline config
let g:minBufExplForceSyntaxEnable = 1
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" listchars setting, highlights spaces with fancy chars
set listchars=tab:▸\ ,trail:·
set list

" CTRLP Settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_custom_ignore = { 'dir': '\v[\/]\.(git|hg|svn)$', 'file': '\v\.(exe|so|dll)$' }

" Removes trailing spaces
"function! TrimWhiteSpace()
"    %s/\s\+$//e
"endfunction
"autocmd BufWritePre *.php :call TrimWhiteSpace()

" Highlight these keywords
autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|XXX\|BUG\|HACK\)')
autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')
autocmd Syntax * call matchadd('Underlined', '\W\zs\(DONE\|COMPLETE\|NA\)')

" Setting to highlight blade template files as php files - Laravel specific
autocmd BufRead,BufNewFile *.php set filetype=php.laravel.html

" quickscope pluging - enable quick_scope conditionally
let g:qs_enable = 0
let g:qs_enable_char_list = [ 'f', 'F', 't', 'T' ]

function! Quick_scope_selective(movement)
    let needs_disabling = 0
    if !g:qs_enable
        QuickScopeToggle
        redraw!
        let needs_disabling = 1
    endif
    let letter = nr2char(getchar())
    if needs_disabling
        QuickScopeToggle
    endif
    return a:movement . letter
endfunction

" quick_scope maps, operator-pending mode included (can do 'df' with hint)
for i in g:qs_enable_char_list
    execute 'noremap <expr> <silent>' . i . " Quick_scope_selective('". i . "')"
endfor

" Syntastic Settings - Recommended
" https://github.com/vim-syntastic/syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--max-line-length=120'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Rainbow Parens Enable
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces