filetype on             " enables filetype detection
syntax on               " enable syntax highlighting

set number              " show line numbers
set relativenumber      " line numbered relative to cursor’s current position
set hlsearch            " highlight all search matches
set t_Co=256            " enable 256 colors
set cursorline          " highlights current line
set expandtab           " convert tabs to spaces
set shiftwidth=4        " number of spaces to use for indent
set autoindent          " apply the identation of the current line to a new line
set smartindent         " identation based on syntax
set termguicolors       " enables 24-bit RGB color
set confirm             " raises a dialog asking for save the current file when closing unsaved changes
set inccommand=split    " shows the effect of a command incrementally, while typing, in a preview window
set hidden              " allows to have unwritten buffers invisible
set splitright          " new vertical splits goes to right of the current one
set splitbelow          " new horizontal splits goes to below of the current one
set clipboard=unnamed   " syncronizes nvim and system's clipboard
set scrolloff=3         " sets the minimum number of lines above and below the cursor
set colorcolumn=80      " sets a different colour for the 80th column
set foldmethod=syntax
set foldlevel=20

" disable expandtab for make files
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 

" automatically closes loclist, quickfix and netrw windows when the buffer is closed
augroup CloseWindowGroup
    autocmd!
    autocmd QuitPre * if empty(&buftype) | lclose | cclose |  endif
    autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype" ) == "netrw" | qa |endif
augroup END

augroup Startup
  autocmd!
  autocmd VimEnter *
              \ Vexplore |
              \ execute "wincmd l" |
              \ split |
              \ execute "term zsh" |
              \ execute "res" . string(&lines * 0.15) |
              \ execute "wincmd k" 
augroup END

augroup VCenterCursor
  au!
  au BufEnter,WinEnter,WinNew,VimResized *,*.*
        \ let &scrolloff=winheight(win_getid())/2
augroup END

" Plugins
call plug#begin(stdpath('data'))
    
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'Vimjas/vim-python-pep8-indent'
    Plug 'vim-python/python-syntax'
    Plug 'unblevable/quick-scope'       " highlights characters to navigate in lines
    Plug 'Konfekt/FastFold'             " faster folding
    Plug 'tmhedberg/SimpylFold'         " better folding
    Plug 'itchyny/lightline.vim'        " status bar
    Plug 'frazrepo/vim-rainbow'         " sets different colours to each pair of brackets and parenthesis
    " Plug 'sheerun/vim-polyglot'         " language pack with syntax highlighting and identation
    Plug 'joshdick/onedark.vim'         " theme
    Plug 'dense-analysis/ale'           " linter and fixer
    Plug 'psliwka/vim-smoothie'         " smoother scroll
    Plug 'mhinz/vim-startify'           " start page
    Plug 'neoclide/coc.nvim', {'branch': 'release'}             " autocompletion
    Plug 'mhinz/vim-signify'                                    " shows git diff
    Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}      " python syntax highlighting
    Plug 'jiangmiao/auto-pairs'         " automatically closes pairs of brackets and parenthesis
    Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

call plug#end()

" setting QuickScope colours
augroup qs_colors
    autocmd!
    highlight QuickScopePrimary guifg='#34ff00' gui=underline ctermfg=155 cterm=underline
    highlight QuickScopeSecondary guifg='#00ffff' gui=underline ctermfg=81 cterm=underline
augroup END

colorscheme onedark                     " setting theme

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1

let g:python_highlight_all = 1
let g:python3_host_prog = '/home/lucas/anaconda3/bin/python3'

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']       " setting quickscope trigger keys
let g:lightline = {'colorscheme': 'onedark'}

let g:ale_linters = {
            \ 'python': ['flake8', 'pylint', 'pylama', 'pyflakes'], 
            \ 'go': ['gofmt', 'gometalinter', 'gopls'],
            \ }
let g:ale_fixers = {'python': ['yapf']}
" let g:ale_open_list = 'on_save'
let g:ale_open_list = 0
let g:ale_set_quickfix = 1
let g:ale_keep_list_window_open = 1

let g:rainbow_active=1                  " enables rainbow plugin

let g:SimpylFold_fold_import=0          " disables import folding

let g:netrw_banner = 0                  " disables file explorer banner
let g:netrw_liststyle = 3               " sets explorer style to tree
let g:netrw_browse_split = 4            " opens files in previous window 
let g:netrw_altv = 1                    " spliting to right
let g:netrw_winsize = string(&columns * 0.07)                " sets file explorer window size

let g:Hexokinase_highlighters = ['backgroundfull']

" Disabling arrow keys and page up/down, home and end
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>

inoremap <PageDown> <Nop>
inoremap <PageUp> <Nop>
inoremap <Home> <Nop>
inoremap <End> <Nop>

nnoremap <PageDown> <Nop>
nnoremap <PageUp> <Nop>
nnoremap <Home> <Nop>
nnoremap <End> <Nop>

vnoremap <PageDown> <Nop>
vnoremap <PageUp> <Nop>
vnoremap <Home> <Nop>
vnoremap <End> <Nop>

" Use Escape to exit insert mode in :term
tnoremap <ESC> <C-\><C-n>
