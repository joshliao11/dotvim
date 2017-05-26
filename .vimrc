let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
    echo 'Installing Vundle ...'
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/Vundle.vim
endif
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" plugin on GitHub repo
Plugin 'joshliao11/php-doc.vim'
Plugin 'joshliao11/php'
Plugin 'joshliao11/html'
"Plugin 'joshliao11/snipmate'
Plugin 'joshliao11/vim-l9'
Plugin 'mattn/emmet-vim'
Plugin 'vim-scripts/OOP-javascript-indentation'
Plugin 'kien/ctrlp.vim'
Plugin 'othree/html5.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'tmhedberg/matchit'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'powerline/fonts'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Townk/vim-autoclose'
Plugin 'ap/vim-css-color'
Plugin 'easymotion/vim-easymotion'
Plugin 'airblade/vim-gitgutter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-surround'
Plugin 'StanAngeloff/php.vim'
Plugin 'webberwu/vim-fugitive'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

" Optional:
Plugin 'joshliao11/vim-snippets'
"Plugin 'SirVer/ultisnips'

" All of your Plugins must be added before the following line
call vundle#end()            " required
set encoding=utf-8
set fileencodings=utf-8,big5

syntax on
set t_Co=256
set incsearch
set hls
set nu
set ru
set ic
set encoding=utf-8
set fileencoding=utf-8
" set mouse=a
set modeline
set cursorline
"set background=dark
set backspace=indent,eol,start
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set history=100
set expandtab
set sw=4
set tabstop=4
set nocompatible              " be iMproved, required
set nobomb
set showmatch
set smartindent
set wildmode=longest,list " use emacs-style tab completion when selecting files, etc
set wildmenu

filetype plugin indent on    " required

"colorscheme desert
colorscheme molokai

"StanAngeloff/php.vim
let php_parent_error_close = 1
let php_parent_error_open  = 1
let php_folding = 2

"Put at the very end of your .vimrc file.
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'wombat'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

let g:airline#extensions#branch#enabled = 1

let g:airline_left_sep = ''
let g:airline_right_sep = ''

let g:airline_symbols.branch = '⎇'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.readonly = 'R'

set laststatus=2
"set statusline=%0*\ %{fugitive#statusline()}\ %*
"set statusline+=%2*\ %*
"set statusline+=%3*%m%r%*
"set statusline+=%2*%f\ %*
"set statusline+=%1*\ %{&ff},%{&fileencoding}%Y%H%W
"set statusline+=%=%*
"set statusline+=%1*\ dec:\%3.b,\ hex:\%2.B\ %*
"set statusline+=%2*\ row:%4.l/%4.L,\ col:%3.c\ %*
"set statusline+=%0*\ %3.p%%\ %*
"highlight User1 cterm=none ctermbg=235 ctermfg=grey
"highlight User2 cterm=none ctermbg=237 ctermfg=white
"highlight User3 cterm=none ctermbg=237 ctermfg=darkred
"highlight Normal ctermbg=none

"Auto commands
autocmd BufNewFile,BufRead *.phtml set filetype=php
autocmd BufNewFile,BufRead *.html set filetype=html
autocmd BufNewFile,BufRead *.htm set filetype=html

highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

set foldmethod=indent
set foldlevelstart=99
"autocmd BufWinLeave * mkview
"autocmd BufWinEnter * silent loadview
"autocmd Syntax php normal zR

inoremap jj <ESC>
inoremap jm $
inoremap jk ->
inoremap jl =>
noremap .rs :%s/\s\+$//<CR>

"php-doc
inoremap <C-K> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-K> :call PhpDocSingle()<CR>
vnoremap <C-K> :call PhpDocRange()<CR>

"let NERDTreeIgnore=['\~$', '\.lo$', '\.la$']

"easymotion
let g:EasyMotion_leader_key = '<Leader>'
let g:EasyMotion_smartcase = 1
map <Leader> <Plug>(easymotion-prefix)
" Gif config
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

"ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

"vim-indent-guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
hi IndentGuidesOdd  ctermbg=233
hi IndentGuidesEven ctermbg=234

"vim-autocomplpop
let g:acp_behaviorUserDefinedMeets = 'acp#meetsForKeyword'
let g:acp_behaviorUserDefinedFunction = 'syntaxcomplete#Complete'

autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 0
autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_loc_list=1
let g:syntastic_php_checkers=['php', 'phpmd']
let g:syntastic_css_checkers=[]
let g:syntastic_javascript_checkers=['jshint']

"back to last edit position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"Shougo/neocomplcache.vim
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
"let g:neocomplcache_enable_auto_select = 1
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
if !exists('g:neocomplcache_force_omni_patterns')
    let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

"tagbar
nmap <F9> :TagbarToggle<CR>

"load partial
nnoremap <silent> <F7> :call EventInit()<CR>
function EventInit()
    execute '1s/.*/<?php/'
    call append(1, "require_once(__DIR__ . '/init.php');")
    call append(2, "?><!DOCTYPE html>")
    let sline = search("<link")
    call append(sline - 1, "<?= $view->partial('fbmeta.phtml', $view) ?>")
    let titletag = search('<title>')
    execute titletag . 's/\>.*\</><?= $eventTitle ?><\/'

    let sline = search("main.js")
    call append(sline, "<?= $view->partial('head.phtml', $view) ?>")
    let sline = search("<body")
    call append(sline, "<?= $view->partial('fbroot.phtml', $view) ?>")
    call append(sline + 1, "<?= $view->partial('header.phtml', $view) ?>")
    let sline = search("</body>")
    call append(sline - 1, "<?= $view->partial('ga.phtml', $view) ?>")
endfunction

set completeopt-=preview
