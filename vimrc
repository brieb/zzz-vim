set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
" Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'
" vim-scripts repos
" Bundle 'L9'
" Bundle 'FuzzyFinder'
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
" Bundle 'file:///Users/gmarik/path/to/plugin'
" ...

if v:version > 703
    Bundle "Valloric/YouCompleteMe"
endif
Bundle "kien/ctrlp.vim"
Bundle "tpope/vim-commentary"
Bundle "tpope/vim-surround"
Bundle "tpope/vim-repeat"
Bundle "tpope/vim-endwise"
Bundle "tpope/vim-haml"
Bundle "tpope/vim-unimpaired"
Bundle "tpope/vim-abolish"
Bundle "tpope/vim-vinegar"
Bundle "scrooloose/syntastic"
Bundle "mhinz/vim-signify"
Bundle "goldfeld/vim-seek"
Bundle "nathanaelkane/vim-indent-guides"
Bundle "altercation/vim-colors-solarized"
Bundle "ap/vim-css-color"
Bundle "kchmck/vim-coffee-script"
Bundle "SirVer/ultisnips"
" Bundle "Townk/vim-autoclose"

" vim-script
Bundle "matchit.zip"
Bundle "HTML-AutoCloseTag"

" Might want to check out...
" mihaifm/vimpanel

syntax enable
filetype plugin indent on     " required!

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

set t_Co=256
set bg=light
colorscheme solarized

set mouse=a                     " Set the mouse to be active
set cursorline                  " Highlight the current line in every window and update the highlight as the cursor moves
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set nu                          " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set nofoldenable                " Don't auto fold code
set list                        " Display whitespace
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set wrap                        " Wrap long lines
set autoindent                  " Indent at the same level of the previous line
set expandtab                   " Tabs are spaces, not tabs
set shiftwidth=2                " Use indents of 2 spaces
set tabstop=2                   " An indentation every four columns
set softtabstop=2               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
"set matchpairs+=<:>             " Match, to be used with %
set pastetoggle=<F2>            " pastetoggle (sane indentation on pastes)
set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
set colorcolumn=80              " Highlight 80th column
set timeoutlen=200              " Shorten the delay between key presses for mappings

syntax on                       " Turn on syntax highlighting
nnoremap Y y$                   " Yank from the cursor to the end of the line, to be consistent with C and D.
nmap <silent> <leader>/ :nohlsearch<CR> " Clear search highlights

" Remove trailing whitespaces and ^M chars
autocmd FileType c,cpp,java,go,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> call StripTrailingWhitespace()

function! StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" NerdTree {
map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0
" }

" ctrlp {
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }
let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
    \ 'fallback': 'find %s -type f' }
"}

" indent_guides {
let g:indent_guides_auto_colors = 1
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
" }

" vim-gitgutter {
" https://github.com/airblade/vim-gitgutter/issues/106
let g:gitgutter_realtime = 0
" }

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remap leader to comma
let mapleader = ","

let g:ycm_extra_conf_globlist = ["~/cs224w/snap/*"]
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Perform ESC upon accidentally hitting F1
map <F1> <Esc>
imap <F1> <Esc>

" The smash escape
inoremap jk <Esc>
inoremap kj <Esc>

" Additional vim-commentary comment strings
autocmd FileType apache set commentstring=#\ %s

cnoreabbrev W w
cnoreabbrev Q q

" Easy split navigation
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

" Improve up/down movement on wrapped lines
nnoremap j gj
nnoremap k gk

au InsertLeave * set nopaste                 " Disable paste mode when leaving Insert Mode

au FocusLost * :silent! wall                 " Save on FocusLost
au FocusLost * call feedkeys("\<C-\>\<C-n>") " Return to normal mode on FocustLost

" YCM conflicts with UltiSnips TAB key usage
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
