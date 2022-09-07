:set relativenumber
:set number
:set mouse=a
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set softtabstop=4
:set smarttab
:set autochdir

""""""""""""""""""""""""""""""
" => leader key
""""""""""""""""""""""""""""""
" Set ',' as <leader>
let g:mapleader = ','

" Remove time delay between cursor chaning
set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Disable highlight
map <leader><cr> :noh<cr>

" Refresh NERDTree
map <leader>r :NERDTreeFocus<cr>R<c-w><c-p>

" Quickly open/reload vim
nnoremap <leader>ev :split $MYVIMRC<CR>  
nnoremap <leader>sv :source $MYVIMRC<CR> 


"""""""""""""""""""""""""""""""
" => escape key
"""""""""""""""""""""""""""""""
" <esc> with 'kj'
inoremap kj <esc>


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


""""""""""""""""""""""""""""""""
" => Auto-install vim-plug
""""""""""""""""""""""""""""""""
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


"""""""""""""""""""""""""""""""""
" => Plug-in List
"""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " coc, autocomplete.
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " rainbow bracket
    Plug 'frazrepo/vim-rainbow'
    " itchyny - lightline
    Plug 'itchyny/lightline.vim'
    " surround
    Plug 'tpope/vim-surround' 
    " repeat.vim
    Plug 'tpope/vim-repeat'
    " Emmet
    Plug 'mattn/emmet-vim'
    " vim-snippets
    Plug 'honza/vim-snippets'
    " multiple cursor
    Plug 'terryma/vim-multiple-cursors'
    " color preview
    Plug 'ap/vim-css-color'
    " devicons
    Plug 'ryanoasis/vim-devicons'
    " Code to execute when the plugin is lazily loaded on demand
    Plug 'junegunn/goyo.vim'    
    " Limelight
    Plug 'junegunn/limelight.vim'    
call plug#end()


""""""""""""""""""""""""""""""""""
" => Misc
""""""""""""""""""""""""""""""""""
let g:rainbow_active = 1

let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

syntax enable


"""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" map <C-b> to NERDTree toggle
nnoremap <C-b> :NERDTreeToggle<CR>
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


"""""""""""""""""""""""""""""""""""
" => Color
"""""""""""""""""""""""""""""""""""
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 245

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#666666'

" Default: 0.5
let g:limelight_default_coefficient = 0.9

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 0


"""""""""""""""""""""""""""""""""""
" => Goyo, Limelight
"""""""""""""""""""""""""""""""""""
" map (opt + p) for Goyo+Limelight
nnoremap π :Goyo \| Limelight!! \| NERDTreeToggle<CR>

