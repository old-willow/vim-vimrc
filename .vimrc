" File: .vimrc
" Author: Kolozsi Robert <kolozsi.robert@gmail.com>
" Date: Jan 28, 2013 (last modified)
" Setup collection.

" Automaticaly reloads my .vimrc file.
autocmd! bufwritepost .vimrc source %

set nocompatible " Not compatible with Vi!

syntax on
filetype on
filetype plugin on
filetype plugin indent on
" set ofu=syntaxcomplete#Complete
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

" Misc.
set cursorline
set encoding=utf-8
set modeline
set modelines=1 " The las line in the file e.g. " vim: someoption=val:
set showmode
set showcmd
set hidden "Keep undo history when switching buffers??? Don't know yet what is this!!!!!
set ttyfast
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
set tw=79  " Width of document.

" Show tab and newlinel chars.
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

set colorcolumn=+1  " Related to the 'tw' setting above.

" Don't try to highlight lines longer then 800 characters.
set synmaxcol=800

" Time out on key codes but not mappings.
" Don't know for what is this yet????
" set notimeout
" set ttimeout
" set ttimeoutlen=10

"set nowrap "don't automatically wrap on load
set wrap
"set fo-=t " don't automatically wrap text when typing
"set visualbell
set linebreak

" Color Schemas {{{
"
" SOLARIZED HEX     16/8 TERMCOL  XTERM/HEX   L*A*B      sRGB        HSB
" --------- ------- ---- -------  ----------- ---------- ----------- -----------
" base03    #002b36  8/4 brblack  234 #1c1c1c 15 -12 -12   0  43  54 193 100  21
" base02    #073642  0/4 black    235 #262626 20 -12 -12   7  54  66 192  90  26
" base01    #586e75 10/7 brgreen  240 #4e4e4e 45 -07 -07  88 110 117 194  25  46
" base00    #657b83 11/7 bryellow 241 #585858 50 -07 -07 101 123 131 195  23  51
" base0     #839496 12/6 brblue   244 #808080 60 -06 -03 131 148 150 186  13  59
" base1     #93a1a1 14/4 brcyan   245 #8a8a8a 65 -05 -02 147 161 161 180   9  63
" base2     #eee8d5  7/7 white    254 #d7d7af 92 -00  10 238 232 213  44  11  93
" base3     #fdf6e3 15/7 brwhite  230 #ffffd7 97  00  10 253 246 227  44  10  99
" yellow    #b58900  3/3 yellow   136 #af8700 60  10  65 181 137   0  45 100  71
" orange    #cb4b16  9/3 brred    166 #d75f00 50  50  55 203  75  22  18  89  80
" red       #dc322f  1/1 red      160 #d70000 50  65  45 220  50  47   1  79  86
" magenta   #d33682  5/5 magenta  125 #af005f 50  65 -05 211  54 130 331  74  83
" violet    #6c71c4 13/5 brmagenta 61 #5f5faf 50  15 -45 108 113 196 237  45  77
" blue      #268bd2  4/4 blue      33 #0087ff 55 -10 -45  38 139 210 205  82  82
" cyan      #2aa198  6/6 cyan      37 #00afaf 60 -35 -05  42 161 152 175  74  63
" green     #859900  2/2 green     64 #5f8700 60 -20  65 133 153   0  68 100  60
"
" Solarized colorscheme setup for terminal.
"let g:solarized_termcolors=256
"set background=light
set background=dark
"colorscheme solarized

" Personal color scheme settings.
set t_Co=256
colorscheme gandalf " based on xoria256
set guifont=courier_new:h10 | "for GUI!
" }}}

" Search settings.
execute "normal! <silent> :nohlsearch\<cr>"
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
autocmd BufWritePre * :call CheckBackupSwapDirs()
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

" Clipboard
"set clipboard=unnamed
set clipboard=unnamed
"set clipboard=unnamedplus
"set clipboard+=autoselect
set nopaste

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
inoremap ((     ()<left>
inoremap ""     ""<left>
inoremap ''     ''<left>

" HTML mappings.
inoremap <<      <><left>
inoremap </     </><left>
inoremap <i     <img src="" /><esc>3hi
inoremap <p     <p></p><esc>3hi
inoremap <d     <div></div><esc>5hi
"inoremap <u     <u><cr></u><esc><Up>
inoremap <i     <i></i><esc>3hi
inoremap <in    <input type="" /><esc>3hi

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

" Have to restart vim if adding autocmd.
augroup code_commenting
    " First clear group to avoid duplication of autocmds!
    autocmd!
    " Then do the rest...
    autocmd FileType vim nnoremap <buffer> <localleader>c I"
    autocmd FileType c nnoremap <buffer> <localleader>c I//
    autocmd FileType cplusplus nnoremap <buffer> <localleader>c I//
    autocmd FileType javascript nnoremap <buffer> <localleader>c I//
    autocmd FileType php nnoremap <buffer> <localleader>c I//
    autocmd FileType python nnoremap <buffer> <localleader>c I#
augroup END

augroup code_snipets
    autocmd!
    autocmd FileType python :inoremap <buffer> iff if :<left>
    autocmd FileType javascript :inoremap <buffer>
                \ iff if (; ; ) {<cr>}<esc>O;<esc><up>$5hi<left>
    autocmd FileType c :inoremap <buffer>
                \ iff if (; ; ) {<cr>}<esc>O;<esc><up>$5hi<left>
    autocmd FileType vim :inoremap <buffer>
                \ iff if <cr>endif<esc><up>A
    autocmd FileType vim :inoremap <buffer> ww while <cr>endwhile<esc><up>A
    autocmd FileType vim :inoremap <buffer> funn function! <cr><cr>endfunction<esc>2<u>A
    autocmd FileType vim :inoremap <buffer> aa BBBB
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
" Wrap the selection with single and double quote.
vnoremap <leader>s <esc>`>a'<esc>`<i'<esc>
vnoremap <leader>ss <esc>`>a"<esc>`<i"<esc>

" One white space before and after some character/operator.
nnoremap <leader><space> i <esc><right>a <left><esc>

" Seting up Pathogen for management of plugins.
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
call pathogen#infect()

" Settings for Python IDE environment
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
" laststaus=0 -> never, =1 -> default (2 or more windows) and =2 -> always.
let g:Powerline_symbols="fancy"
"call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')
set rtp+=/home/robi/.vim/bundle/powerline/powerline/bindings/vim
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
"let ropevim_enable_shortcuts=1
"let g:pymode_breakpoint=1
"let g:pymode_syntax=1
"let g:pymode_syntax_builtin_objs=1
"let g:pymode_syntax_builtin_funcs=1
"nnoremap <leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<c-c>

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

" vim: set tw=79 colorcolumn=+1:
