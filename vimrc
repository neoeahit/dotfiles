" Fast change word
nmap <Space> ciw
" I often type :W instead of :w
command WQ wq
command Wq wq
command W w
command Q q
" I can't type :w
nmap <c-b> :w<CR>
imap <c-b> <Esc>:w<CR>
" I can't type :w
nmap <c-q> :q<CR>
imap <c-q> <Esc>:q<CR>
" F1 does nothing
nmap <F1> <nop>
nnoremap ' `
set splitbelow
set nostartofline " Do not go to the beginning of the line on buffer switch
" Bash stype autocomplete
set wildmode=longest,list
set wildmenu
" ignore junk files
set wildignore+=.*.sw*,__pycache__,*.pyc

" Wrap curson movement
map j gj
map k gk

set ttyfast

" vim mode preferred!
set nocompatible
set hidden
set wildignore+=*.so,*.swp,*.zip     " MacOSX/Linux

" unlet g:ctrlp_custom_ignore
" nlet g:ctrlp_user_command
" et g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" This comes mostly from https://github.com/eevee/rc

" set xterm title, and inform vim of screen/tmux's syntax for doing the same
set titlestring=vim\ %{expand(\"%t\")}
"if &term =~ "^screen"
"    " pretend this is xterm.  it probably is anyway, but if term is left as
"    " `screen`, vim doesn't understand ctrl-arrow.
"    if &term == "screen-256color"
"        set term=xterm-256color
"    else
"        set term=xterm
"    endif
"
"    " gotta set these *last*, since `set term` resets everything
"    set t_ts=k
"    set t_fs=\
"endif
" set title
if has("gui_running")
  if has("gui_gtk2")
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
  endif
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" backups and other junky files
set nobackup                    " backups are annoying
set writebackup                 " temp backup during write
" TODO: backupdir?
set undodir=~/.vim/undo         " persistent undo storage
set undofile                    " persistent undo on

" user interface
set history=1000                " remember command mode history
set laststatus=2                " always show status line
set lazyredraw                  " don't update screen inside macros, etc
set matchtime=2                 " ms to show the matching paren for showmatch
set number                      " line numbers
set ruler                       " show the cursor position all the time
set showcmd                     " display incomplete commands
set showmatch                   " show matching brackets while typing
set relativenumber              " line numbers spread out from 0
set cursorline                  " highlight current line
"set display=lastline,uhex       " show last line even if too long; use <xx>

" regexes
set incsearch                   " do incremental searching
set ignorecase                  " useful more often than not
set smartcase                   " case-sens when capital letters

" whitespace
set autoindent                  " keep indenting on <CR>
set shiftwidth=4                " one tab = four spaces (autoindent)
set softtabstop=4               " one tab = four spaces (tab key)
set tabstop=4               " one tab = four spaces (tab key)
set expandtab                   " never use hard tabs
set shiftround                  " only indent to multiples of shiftwidth
set smarttab                    " DTRT when shiftwidth/softtabstop diverge
set fileformats=unix,dos        " unix linebreaks in new files please

set listchars=tab:▸\ ,extends:⇉,precedes:⇇,nbsp:␠,trail:␠,nbsp:␣
set list                        " appearance of invisible characters

" wrapping
"set colorcolumn=+1              " highlight 81st column
set linebreak                   " break on what looks like boundaries
set showbreak=↳\                " shown at the start of a wrapped line
"set textwidth=80                " wrap after 80 columns

" unicode
set encoding=utf-8              " best default encoding
setglobal fileencoding=utf-8    " ...
set nobomb                      " do not write utf-8 BOM!
set fileencodings=ucs-bom,utf-8,iso-8859-1
                                " order to detect Unicodeyness

set complete-=i                 " don't try to tab-complete #included files
set completeopt-=preview        " preview window is super annoying

" miscellany
set autoread                    " reload changed files
set scrolloff=2                 " always have 2 lines of context on the screen
set foldmethod=indent           " auto-fold based on indentation.  (py-friendly)
set foldlevel=99
set foldnestmax=1
set timeoutlen=1000             " wait 1s for mappings to finish
"set ttimeoutlen=100             " wait 0.1s for xterm keycodes to finish
set nrformats-=octal            " don't try to auto-increment 'octal'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
call plug#begin('~/.vim/plugged')

Plug 'whatyouhide/vim-gotham'
Plug 'tomasr/molokai'
Plug 'christoomey/vim-tmux-navigator'
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'klen/python-mode'
Plug 'tpope/vim-surround'
Plug 'sjl/gundo.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-obsession'
Plug 'rodjek/vim-puppet'
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'airblade/vim-gitgutter'
Plug 'yonchu/accelerated-smooth-scroll'
Plug 'fatih/vim-go'
Plug 'tpope/vim-sleuth.git'
Plug 'tpope/vim-fireplace.git'
Plug 'guns/vim-clojure-static.git'
Plug 'guns/vim-clojure-highlight.git'
Plug 'kien/rainbow_parentheses.vim'
Plug 'kovisoft/paredit'
Plug 'rust-lang/rust.vim'

" Autocompletion plugins
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'artur-shaik/vim-javacomplete2'
Plug 'zchee/deoplete-jedi'

call plug#end()  " required
filetype plugin indent on    " required

" Use deoplete.
let g:deoplete#enable_at_startup = 1

"let g:deoplete#sources#jedi#python_path = '/nail/home/fgiraud/.nvim_virtualenv3/bin/python'

" Airline; custom
let g:airline#extensions#branch#displayed_head_limit = 20
let g:airline_powerline_fonts = 1
let g:airline_theme='kolor'
let g:airline#extensions#syntastic#enabled = 0

let g:tmux_navigator_no_mappings = 1

call yankstack#setup()
nmap Y y$
map <C-y> <Plug>yankstack_substitute_older_paste
map <C-Y> <Plug>yankstack_substitute_newer_paste
let g:yankstack_yank_keys = ['c', 'C', 'd', 'D', 'x', 'X', 'y', 'Y']

" Seamless tmux navigation
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

" Autoscale on resize
autocmd VimResized * :wincmd =

let g:ac_smooth_scroll_du_sleep_time_msec=15
let g:ac_smooth_scroll_no_default_key_mappings = 1
function! ScrollDown()
    set norelativenumber
    call ac_smooth_scroll#scroll('j', 2, g:ac_smooth_scroll_du_sleep_time_msec, 0)
    set relativenumber
endfunction
function! ScrollUp()
    set norelativenumber
    call ac_smooth_scroll#scroll('k', 2, g:ac_smooth_scroll_du_sleep_time_msec, 0)
    set relativenumber
endfunction
nmap <silent> <C-d> :call ScrollDown()<cr>
nmap <silent> <C-u> :call ScrollUp()<cr>

let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
nmap s <Plug>(easymotion-s2)

" map <C-b> :ls<CR>:b<Space>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_regexp = 1
let g:ctrlp_switch_buffer = '0'
nmap <CR> :CtrlPBuffer<CR>
"autocmd CmdwinEnter * nnoremap <CR> <CR>
"autocmd BufReadPost quickfix nnoremap <CR> <CR>
autocmd BufReadPost *fix nnoremap <buffer> <CR> <CR>

"autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" SuperTab and tab completion; use omni completion but fall back to completion
" based on the current buffer's syntax keywords
"let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
set omnifunc=syntaxcomplete#Complete
"autocmd FileType *
"    \ call SuperTabChain(&omnifunc, "<c-p>") |
"    \ call SuperTabSetDefaultCompletionType("<c-x><c-u>")

" Syntastic
" Don't bother flaking on :wq because I won't even see it!
let g:syntastic_check_on_wq = 0
" Only use flake8 for Python -- running `python` itself may or may not work
" because versions, and pylint is a beast
let g:syntastic_python_checkers = ['flake8']
" Stupid Unicode tricks
let g:syntastic_error_symbol = "☠"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_error_symbol = "☢"
let g:syntastic_style_warning_symbol = "☹"

" Do you still have a 80 columns terminal?
let g:syntastic_python_flake8_args='--ignore=E501,E128'

" Ctrl-P settings
let g:ctrlp_custom_ignore = { 'dir': '\v[\/](build|[.]git)$' }
" Try to tame it a bit on very large projects
let g:ctrlp_max_files = 50000
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_dotfiles = 1
let g:ctrlp_lazy_update = 100


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bindings

" Stuff that clobbers default bindings
" Force ^U and ^W in insert mode to start a new undo group
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" Leader
let mapleader = ","
let g:mapleader = ","

" Swaps selection with buffer
vnoremap <C-X> <Esc>`.``gvP``P

" -/= to navigate tabs
"noremap - :bp<CR>
"noremap = :bn<CR>

" Bind gb to toggle between the last two tabs
map gb :exe "tabn ".g:ltv<CR>
function! Setlasttabpagevisited()
    let g:ltv = tabpagenr()
endfunction

augroup localtl
    autocmd!
    autocmd TabLeave * call Setlasttabpagevisited()
augroup END
autocmd VimEnter * let g:ltv = 1

" Abbreviation to make `:e %%/...` edit in same directory
cabbr <expr> %% expand('%:.:h')

""" For plugins
" gundo
noremap ,u :GundoToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscellaneous autocmds

" Automatically delete swapfiles older than the actual file.
" Look at this travesty.  vim already has this information but doesn't expose
" it, so I have to reparse the swap file.  Ugh.
function! s:SwapDecide()
python << endpython
import os
import struct

import vim

# Format borrowed from:
# https://github.com/nyarly/Vimrc/blob/master/swapfile_parse.rb
SWAPFILE_HEADER = "=BB10sLLLL40s40s898scc"
size = struct.calcsize(SWAPFILE_HEADER)
with open(vim.eval('v:swapname'), 'rb') as f:
    buf = f.read(size)
(
    id0, id1, vim_version, pagesize, writetime,
    inode, pid, uid, host, filename, flags, dirty
) = struct.unpack(SWAPFILE_HEADER, buf)

try:
    # Test whether the pid still exists.  Could get fancy and check its name
    # or owning uid but :effort:
    os.kill(pid, 0)
except OSError:
    # NUL means clean, \x55 (U) means dirty.  Yeah I don't know either.
    if dirty == b'\x00':
        # Appears to be from a crash, so just nuke it
        vim.command('let v:swapchoice = "d"')

endpython
endfunction

if has("python")
    augroup eevee_swapfile
        autocmd!
        autocmd SwapExists * call s:SwapDecide()
    augroup END
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and syntax
" in GUI or color console, enable coloring and search highlighting
if &t_Co > 2 || has("gui_running")
  syntax enable
  set background=dark
  set hlsearch
endif

set t_Co=256  " force 256 colors
"colorscheme molokai
colorscheme gotham256
hi Normal ctermbg=None
"hi CursorLine ctermbg=None
hi MatchParen ctermbg=None ctermfg=blue
hi Search ctermbg=4 ctermfg=white

let g:paredit_smartjump=1
map <C-f> :call PareditToggle()<CR>

autocmd BufNewFile,BufRead *.go call SetGolang()
function! SetGolang()
endfunction

autocmd BufNewFile,BufRead,BufAdd,BufCreate *.clj call SetClojure()
function! SetClojure()
  :nnoremap <C-e> :Eval<CR>
  :inoremap <C-e> <Esc>:Eval<CR>l
  :RainbowParenthesesLoadRound
  :RainbowParenthesesLoadBraces
  :RainbowParenthesesLoadSquare
  :RainbowParenthesesActivate
  nmap Q {v}=<C-o><C-o>
  imap <tab> <C-x><C-o>
  command! Repl :Connect nrepl://localhost:1234
endfunction

let g:LatexBox_Folding=1
let g:LatexBox_quickfix=4
let g:tex_comment_nospell= 1
autocmd BufNewFile,BufRead *.tex call SetLatex()
function! SetLatex()
  setlocal textwidth=100 spell
  :map M :Latexmk<cr>
endfunction

nmap Q gwap

autocmd BufNewFile,BufRead *.rs set filetype=rust

" Filetypes and indenting settings
filetype plugin indent on

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif

" trailing whitespace and column; must define AFTER colorscheme, setf, etc!
hi ColorColumn ctermbg=black guibg=darkgray
hi WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+\%#\@<!$/

set whichwrap+=<,>,h,l,[,]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Last but not least, allow for local overrides
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['white',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['grey',        'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['blue',        'firebrick3'],
    \ ]

" Blink new search result
function! HLNext (blinktime)
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let target_pat = '\c\%#\%('.@/.'\)'
    let ring = matchadd('SpellBad', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 300) . 'm'
    call matchdelete(ring)
    redraw
endfunction

" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>

let g:ycm_complete_in_strings = 0
let g:ycm_complete_in_comments = 0
let g:ycm_auto_trigger = 0
nnoremap <leader>d :YcmCompleter GoTo<CR>
nnoremap <leader>f :YcmCompleter GetDoc<CR>
nnoremap <leader>D :YcmShowDetailedDiagnostic<CR>

nnoremap <leader>n :e %<.h<CR>
nnoremap <leader>m :e %<.cpp<CR>

" Don't change the buffer scrolling position when moving to a different buffer
if v:version >= 700
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif

" Rust autocompletion
let g:ycm_rust_src_path = '/home/fede/rust/rust/src'

" Jump to next/prev closed folding
function! NextClosedFold(dir)
    let cmd = 'norm!z' . a:dir
    let view = winsaveview()
    let [l0, l, open] = [0, view.lnum, 1]
    while l != l0 && open
        exe cmd
        let [l0, l] = [l, line('.')]
        let open = foldclosed(l) < 0
    endwhile
    if open
        call winrestview(view)
    endif
endfunction
nnoremap <silent> zj :call NextClosedFold('j')<cr>
nnoremap <silent> zk :call NextClosedFold('k')<cr>

" Define Gg amazing grepping commands
:command -nargs=+ Gg execute 'silent Ggrep!' <q-args> | cw | redraw!
:command Ggw execute 'silent Ggrep! <cword>' | cw | redraw!

"Use tab for completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
