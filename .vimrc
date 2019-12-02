"put this line first in ~/.vimrc
set modifiable      " Allow changes to my options
"set nocompatible | filetype indent plugin on | syn on
"set guioptions=M
set t_Co=256
if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif
"NeoBundle Scripts-----------------------------
if &compatible
    set nocompatible               " Be iMproved
endif

" Set caps lock to escape
"au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
"au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

" Required:
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('flazz/vim-colorschemes')
    call dein#add('scrooloose/nerdtree')
    call dein#add('scrooloose/syntastic')
    call dein#add('ctrlpvim/ctrlp.vim')
    call dein#add('hdima/python-syntax')
    call dein#add('unblevable/quick-scope')
    call dein#add('scrooloose/nerdcommenter')
    call dein#add('kien/rainbow_parentheses.vim')
    call dein#add('powerline/powerline')
    call dein#add('jlanzarotta/bufexplorer')
    call dein#add('fatih/vim-go')
"    call dein#add('zxqfl/tabnine-vim')
    call dein#add('felixhummel/setcolors.vim.git')

    " Add or remove your Bundles here:
    "call dein#add('Shougo/neosnippet.vim')
    "call dein#add('Shougo/neosnippet-snippets')
    "call dein#add('tpope/vim-fugitive')
    "call dein#add('msanders/snipmate.vim')
    "call dein#add('bonsaiben/bootstrap-snippets')
    "call dein#add('markwu/vim-laravel4-snippets')
    "call dein#add('mattn/emmet-vim')
    "call dein#add('jwalton512/vim-blade')
    "call dein#add('SirVer/ultisnips')
    "call dein#add('tobyS/vmustache')
    "call dein#add('tobyS/pdv')
    "call dein#add('Valloric/YouCompleteMe')
    " You can specify revision/branch/tag.
    "call dein#add('Shougo/vimshell', { 'rev' : '3787e5' })

    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif

"    call dein#install()
    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on 
syntax enable


" Nerdtree
map <C-n> :NERDTreeToggle<CR>
" Close if only nerdtree window is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Open nerdtree if no file specified on commandline
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

nmap <C-v> :vertical resize +1<cr>
nmap <C-b> :vertical resize -1<cr>
nmap :ed :edit %:p:h/

sy on " Enable Syntax Highlighting
set background=dark
colorscheme xoria256

set nowrap " Do not wrap lines
set hidden " Hide buffers, don't close them
set visualbell " No annoying beeping please
set tabstop=4 " 4 spaces is a good tab
set shiftwidth=4 " No tabs, only spaces
set expandtab " Show matching block character for .2 seconds
set showmatch " 
set matchtime=2
set linespace=14
set number

" Show the command being typed
set showcmd
set autowrite
set ttymouse=xterm2
" " Automatically indent code blocks
set autoindent    
set copyindent    " Copy the previous indenting
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set shiftround    " Use multiples of shiftwidth when shifting text              
set history=1000  " Big history buffer
set undolevels=1000 " Big under buffer
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildignore+=*/vendor/**
set wildignore+=*/public/forum/**
set nohlsearch      " Don't highlight my search results
set title           " Put the file name in the title bar
set formatoptions=c " Automatically wrap comment lines and insert a leading comment character

" Enable folding
set foldenable
set foldmethod=manual
set tw=120

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

let g:Perl_AuthorName      = 'Adam MacKinnon'
let g:Perl_AuthorRef       = 'MacKinnonA'                         
let g:Perl_Email           = 'Adam.MacKinnon@sigmastcomms.com'            
let g:Perl_Company         = 'Sigmast Communications'

let g:Powerline_symbols = 'fancy'
set rtp+=/usr/lib/python3.6/site-packages/powerline/bindings/vim/
set laststatus=2
set encoding=utf-8
set showtabline=2
set noshowmode

let g:minBufExplForceSyntaxEnable = 1
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" listchars setting
set listchars=tab:▸\ ,trail:·
set list


" Emmet-Vim Settings
"let g:user_emmet_leader_key='<C-Z>'

" CTRLP Settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_custom_ignore = { 'dir': '\v[\/]\.(git|hg|svn)$', 'file': '\v\.(exe|so|dll)$' }

" Removes trailing spaces
"function! TrimWhiteSpace()
"    %s/\s\+$//e
"endfunction
"autocmd BufWritePre *.php :call TrimWhiteSpace()

autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|XXX\|BUG\|HACK\)')
autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')
autocmd Syntax * call matchadd('Underlined', '\W\zs\(DONE\|COMPLETE\|NA\)')

autocmd BufRead,BufNewFile *.php set filetype=php.laravel.html

" enable quick_scope conditionally
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
" https://github.com/scrooloose/syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" Settings for PHP Doc block plugin pdv
"let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
"nnoremap <buffer> <C-d> :call pdv#DocumentWithSnip()<CR>
"
" Rainbow Parens Enable
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
