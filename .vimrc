" Author: Kolozsi Robert <kolozsi.robert@gmail.com>
" Date: March 28, 2013 (last modified)
" Setup collection.

" Automaticaly reloads my .vimrc file.
autocmd! bufwritepost .vimrc source %

set nocompatible " Not compatible with Vi!

syntax on
filetype on
filetype plugin on
filetype plugin indent on " set ofu=syntaxcomplete#Complete
" syntaxcomplete.vim plugin
" http://www.vim.org/scripts/script.php?script_id=3172
if has("autocmd") && exists("+omnifunc")
autocmd Filetype *
            \	if &omnifunc == "" |
            \	 setlocal omnifunc=syntaxcomplete#Complete |
            \	endif
    endif

" <<leader>> key
let mapleader=","
" maplocalleader mappings that only take effect for certain types of files.
let maplocalleader="\\"


" Powerline setup.
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" Selection stays while moving indentation.
vnoremap < <gv
vnoremap > >gv

" Show whitespace
" Must be inserted before the colorscheme command
augroup extra_white
    autocmd!
    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=89 guibg=#87005f
    au InsertLeave * match ExtraWhitespace /\s\+$/
augroup END

" Undo stuff.
set history=1000
set undolevels=1000
set undofile
set undoreload=1000
set undodir=~/.vim/undodir

runtime macros/matchit.vim "This is for tag matching with '%'

"Seting $ sign while editing and things you changing
"set cpoptions+=$

"Setting the virtualedit mode
"set virtualedit all

set expandtab " Use spaces instad tab.
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround "" Don't understand for what is this for.

" Indentention
set autoindent
set smartindent
"
" This should switch of the no indent in python comment
" when typing # in new line. The ^H characters are
" done by CTRL+v CTRL+h
inoremap # #

" This should maybe restriced to python files?
" But it seams doesn't work!
"autocmd BufRead *.py inoremap #X<c-h>#<space>


" Misc.
set cursorline
set encoding=utf-8
set modeline
set modelines=1 " The las line in the file e.g. " vim: someoption=val:
set showmode
set showcmd
set hidden "Keep undo history when switching buffers??? Don't know yet what is this!!!!!
set ttyfast
set lazyredraw  " This solved vim's slow response when syntax higlighting in on.
" set backspace=indent,eol,start
set showmatch
set title
set ruler
set number
"set nonumber
"set norelativenumber
"set relativenumber
"set ignorecase
set smartcase
set scrolloff=3 " Cursor offset from screen sides.
"set tw=120  " Width of document.
"set colorcolumn=+1  " Related to the 'tw' setting above.

" Show tab and newline chars.
set list
set listchars=tab:→\ ,eol:⏎,extends:>,precedes:<

set linespace=0 " Number of pixel lines inserted between characters.
set shell=/bin/bash\ --login
" set lazyredraw
set matchtime=3
" set showbreak=-
set splitbelow
set splitright
"set fillchars=stl:^,stlnc:-,vert:\|,fold:~,diff:-
set fillchars=vert:\|,fold:~,diff:-
" set autowrite " When out of buffer write the file.
set autoread
set shiftround
set linebreak
set fileformat=unix " (&ffs)
" set dictionary=/home/robi/dict/words
" set spellfile=~/.vim/spell/hunspchk.vim

" Don't try to highlight lines longer then 200 characters.
set synmaxcol=300

" Time out on key codes but not mappings.
" Don't know for what is this yet????
" set notimeout
" set ttimeout
" set ttimeoutlen=10

"set nowrap "don't automatically wrap on load
set wrap
set fo-=t " don't automatically wrap text when typing
"set visualbell
set linebreak

" Clean old highlight searches
augroup no_highlighting
    au!
    au! FileType * nohl
augroup END

augroup python_editing
    autocmd!
    autocmd FileType python set tw=79
    autocmd FileType python set colorcolumn=+1
    autocmd FileType html set wrap
    autocmd FileType html set linebreak
augroup END

augroup javascript_editing
    autocmd!
    autocmd FileType javascript set tw=120
    autocmd FileType javascript set colorcolumn=+1
augroup END

augroup vim_editing
    autocmd!
    autocmd FileType vim set tw=79
    autocmd FileType vim set colorcolumn=+1
augroup END

augroup html_editing
    autocmd!
    autocmd FileType html set tw=120
    autocmd FileType htmldjango set tw=120
    autocmd FileType html set colorcolumn=+1
    autocmd FileType htmldjango set colorcolumn=+1
    autocmd FileType html set nowrap
    autocmd FileType htmldjango set nowrap
    autocmd FileType html set nolinebreak
    autocmd FileType htmldjango set nolinebreak
augroup END

" Color Schemas {{{
"
" Solarized colorscheme setup for terminal.
"let g:solarized_termcolors=256
"set background=light
set background=dark
"colorscheme solarized

" Personal color scheme settings.
set t_Co=256
"colorscheme gandalf-transparent " based on gandalf scheme
colorscheme gandalf " mixed and based on xoria256 & solarized
set guifont=courier_new:h10 | "for GUI!
" }}}

" Search settings.
" This should be to turn off hightlight search on file opening.
" execute 'normal! <silent> :nohlsearch\<cr>'
set hlsearch
set incsearch
"set ignorecase
set smartcase

" Backup & Swap files. {{{
" Creating and setting the .backup and .swap directories.
set backup
set swapfile
set backupdir=./.backup,~/tmp
set directory=./.swap,~/tmp
" Creating localy .backup & .swap directory
" if there are not existing in current/working dir.
autocmd! BufWritePre * :call CheckBackupSwapDirs()
function! CheckBackupSwapDirs()
    if !isdirectory("./.backup") && filewritable(".")
        silent execute "normal! :!mkdir .backup\<cr>"
    endif

    if !isdirectory("./.swap") && filewritable(".")
        silent execute "normal! :!mkdir .swap\<cr>"
    endif
endfunction
"set nobackup
"set nowritebackup
"set noswapfile
" }}}

if has("multi_byte")
    if &termencoding == ""
        let &termencoding = &encoding
    endif
    set encoding=utf-8
    setglobal fileencoding=utf-8
    "setglobal bomb
    set fileencodings=utf-8,ucs-bom,latin2
endif

" Folding settings
set foldmethod=marker "fold based on indent
"set foldmethod=indent "fold based on indent
"set foldmethod=manual "fold based on manual
set foldlevelstart=0 " When open new buffer fold everything.
set foldmarker={{{,}}}
set foldnestmax=10 "deepest fold is 10 levels
set foldenable "fold by default
set foldlevel=2
set foldcolumn=4

" Clipboard. Can't understand why but this makes possible to copy/paste between applications.
"set clipboard=unnamed
"set clipboard=unnamed
set clipboard=unnamedplus " Sets all yenks and dels to the system clipbard.
"set clipboard+=autoselect
"set nopaste
"set paste

"augroup folding " {{{1
"    autocmd!
"    autocmd BufWinLeave,BufWrite * mkview
"    autocmd BufWinEnter,BufRead * loadview
"augroup END " }}}

" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
"set nofoldenable

" Mini buffer explorer tab
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" Taglist stuff {{{
" to make tags file in current directory type:
" :!ctags -R *
let Tlist_Ctags_cmd="/use/bin/ctags"
let Tlist_WinWidth=50
let Tlist_Process_File_Always=1
nnoremap <F4> :TlistToggle<cr>
nnoremap <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>
" }}}
"
" ### Mappings ###
" Insert mode mappings for braces and quote marks.
inoremap {{     {}<left>
inoremap {<cr>  {<cr>}<esc>O
inoremap [[     []<left>
inoremap [<cr>  [<cr>]<esc>O
inoremap ((     ()<left>
inoremap (<cr>  (<cr>)<esc>O
inoremap ""     ""<left>
inoremap ''     ''<left>

"inoremap <<      <><left>
"inoremap </     </><left>
"inoremap <i     <img src="" /><esc>3hi
"inoremap <p     <p></p><esc>3hi
"inoremap <d     <div></div><esc>5hi
""inoremap <u     <u><cr></u><esc><Up>
"inoremap <i     <i></i><esc>3hi
"inoremap <in    <input type="" /><esc>3hi


" Java omnicomplete {{{
"if has("autocmd")
"    :autocmd Filetype java setlocal omnifunc=javacomplete#Complete
"endif
" }}}

" Have to restart vim if adding autocmd.
" HTML mappings.
augroup html_mappings
    autocmd!
    " Django template mappings.
    autocmd FileType htmldjango :inoremap <buffer> %% {%  %}<esc>2hi
    autocmd FileType htmldjango :inoremap <buffer> }} {{  }}<esc>2hi
    autocmd FileType htmldjango :inoremap <buffer> %i {% if   %}<esc>3hi
    autocmd FileType htmldjango :inoremap <buffer> %l {% else %}
    autocmd FileType htmldjango :inoremap <buffer> %e {% endif %}<esc>o<esc>
    autocmd FileType htmldjango :inoremap <buffer> %f {% for   in %}<esc>6hi
    autocmd FileType htmldjango :inoremap <buffer> %ef {% endfor %}<esc>o<esc>
    autocmd FileType htmldjango :inoremap <buffer> %c {% comment %}<esc>o<esc>
    autocmd FileType htmldjango :inoremap <buffer> %ec {% endcomment %}<esc>o<esc>

    " Basic HTML mappings.
    " First autocmd should be checked because the indentation is not correct.
    autocmd FileType html :inoremap <html <DOCTYPE! html><cr><html lang="en_us"><cr></html><esc>O<head><cr><tab><meta charset="utf-8"><cr><title></title><cr><link rel="stylesheet" type="text/css" href="" /><cr><script type="text/javascript" src=""></script><cr></head><esc>o<cr><body><cr></body><esc>
    autocmd FileType html :inoremap }} {{  }}<esc>2hi
    autocmd FileType html :inoremap <<  <><left>
    autocmd FileType html :inoremap </ </><left>
    autocmd FileType html :inoremap <img <img src="" /><esc>3hi
    autocmd FileType html :inoremap <p <p></p><esc>3hi
    autocmd FileType html :inoremap <d <div></div><esc>5hi
    autocmd FileType html :inoremap <u <u><cr></u><esc><Up>
    autocmd FileType html :inoremap <i <i></i><esc>3hi
    autocmd FileType html :inoremap <inp <input type="" /><esc>3hi
    autocmd FileType html :inoremap h1 <h1></h1><esc>4hi
    autocmd FileType html :inoremap h2 <h2></h2><esc>4hi
    autocmd FileType html :inoremap h3 <h3></h3><esc>4hi
    autocmd FileType html :inoremap h4 <h4></h4><esc>4hi
    autocmd FileType html :inoremap h5 <h5></h5><esc>4hi
    autocmd FileType html :inoremap h6 <h6></h6><esc>4hi
    autocmd FileType html :inoremap <br <br /><cr>
    autocmd FileType html :inoremap <buffer> <ul <ul><cr></ul><esc>O<li></li><esc>4hi
    autocmd FileType html :inoremap <buffer> <sc <script type="text/javascript" src=""></script><esc>10hi
    """""" Next is for commenting out visual selection!
    autocmd FileType html :vnoremap <buffer> <leader>c <esc>a--><esc>'<i<!--<esc>'>$
augroup END


"inoremap %%     {%   %}<esc>3hi
"inoremap }}     {{   }}<esc>3hi
"inoremap %i    {% if   %}<esc>3hi
"inoremap %l    {% else %}
"inoremap %e    {% endif %}<esc>o<esc>
"inoremap %f    {% for   in %}<esc>6hi
"inoremap %ef    {% endfor %}<esc>o<esc>


" C, JavaScript comment mappings.
" inoremap /**     /*  */<Left><Left><Left>
inoremap /**     /*  */<esc>3<Left>a
inoremap /*<cr> /*<cr>*/<Left><Left><Space>*<Space><cr><Up><Right><Right>
" inoremap /**    /*

" Remap jk for getting in to the normal mode. <esc> is so far away.
inoremap kj <esc>

" In case I fall in to a temptation!
inoremap <esc> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>

augroup code_line_commenting
    autocmd!
    autocmd FileType vim nnoremap <buffer> <localleader>c I"
    autocmd FileType c nnoremap <buffer> <localleader>c I//
    autocmd FileType cplusplus nnoremap <buffer> <localleader>c I//
    autocmd FileType javascript nnoremap <buffer> <localleader>c I//
    autocmd FileType php nnoremap <buffer> <localleader>c I//
    autocmd FileType python nnoremap <buffer> <localleader>c I#
augroup END

augroup code_snipets
    autocmd!
    autocmd FileType python :inoremap <buffer> iff if  :<left>
    autocmd FileType javascript :inoremap <buffer>
                \ iff if (; ; ) {<cr>}<esc>O;<esc><up>$5hi<left>
    autocmd FileType c :inoremap <buffer>
                \ iff if (; ; ) {<cr>}<esc>O;<esc><up>$5hi<left>
    autocmd FileType vim :inoremap <buffer>
                \ iff if <cr>endif<esc><up>A
    autocmd FileType vim :inoremap <buffer> ww while <cr>endwhile<esc><up>A
    autocmd FileType vim :inoremap <buffer> funn function! <cr><cr>endfunction<esc>2<u>A
augroup END

" Normal mode mapings.
" Tab mapings.
nnoremap ttn :tabnew<cr>
nnoremap ttd :tabclose<cr>
nnoremap <s-l> :tabnext<cr>
nnoremap <s-h> :tabprevious<cr>

" Move up the current line.
nnoremap <leader>- ddp
" Move down the current line.
nnoremap <leader>_ dd<up>P
" Put this line between two blank lines.
nnoremap <leader>= O<esc><down>o<esc><up>

" Map for quick open .vimrc file in a split window.
nnoremap <leader>rc :vsp $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Wrap the word with single and double quote.
nnoremap <leader>w ea'<esc>bi'<esc>
nnoremap <leader>ww ea"<esc>bi"<esc>
" Wrap a whole line with the single and double quote.
nnoremap <leader>l I'<esc>A'<esc>
nnoremap <leader>ll I"<esc>A"<esc>

" Wrap a whole visual selection in curly braces.
" vnoremap <leader>cb

" Wrap the selection with single and double quote.
vnoremap <leader>s <esc>`>a'<esc>`<i'<esc>
vnoremap <leader>ss <esc>`>a"<esc>`<i"<esc>

" One white space before and after some character/operator.
nnoremap <leader><space> i <esc><right>a <left><esc>

" Seting up Pathogen for management of plugins.
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
filetype off

"call pathogen#infect()
execute pathogen#infect()
"call pathogen#helptags()

filetype plugin indent on
syntax on

" Settings for Python IDE environment
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
" laststaus=0 -> never, =1 -> default (2 or more windows) and =2 -> always.
"let g:Powerline_symbols="fancy"
"call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')
"set rtp+=/home/robi/.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2

" Settings for ctrlp
" cd ~/.vim
" git clone https://github.com/kien/ctrlp.vim.git bundle/ctrlp.vim
let g:ctrlp_max_height=30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Settings for python-mode
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
"nnoremap <leader>g :call RopeGotoDefinition()<cr>
"let g:pymode = 1
"let g:pymode_warnings = 1
"let g:pymode_trim_whitespaces = 1
"let g:pymode_options = 1
" pymode quickfix
"let g:pymode_quickfix_minheight = 3
"let g:pymode_quickfix_maxheight = 6
"let g:pymode_indent = []
"let g:pymode_folding = 1
"let g:pymode_motion = 1
"let g:pymode_doc = 1 " :PymodeDoc
"let g:pymode_virtualenv = 1
"let g:pymode_run = 1 " :PymodeRun
"let g:pymode_breakpoint = 1 " <leader>b
"let g:pymode_lint = 1
"let g:pymode_lint_on_write = 1
"let g:pymode_lint_on_fly = 0
"let g:pymode_lint_message = 1
"let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
"let g:pymode_lint_signs = 1
"let g:pymode_lint_todo_symbol = 'WW'
"let g:pymode_lint_comment_symbol = 'CC'
"let g:pymode_lint_visual_symbol = 'RR'
"let g:pymode_lint_error_symbol = 'EE'
"let g:pymode_lint_info_symbol = 'II'
"let g:pymode_lint_pyflakes_symbol = 'FF'
"let g:pymode_rope = 1
"let g:pymode_rope_completion = 1
"let g:pymode_rope_complete_on_dot = 1
"pymode syntax
"let g:pymode_syntax = 1
"let g:pymode_syntax_all = 1


" Navigating through omnicomplete option list
" See http://stackowerflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

" ????????????????????
"inoremap <silent><C-j> <C-R>=OmniPopup('j')<cr>
"inoremap <silent><C-k> <C-R>=OmniPopup('k')<cr>

iabbrev k@ <robert.kolozsi@gmail.com>
iabbrev kr Kolozsi Róbert

" Select entire buffer
nnoremap sa ggVG

" gandalf: turning on all python 2 options: (Jan 3, 2013)
let python_highlight_all = 1

" gandalf: turning on django syntax highlight.
let g:django_python = 1

"augroup file_writing
"    autocmd!
"    " Save the file automatically if not exist
"    autocmd BufNewFile * :write
"    " Turn off line wrapping for html files.
"    autocmd BufNewFile,BufRead *.html setlocal nowrap
"augroup END

" If vim window has been resized. Doesn't work yet!
" This is actually problem of a terminal???
" autocmd VimResized :normal <c-w>=

" In NERDTree show dot files.
" To toggle it on/off use I.
let NERDTreeShowHidden = 1

" vim-signature settings.
"let g:SignatureIncludeMarks='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
let g:SignatureWrapJumps=1
"let g:SignatureMarkLeader="m"
"let g:SignatureLcMarkStr="\p\m"
"let g:SignatureUcMarkStr="\p\m"
"let g:SignaturePurgeConfirmation=0
"let g:SignatureDisableMenu=0
"let g:SignaturePeriodicRefresh=1

" Some shortcuts from
" http://eastcoastefx.vaesite.com/vim

" vim: set tw=79 colorcolumn=+1:
