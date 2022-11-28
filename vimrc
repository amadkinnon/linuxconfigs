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

sy on               " Enable Syntax Highlighting
"set guiligatures=!\"#$%&()*+-./:<=>?@[]^_{\|~ " Fancy font ligatures
set background=dark " Use a dark background
set scrolloff=8     " Keep the cursor in the center of the screen with =999
set sidescrolloff=5 " Scroll 5 cols from end

set nowrap          " Do not wrap lines
set hidden          " Hide buffers, don't close them
set visualbell      " No annoying beeping please
set tabstop=4       " 4 spaces is a good tab
set shiftwidth=4    " No tabs, only spaces
set expandtab       " Show matching block character for .2 seconds
set showmatch       " Show matching brackets
set matchtime=2     "   for 2 seconds
set linespace=16    " Add a little line padding
set number          " Turn on line numbering
set showcmd         " Show the command being typed
set autowrite       " Autowrite files
set ttymouse=xterm2 " Mouse behaviour emulation
set smartindent     " Try to be smart about indenting
set autoindent      " Automatically indent code blocks
set copyindent      " Copy the previous indenting
set smarttab        " insert tabs on the start of a line according to shiftwidth, not tabstop
set shiftround      " Use multiples of shiftwidth when shifting text
set history=1000    " Big history buffer
set undolevels=1000 " Big under buffer
" set nohlsearch      " Don't highlight my search results
set title           " Put the file name in the title bar
set formatoptions+=c " Automatically wrap comment lines and insert a leading comment character
set formatoptions+=j " Automatically remove comment character when joining lines
set tw=120          " Break lines at 120 chars
set foldenable      " Enable folding, but make it manual
set foldmethod=manual
set incsearch
set wildmenu

" Ignore wildcard expansion for these types of files
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
set wildignore+=*/vendor/**
set wildignore+=*/public/forum/**

set backupdir=~/.vim/backup// " Set custom backup directory
set directory=~/.vim/swap//   " Set custom swap directory

set laststatus=2    " Status line height
set encoding=utf-8
set noshowmode

nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

nmap <C-v> :vertical resize +1<cr>
nmap <C-b> :vertical resize -1<cr>
nmap :ed :edit %:p:h/

" Fuzzy find with Ctrl-/
nmap <C-_> :Rg<cr>

" Install vim-plug
"   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" vim-plug required:
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

"Plug 'junegunn/vim-easy-align'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'gruvbox-community/gruvbox'        " All the fancy colorschemes
  Plug 'ctrlpvim/ctrlp.vim'            " Find files with ctrl-p
  Plug 'powerline/powerline'           " Powerline config
  "Plug 'vim-syntastic/syntastic'       " Syntax Checking
  "Plug 'unblevable/quick-scope'        " Highlights occurrences of characters for quick moving
  Plug 'kien/rainbow_parentheses.vim'  " Highlights matching parens/braces
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Golang helper
  Plug 'jlanzarotta/bufexplorer'       " Easy buffer selection
  "Plug 'vimwiki/vimwiki'               " Take notes and such in a wiki
  Plug 'scrooloose/nerdcommenter'      " Easy line/block commenting
  "Plug 'SirVer/ultisnips'              " Snippets
  "Plug 'honza/vim-snippets'            " Snippets
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-fugitive'            " Integrate with Git
  "Plug 'camspiers/animate.vim'         " Animate resizing windows
  Plug 'camspiers/lens.vim'            " Automatically resize windows
  "Plug 'christoomey/vim-tmux-navigator' " Seamlessly switch between tmux panes and vim splits
  "Plug 'dense-analysis/ale'
  "Plug 'leafgarland/typescript-vim'    " Typescript syntax
  "Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['yaml'] }
  Plug 'jparise/vim-graphql'            " Support Graphql

call plug#end()

"colorscheme xoria256 " Colorscheme to use
colorscheme gruvbox " Colorscheme to use

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

" Set for javascript
au FileType javascript :setlocal sw=2 ts=2
au FileType typescript :setlocal sw=2 ts=2

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Tags
set tags=./tags;/

" Simple Brace/Parens Completion
inoremap {<CR> {<CR>}<C-c>O
inoremap (<SPACE> ()<C-c>i

" Use fzf for buffers
nmap <leader>Be :Buffers<CR>

" Powerline config
let g:minBufExplForceSyntaxEnable = 1
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" listchars setting, highlights spaces with fancy chars
set listchars=tab:▸\ ,trail:·,extends:>,precedes:<,nbsp:+
set nolist

" Pull in coc config
so ~/.vim/coc_config.vim

" set some vim-fugitive mappings
nmap <leader>gs :Git<CR>
nmap <leader>gc :Git commit<CR>
nmap <leader>gp :Git push<CR>
nmap <leader>gP :Git push -f<CR>
nmap <leader>gh :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>

" CTRLP Settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_custom_ignore = { 'dir': '\v[\/]\.(git|hg|svn)$', 'file': '\v\.(exe|so|dll)$' }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Removes trailing spaces
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
autocmd BufWritePre * :call TrimWhiteSpace()

" Highlight these keywords
autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|XXX\|BUG\|HACK\)')
autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')
autocmd Syntax * call matchadd('Underlined', '\W\zs\(DONE\|COMPLETE\|NA\)')

" Setting to highlight blade template files as php files - Laravel specific
autocmd BufRead,BufNewFile *.php set filetype=php.laravel.html
autocmd BufRead,BufNewFile *.tsx set filetype=typescript

" Rainbow Parens Enable
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Vim-go mappings
autocmd FileType go nmap <leader>r  <Plug>(go-run)
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>f :GoFmt<CR>
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
let g:go_fmt_command = "goimports"

" ----- FZF Stuff -----
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
