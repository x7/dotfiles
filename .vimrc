"============================================================
"   .vimrc v0.2
"   github: github.com/x7
"============================================================

set nocompatible                  " Must come first because it changes other options

" Vundle Config"{{{
"============================================================

filetype off

if has('win32') || has('win64')
    " Add vundle to windows runtime path
    set rtp+=~/vimfiles/bundle/vundle/
    " Call Vundle
    call vundle#rc('$HOME/vimfiles/bundle/')
else
    " Add vundle to linux runtime path
    set rtp+=~/.vim/bundle/vundle/
    " Call Vundle
    call vundle#rc()
endif

" Let Vundle manage Vundle. Required!
Bundle 'gmarik/vundle'

"============================================================
"   My Bundles
"============================================================
" UI and Navigation
Bundle 'Lokaltog/vim-powerline'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'sjl/gundo.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'majutsushi/tagbar'

"============================================================
" Language Additions
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-markdown'
Bundle 'kchmck/vim-coffee-script'
Bundle 'itspriddle/vim-jquery'
Bundle 'pangloss/vim-javascript'

"============================================================
" Text Formatting
Bundle 'tsaleh/vim-align'
Bundle 'tpope/vim-speeddating'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/Rainbow-Parenthesis'

"============================================================
" Colorschemes
Bundle 'altercation/vim-colors-solarized'

"============================================================
" Plugins
Bundle 'tpope/vim-fugitive'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'tpope/vim-repeat'
Bundle 'tsaleh/vim-matchit'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/syntastic'
Bundle 'tyru/current-func-info.vim'
Bundle 'sickill/vim-pasta'
Bundle 'Rykka/ColorV'
Bundle 'gregsexton/MatchTag'
Bundle 'garbas/vim-snipmate'

"============================================================
" Libraries\Dependencies
Bundle 'honza/snipmate-snippets'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'Shougo/vimproc'
Bundle 'L9'

"============================================================
"}}}

" Basic options"{{{
"============================================================

filetype on
syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

set encoding=utf-8
set termencoding=utf-8

set ruler                         " Show cursor position.
set number                        " Show line number
set laststatus=2                  " Show the status line all the time
set guioptions-=T                 " Hide toolbar.
set colorcolumn=105
set t_Co=256                      " Use 256 colors in terminals
set synmaxcol=2048                " Syntax coloring lines that are too long just slows down the world

set showmode                      " Display the mode you're in.
set showcmd                       " Display incomplete commands.
set showmatch                     " Show matching brackets
set backspace=indent,eol,start    " Intuitive backspacing.
set virtualedit=all               " Allow the cursor to go in to "invalid" places
set foldenable                    " Text folding
set foldmethod=marker
set hidden                        " Handle multiple buffers better.
set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell
set history=200                   " Keep history

set nowrap                        " Turn off line wrapping.
set scrolloff=4                   " Show 4 lines of context around the cursor.
set title                         " Set the terminal's title
set visualbell                    " No beeping.
set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory+=.,$TMP,~/tmp       " fixes Gdiff

set ignorecase                    " Case-insensitive searching..
set smartcase                     " ..but case-sensitive if expression contains a capital letter.
set hlsearch                      " Highlight matches.
set incsearch                     " Highlight matches as you type.

set tabstop=4                     " Global tab width.
set shiftwidth=4                  " And again, related.
set expandtab                     " Turn tabs into spaces

" character in window separators
set fillchars=vert:\

"============================================================
"}}}

" Plugin options"{{{
"============================================================
" Yankring
" Replace
let g:yankring_replace_n_pkey = '<c-b>'
let g:yankring_replace_n_nkey = '<c-n>'


"============================================================
" CtrlP
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.swp$',
    \ }

"============================================================
"}}}

" Mappings"{{{
"============================================================

let mapleader = ","
nnoremap ; :
inoremap jj <ESC>

" Sudo write
command! -bar -nargs=0 Sudow  silent! exec "write !sudo tee % >/dev/null"  | silent! edit!

" cd to the directory containing the file in the buffer
nnoremap <Leader>cd :lcd %:h<CR>

" Quick edit this file
nnoremap <silent> <Leader>ev :edit $MYVIMRC<CR>
nnoremap <silent> <Leader>sv :w<CR>:source $MYVIMRC<CR>

" Clear search highlighting
nnoremap <Leader>n :nohlsearch<CR>

" Highlight all instances of the current word under the cursor
nnoremap <silent> ^ :setl hls<CR>:let @/="<C-r><C-w>"<CR>

" Swap two words
nnoremap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Put a line above at the end of the current line (good for moving comments)
nmap gt k0v$ydd$l:YRGetElem 2<CR>`[

" Put a line below to the beggining of the current line
"nmap gb 0v$ydd$l:YRGetElem 2<CR>`[

"============================================================
" Fix broken vim regexes when searching
nnoremap / /\v
vnoremap / /\v
cnoremap s/ s/\v

"============================================================
" F-keys maps

" F1 maped for help in vim files
au Filetype vim noremap <buffer> <F1> <Esc>:help <C-r><C-w><CR>

" F2 nerd tree sidebar
map <F2> :NERDTreeToggle<CR>

" F3 yank ring window
map <F3> :YRShow<CR>

" F4
" run python scripts
autocmd BufRead *.py nmap <F4> :w<CR>:!python %<CR>

" F5 Gundo Sidebar
map <F5> :GundoToggle<CR>

" F6 Solarized bg toggle
silent! call togglebg#map("<F6>")

" F7

" F8

" F9 paste mode toggle
set pastetoggle=<F9>

" F10

" F11

" F12

"============================================================
" Split window and select it
nnoremap <Leader>v <C-w>v<C-w>l
nnoremap <Leader>h <C-w>s<C-w>j

"============================================================
" Easier split window navigation
nnoremap H <C-w>h
nnoremap J <C-w>j
nnoremap K <C-w>k
nnoremap L <C-w>l

"============================================================
" Capitalize
imap <C-u> <Esc>guiw~ea
if (&tildeop)
  nmap gcw guiw~l
  nmap gcW guiW~l
  nmap gcs guis~l
  nmap gc$ gu$~l
  nmap gcgc guu~l
  nmap gcc guu~l
  vmap gc gu~l
else
  nmap gcw guiw~h
  nmap gcW guiW~h
  nmap gcs guis~h
  nmap gc$ gu$~h
  nmap gcgc guu~h
  nmap gcc guu~h
  vmap gc gu~h
endif

"}}}

" Abbreviations {{{
"============================================================

iabbrev lorem Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sollicitudin quam eget libero pulvinar id condimentum velit sollicitudin. Proin cursus scelerisque dui ac condimentum. Nullam quis tellus leo. Morbi consectetur, lectus a blandit tincidunt, tortor augue tincidunt nisi, sit amet rhoncus tortor velit eu felis.

"============================================================
" }}}

" Language specific settings"{{{
"============================================================
" Ruby
autocmd FileType ruby setlocal foldmethod=syntax shiftwidth=2 tabstop=2

"============================================================
" CSS
autocmd FileType css setlocal foldmethod=indent shiftwidth=2 tabstop=2

"============================================================
" SASS
"autocmd FileType sass set sw=6 ts=6 noet
autocmd FileType sass SyntasticDisable

"============================================================
" }}}

" Autocommands {{{
"============================================================

augroup General "{{{
    autocmd!
    " Save when loosing focus
    au FocusLost * :wa

    "============================================================
    " Script templates
    "au BufNewFile *.sh  so ~/vimfiles/templates/tpl.sh
    "au BufNewFile *.py  so ~/vimfiles/templates/tpl.py
    "au BufNewFile *.php so ~/vimfiles/templates/tpl.php

    "============================================================
    " Help file settings
    function! s:SetupHelpWindow()
        wincmd L
        vertical resize 90
        setl nonumber winfixwidth colorcolumn=

        " Set custom statusline
        let b:stl = "#[Mode] HELP #[ModeS][>>]#[BranchS] [>]#[ModFlag]%{&readonly ? ' Ɽ ' : ''}#[FileName]%<%t #[FileNameS][>>]%* %=#[LinePercentS][<<]#[LinePercent] %p%% "

        nnoremap <buffer> <Space> <C-]> " Space selects subject
        nnoremap <buffer> <BS>    <C-T> " Backspace to go back
    endfunction

    au FileType help au BufEnter,BufWinEnter <buffer> call <SID>SetupHelpWindow()

    "============================================================
    " Fix space highlighting in diff files
    au FileType diff hi clear RedundantSpaces
                \ | hi DiffCol ctermbg=238 cterm=bold
                \ | match DiffCol /^[ +-]\([+-]\)\@!/

augroup END "}}}

augroup Formatting " {{{
    autocmd!

    "============================================================
    " Fix gitcommit formatting
    au FileType gitcommit setl formatoptions+=t formatoptions-=l textwidth=72 colorcolumn=72

    "============================================================
    " Format plain text and e-mails correctly
    au BufNewFile,BufRead *.txt setl ft=text
    au FileType mail,text setl formatoptions+=t formatoptions-=l textwidth=72 colorcolumn=72

augroup END "}}}

augroup Whitespace " {{{
    autocmd!
    "============================================================
    " Remove trailing whitespace from selected filetypes
    function! s:StripTrailingWhitespace()
        normal mZ
        %s/\s\+$//e
        normal `Z
    endfunction
    au FileType html,css,sass,javascript,php,python,ruby,psql,vim au BufWritePre <buffer> :silent! call <SID>StripTrailingWhitespace()
augroup END " }}}

augroup CustomStatuslines " {{{
    "============================================================
    autocmd!
    " Lusty buffer list {{{
    au BufEnter * if bufname("%") == "[LustyExplorer-Buffers]"
                \ | let b:stl = "#[Branch] LustyExplorer#[BranchS] [>] #[FileName]%<Buffer List #[FileNameS][>>]%* %="
                \ | endif
    " }}}
    " Tagbar {{{
    au BufEnter * if bufname("%") == "__Tagbar__"
                \ | let b:stl = "#[FileName]%< Tagbar #[FileNameS][>>]%* %="
                \ | endif
    " }}}
    " Gundo {{{
    au BufEnter * if bufname("%") == "__Gundo__"
                \ | let b:stl = "#[Mode] GUNDO #[ModeS][>>]#[BranchS] [>] #[FileName]%<Undo tree #[FileNameS][>>]%* %="
                \ | endif

    au BufEnter * if bufname("%") == "__Gundo_Preview__"
                \ | let b:stl = "#[Mode] GUNDO #[ModeS][>>]#[BranchS] [>] #[FileName]%<Diff preview #[FileNameS][>>]%* %="
                \ | endif
    " }}}
    " Syntastic location list {{{
    au BufEnter * if bufname("%") == "[Location List]"
                \ | let b:stl = "#[FileName]%< Location List #[FileNameS][>>]%* %="
                \ | endif
    " }}}
    " NerdTree {{{
    au BufEnter * if bufname("%") == "NERD_tree_1"
                \ | let b:stl = "#[Mode] NerdTree #[ModeS][>>]#[BranchS] [>] #[FileName]%< %F #[FileNameS][>>]%* %="
                \ | endif
    "}}}
    " FuzzyFinder {{{
    au BufEnter * if bufname("%") == "[fuf]"
                \ | let b:stl = "%*#[FilenameS] [>>]#[FunctionName] %= #[FileNameS][<<]#[FileName] #[BranchS] [<] #[ModeS][<<]#[Mode] FuzzyFinder"
                \ | endif
    "}}}
augroup END " }}}

"============================================================
" }}}

" Colorscheme"{{{
"============================================================

" must come at the end or the status line won't get colored
if has("gui_running")
    set background=light              " Background.
    silent! colorscheme solarized      " Best colorscheme ever
else
    set background=dark
    let g:solarized_termcolors=256    " degrade to 256 colors
    silent! colorscheme solarized      " Best colorscheme ever
endif

"============================================================
"}}}

" OS specific settings"{{{
"============================================================

if has("unix")                        " code common to Cygwin and Linux
    "
    if has("win32unix")               " code for Cygwin but not Linux
        if has("gui_gtk2")
            set guifont=Consolas\ 11      " Font family and font size.
        endif
    else                              " code for Linux but not Cygwin
        set guifont=Monospace\ 10
    endif
elseif has('win32') || has('win64')   " code for Windows
    if has("gui_running")               " GUI
        set guifont=Consolas:h11          " Font family and font size. Windows only
        set guioptions-=T                 " Hide toolbar.
        au GUIEnter * simalt ~x           " Maximaize window on Windows
        "set guioptions-=r                 " Don't show right scrollbar
    endif
else
    echoerr "Unknown OS"
endif

"============================================================
"}}}

