" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = []

if ( match(hostname(), 'corn') >= 0 )
  call add(g:pathogen_disabled, 'vim-easytags')
endif

call pathogen#runtime_append_all_bundles()

syntax on
filetype plugin indent on

set t_Co=256

set number
set hidden
set ruler
set modelines=0

set encoding=utf-8
set scrolloff=3
set showmode
set showcmd
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set backspace=indent,eol,start
set laststatus=2

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap <leader>v V`]

set wrap linebreak textwidth=0

au FocusLost * :wa

"applies substitutions globally on lines
set gdefault

" Whitespace stuff
set tabstop=2
set shiftwidth=2
set sw=2
set softtabstop=2
set expandtab
set autoindent
set smartindent
set cindent
" make uses real tabs
au FileType make set noexpandtab

let mapleader=","

nnoremap <C-@> a
vnoremap <C-@> <Esc>gV
onoremap <C-@> <Esc>
inoremap <C-@> <Esc>
nnoremap <C-Space> a
vnoremap <C-Space> <Esc>gV
onoremap <C-Space> <Esc>
inoremap <C-Space> <Esc>

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

syntax enable
set background=dark
colorscheme molokai

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,*.swp,*.rbc,*.class,vendor/gems/*
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript
au BufNewFile,BufRead *.ms set ft=mustache

set showcmd
set showmode

"set colorcolumn=81
"highlight ColorColumn ctermbg=8
"highlight ColorColumn guibg=Black


"allow backspacing over everything in insert mode
set backspace=indent,eol,start

nnoremap <C-w>v <C-w>v<C-w>l
map <silent> <C-l> <C-w>l
map <silent> <C-j> <C-w>j
map <silent> <C-k> <C-w>k
map <silent> <C-h> <C-w>h

set sessionoptions=blank,buffers,curdir,folds,globals,help,localoptions,options,resize,tabpages,winsize,winpos

let g:session_autoload=1
let g:session_autosave=1
let g:session_default_to_last=1

let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup = 1

let delimitMate_expand_cr=1

autocmd FileType c,cpp,java,php autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

set ofu=syntaxcomplete#Complete
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"let g:neocomplcache_enable_at_startup = 1

let g:session_directory='~/vim-sessions'

"inoremap <C-j> <Esc>A;<Esc>o

nmap <silent> <F4>
      \ :!ctags -f ./tags
      \ --langmap="php:+.inc"
      \ -h ".php.inc" -R --totals=yes
      \ --tag-relative=yes --PHP-kinds=+cf-v .<CR>
set tags=./tags,tags;$HOME

"if executable('jsctags')
  "autocmd BufWritePost,FileWritePost *.js silent! !jsctags . &
"endif

set mouse=a

""""""""""""""""""""
" => Statusline
""""""""""""""""""""
"Always show the statusline
set laststatus=2
"Format the statusline
set statusline=%r%m\ %f%=%{fugitive#statusline()}

""""""""""""""""""""
" => Spell Checking
""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"Persistent undo
try
  set undodir=~/.vim_runtime/undodir
  set undofile
catch
endtry


nnoremap <silent> <leader>y :YRShow<CR>

let php_sql_query=1

map <leader>ma :set mouse=a<CR>
map <leader>mo :set mouse=<CR>

"map <leader>tn :tabnext<CR>
"map <leader>tN :tabNext<CR>
"map <leader>to :tabnew<CR>
"map <leader>tq :tabclose<CR>
"map <leader>tm :tabmove 

map <C-t> :tabnew<CR>
map <C-q> :tabclose<CR>
map <C-Left> gT
map <C-Right> gt

set tabpagemax=15
"hi TabLineSel term=bold cterm=bold ctermfg=16 ctermbg=229
"hi TabWinNumSel term=bold cterm=bold ctermfg=90 ctermbg=229
"hi TabNumSel term=bold cterm=bold ctermfg=16 ctermbg=229

"hi TabLine term=underline ctermfg=16 ctermbg=145
"hi TabWinNum term=bold cterm=bold ctermfg=90 ctermbg=145
"hi TabNum term=bold cterm=bold ctermfg=16 ctermbg=145

"Rename tabs to show tab# and # of viewports
if exists("+showtabline")
  function! MyTabLine()
    let s = ''
    let wn = ''
    let t = tabpagenr()
    let i = 1
    while i <= tabpagenr('$')
      let buflist = tabpagebuflist(i)
      let winnr = tabpagewinnr(i)
      let s .= '%' . i . 'T'
      let s .= (i == t ? '%1*' : '%2*')
      let s .= ' '
      let wn = tabpagewinnr(i,'$')

      let s .= (i== t ? '%#TabNumSel#' : '%#TabNum#')
      let s .= i
      if tabpagewinnr(i,'$') > 1
        let s .= '.'
        let s .= (i== t ? '%#TabWinNumSel#' : '%#TabWinNum#')
        let s .= (tabpagewinnr(i,'$') > 1 ? wn : '')
      end

      let s .= ' %*'
      let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
      let bufnr = buflist[winnr - 1]
      let file = bufname(bufnr)
      let buftype = getbufvar(bufnr, 'buftype')
      if buftype == 'nofile'
        if file =~ '\/.'
          let file = substitute(file, '.*\/\ze.', '', '')
        endif
      else
        let file = fnamemodify(file, ':p:t')
      endif
      if file == ''
        let file = '[No Name]'
      endif
      let s .= file
      let s .= (i == t ? '%m' : '')
      let i = i + 1
    endwhile
    let s .= '%T%#TabLineFill#%='
    return s
  endfunction
  set stal=2
  set tabline=%!MyTabLine()
endif

set showtabline=1

"nnoremap <leader>u :GundoToggle<CR>

cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

"set formatprg=par\ -w78

" Make Y behave consistently with D and C
noremap Y y$

" Re-select visual area after indenting
vnoremap > >gv
vnoremap < <gv

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

map <leader>w :wa<CR>

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

"set tags=tags;/

nnoremap <leader>soa :s/->\([a-zA-Z_]*\)/\['\1'\]/<CR>

au BufRead,BufNewFile *.thrift set filetype=thrift
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.wiki set filetype=creole
au BufRead,BufNewFile *.less set filetype=less

unmap Y
nnoremap Y y$

set updatetime=4000

" Enable automatic title setting for terminals
set title
set titleold="Terminal"
set titlestring=%f
" Set iterm title
set t_ts=]1;
set t_fs=


autocmd FileType python :IndentGuidesEnable
let g:indent_guides_auto_colors = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=0

let python_highlight_all = 1
augroup Python
  au!
  " see also :help smartindent , cinwords
  au FileType python set autoindent smartindent et sts=4 sw=4 tw=80 fo=croq
  " turn off the C preprocessor indenting
  " (allow comments in Python to be indented properly)
  au FileType python inoremap # X^H#
augroup END

" CoffeeScript
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
"au BufWritePost *.coffee silent CoffeeLint! | cwindow
"if executable('coffeetags')
  "autocmd BufWritePost,FileWritePost *.coffee silent! !coffeetags -R -f tags &
"endif

"let g:ctrlp_working_path_mode = 0
"let g:ctrlp_extensions = ["tag", "buffertag"]
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|salesforce$\|mobile$\|mocks$\|codemirror$\|__unused$\|\.idea$\|third_party$\|tmp$',
  \ 'file': '\.css$\|\.DS_Store$\|\.pdf$\|\.zip$\|\.git*',
  \ 'link': '',
  \ }
"map <C-i> :CtrlPMRU<CR>
map <C-o> :CtrlPBuffer<CR>

cnoremap W w
cnoremap Q q

noremap <Leader>aa :Ack! 
noremap <Leader>aw :Ack! <cword><cr>

set clipboard=unnamed

autocmd FileType vo_base :set updatetime=4000

"highlight clear
"map <silent> <leader>hc :noh<cr>
nnoremap <CR> :noh<CR><CR>

fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd FileType c,cpp,java,php,ruby,python,javascript autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

set colorcolumn=80

nnoremap <C-[> :pop<CR>

let g:easytags_cmd = '/usr/local/bin/jsctags'
