" -----------------------------------------------------------------------------
" GENERAL
" -----------------------------------------------------------------------------

" Set editor encoding
set encoding=utf-8

" Set file encoding
set fileencoding=utf-8

" Set script encoding
scriptencoding utf-8

" Keep undo history in file
if has('persistent_undo') && isdirectory(expand('~').'/.config/nvim/tmp')
    silent !mkdir ~/.config/nvim/tmp > /dev/null 2>&1
    set undodir=~/.config/nvim/tmp
    set undofile
endif

" Move viminfo to ~/.config/nvim directory
set viminfo+=n~/.config/nvim/viminfo

" Move swap and backup files to ~/.config/nvim/tmp instead of in $CWD
set backupdir=~/.config/nvim/tmp
set directory=~/.config/nvim/tmp

" Detect file type and act accordingly
filetype on
filetype plugin on
filetype indent on

" Use the '+' register as clipboard, which references the system clipboard.
" Utilize the wl-clipboard utilities to copy and paste.
set clipboard=unnamedplus
let g:clipboard = {
    \ 'name': 'wl-clipboard',
    \ 'copy': {
    \   '+': 'wl-copy',
    \   '*': 'wl-copy',
    \  },
    \ 'paste': {
    \   '+': 'wl-paste --no-newline',
    \   '*': 'wl-paste --no-newline',
    \ },
    \ 'cache_enabled': 1,
    \ }

" Allow backspace in insert mode
set backspace=indent,eol,start

" Show whitespace as special characters
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

set mouse=a                   " Enable mouse support
set history=1000              " Set longer cmdline history
set autoread                  " Reload files if changed outside vim
set hidden                    " Allow buffers without windows
set fileformats=unix,dos,mac  " Prefer Unix
set splitbelow                " Have splits appear to the bottom by default
set splitright                " Have splits appear to the right by default

" -----------------------------------------------------------------------------
" TABS & INDENTATION
" -----------------------------------------------------------------------------

set expandtab                 " Use spaces instead of tabs
set smarttab                  " Use shiftwidth at line start, tabstop elsewhere
set tabstop=4                 " How many colums a tab counts for
set softtabstop=4             " Same but insert mode, depends on other options

set shiftwidth=4              " Set indent length
set shiftround                " Shift to certain columns, not N spaces
set autoindent                " Carry over indent lenght from previous line
set smartindent               " Indent smartly in reaction to syntax type

" -----------------------------------------------------------------------------
" SCROLLING, WRAPPING & FOLDING
" -----------------------------------------------------------------------------

set scroll=1                  " Vertical pages to scroll with C+u and C+d
set scrolloff=15              " Vertical scroll lines from the margin
set sidescrolloff=999         " Horizontal scroll with centralized cursor
set sidescroll=1              " Horizontal smooth scroll

set wrap                      " Enable line wrapping
set linebreak                 " Break lines by words, not chars
set breakindent               " Wrapped lines continue indented
set breakindentopt=sbr        " Display a showbreak character after wrap
set showbreak=↪               " Show unicode character as break
set textwidth=80              " Wrap after 80 columns
set formatoptions+=q1         " q - gq formats comments
                              " 1 - break before single-letter words
set formatoptions-=tc         " t - auto-wrap text using textdwidth
                              " c - auto-wrap comments using textwidth

set nofoldenable              " No folding by default
set foldmethod=indent         " Fold on indent
set foldnestmax=1             " Maximum fold level

" -----------------------------------------------------------------------------
" SEARCH & COMPLETION
" -----------------------------------------------------------------------------

set incsearch                 " Find next match while typing
set hlsearch                  " Highlight searches
set ignorecase                " Ignore casing in search...
set smartcase                 " ...unless explicitly capitalized
set infercase                 " Ignore casing in completion, unless capitalized

" Use longest completion on first tab, full selector on second tab
set wildmenu
set wildmode=list:longest,full

" -----------------------------------------------------------------------------
" LAYOUT & COLOR
" -----------------------------------------------------------------------------

set title                     " Set title instead of term inheritance
set number                    " Enable line numbers
set colorcolumn=80            " Display the textwidth visually
set visualbell t_vb=          " No flashing or beeping bells
set showcmd                   " Show commands down the bottom
set laststatus=2              " Always show the status bar
set noshowmode                " Lightline will show current mode instead
set ttimeoutlen=10            " Less harsh delays on changing modes
set updatetime=100            " Update changes faster (like gitgutter symbols)

syntax on                     " Enable syntax highlighting
set termguicolors             " Enable true colors

" Set a highlight group for whitespace
augroup whitespace_color
    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
augroup end

" Set color scheme
set background=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

" Match the highlight group for trailing whitespace
match ExtraWhitespace /\s\+\%#\@<!$/

" -----------------------------------------------------------------------------
" KEYMAPPING
" -----------------------------------------------------------------------------

" Remap space as leader key
nnoremap <Space> <Nop>
let mapleader="\<Space>"

" Turn off linewise keys. This will make j and key navigate wrapped lines
" on the screen as well, instead of skipping to the next actual line.
nmap j gj
nmap k gk

" Scroll viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Previous/next open buffer
nmap <C-p> :bprev<CR>
nmap <C-n> :bnext<CR>

" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Let Esc break out of any mode
tnoremap <Esc> <C-\><C-n>

" Easily close a buffer but not the window
nmap <Leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" ALE
nmap <Leader>d :ALEGoToDefinition<CR>
nmap <Leader>r :ALEFindReferences<CR>
nmap <Leader>y :ALEHover<CR>
nmap <Leader>s :ALESymbolSearch<CR>

" fzf
nmap <Leader>f :Files<CR>
nmap <Leader>F :GFiles<CR>
nmap <Leader>F :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>
nmap <Leader>H :Helptags!<CR>
nmap <Leader>t :BTags<CR>
nmap <Leader>T :Tags<CR>
nmap <Leader>l :BLines<CR>
nmap <Leader>L :Lines<CR>
nmap <Leader>' :Marks<CR>
nmap <Leader>C :Commands<CR>
nmap <Leader>: :History:<CR>
nmap <Leader>/ :History/<CR>

" -----------------------------------------------------------------------------
" PLUGINS
" -----------------------------------------------------------------------------

" ALE
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_open_list = 1
let g:ale_list_window_size = 5
let g:ale_linters = {
    \ 'rust': ['analyzer'],
    \ 'markdown': ['proselint'],
    \ 'text': ['proselint']
    \ }
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ 'sh': ['shfmt'],
    \ 'rust': ['rustfmt'],
    \ 'css': ['prettier'],
    \ 'html': ['prettier'],
    \ 'json': ['prettier'],
    \ 'yaml': ['prettier'],
    \ 'markdown': ['prettier']
    \ }
let g:ale_fix_on_save = 1

" fzf.vim
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_colors = {
    \ 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment']
    \ }

" lightline
let g:lightline = { 'colorscheme': 'gruvbox' }

" lightline-ale
let g:lightline.component_expand = {
    \ 'linter_checking': 'lightline#ale#checking',
    \ 'linter_warnings': 'lightline#ale#warnings',
    \ 'linter_errors': 'lightline#ale#errors',
    \ 'linter_ok': 'lightline#ale#ok',
    \ }
let g:lightline.component_type = {
    \ 'linter_checking': 'left',
    \ 'linter_warnings': 'warning',
    \ 'linter_errors': 'error',
    \ 'linter_ok': 'left',
    \ }
let g:lightline.active = {
    \ 'right': [
    \ [ 'lineinfo' ],
    \ [ 'percent' ],
    \ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
    \ [ 'fileformat' ],
    \ [ 'fileencoding' ],
    \ [ 'filetype' ]]
    \ }

" NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden= 1
let NERDTreeAutoDeleteBuffer = 1

augroup nerdtree_group
    " Open NERDTree and a terminal automatically when a directory is opened
    " with vim
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0])
                \ && !exists("s:std_in") | exe 'NERDTree' argv()[0]
                \ | wincmd p | ene | exe 'cd '.argv()[0]

    " Make sure our buffer previous/next keys are disabled in NERDTree
    autocmd FileType nerdtree noremap <buffer> <C-p> <nop>
    autocmd FileType nerdtree noremap <buffer> <C-n> <nop>
augroup end

" Supertab
let g:SuperTabDefaultCompletionType = '<c-n>'

" vimwiki
let wiki_1 = {}
let wiki_1.path = '~/documents/notes/'
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'
let wiki_2 = {}
let wiki_2.path = '~/documents/work/drgt/notes/'
let wiki_2.syntax = 'markdown'
let wiki_2.ext = '.md'
let wiki_3 = {}
let wiki_3.path = '~/documents/projects/hiveworld_wiki'
let wiki_3.syntax = 'markdown'
let wiki_3.ext = '.md'
let g:vimwiki_list = [wiki_1, wiki_2, wiki_3]
let g:vimwiki_global_ext = 0
