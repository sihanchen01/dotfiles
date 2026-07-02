syntax enable
set relativenumber
set number
set mouse=a
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set scrolloff=5
set smarttab
set autochdir
set splitright
set splitbelow
set lazyredraw
set clipboard=unnamed
" For regular expression
set magic

" Turn on the wildmenu
set wildmenu

" Optimize search function
set ignorecase
set smartcase
set incsearch


""""""""""""""""""""""""""""""
" => leader key
""""""""""""""""""""""""""""""
" Set ',' as <leader>
let g:mapleader = ','

" Remove time delay between cursor chaning
set ttimeout
set ttimeoutlen=500
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

" Quickly open/reload vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>  
nnoremap <leader>sv :source $MYVIMRC<CR> 

" Open FZF
nmap <leader>ff :FZF<cr> 
nmap <leader>fg :GFiles?<cr> 
nmap <leader>fh :History<cr> 


"""""""""""""""""""""""""""""""
" => escape key
"""""""""""""""""""""""""""""""
" <esc> with 'kj'
inoremap kj <esc>


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing *(forward) or #(backward) searches for the current selection
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Move up/down half page and Center cursor
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

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
    " FZF
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " MarkDown preview
    Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app && yarn install'}
    " Vim-Latex
    Plug 'lervag/vimtex'
    " vimlatexlivepreview
"    Plug 'xuhdev/vim-latex-live-preview'

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



"""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
let NERDTreeShowHidden = 1

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

"""""""""""""""""""""""""""""""""""
" => MarkdownPreview
"""""""""""""""""""""""""""""""""""
source ~/AppData/Local/nvim/markdownPreview.vim

"""""""""""""""""""""""""""""""""""
" => VimTeX
"""""""""""""""""""""""""""""""""""
" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'mupdf'

" Or with a generic interface:
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
let g:vimtex_compiler_method = 'latexrun'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = ","
