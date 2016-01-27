" put this line first in ~/.vimrc
set modifiable      " Allow changes to my options
set nocompatible | filetype indent plugin on | syn on
set t_Co=256

"NeoBundle Scripts-----------------------------
if has('vim_starting')
    if &compatible
        set nocompatible               " Be iMproved
    endif

    " Required:
    set runtimepath+=/home/mackinnona/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/home/mackinnona/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Lokaltog/powerline'
NeoBundle 'jlanzarotta/bufexplorer'
NeoBundle 'msanders/snipmate.vim'
NeoBundle 'bonsaiben/bootstrap-snippets'
NeoBundle 'markwu/vim-laravel4-snippets'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'unblevable/quick-scope'
NeoBundle 'jwalton512/vim-blade'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'tobyS/vmustache'
NeoBundle 'tobyS/pdv'
NeoBundle 'Valloric/YouCompleteMe'

" You can specify revision/branch/tag.
"NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

map <C-n> :NERDTreeToggle<CR>
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

nmap <C-v> :vertical resize +5<cr>
nmap <C-b> :vertical resize -5<cr>
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
let g:Perl_Email           = 'Adam.MacKinnon@MyNSLC.com'            
let g:Perl_Company         = 'Nova Scotia Liquor Corporation'

let g:Powerline_symbols = 'fancy'
set laststatus=2
set encoding=utf-8
set noshowmode

" Emmet-Vim Settings
let g:user_emmet_leader_key='<C-Z>'

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

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Settings for PHP Doc block plugin pdv
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <buffer> <C-d> :call pdv#DocumentWithSnip()<CR>
