filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()



syntax on
"set background=dark
"colorscheme koehler
colorscheme kimiko

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

"-----------------
"statusline setup
set statusline=%f "tail of the filename

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h "help file flag
set statusline+=%y "filetype
set statusline+=%r "read only flag
set statusline+=%m "modified flag

set statusline+=%{fugitive#statusline()}

"display a warning if &et is wrong, or we have mixed-indenting
"set statusline+=%#error#
"set statusline+=%{StatuslineTabWarning()}
"set statusline+=%*

"set statusline+=%{StatuslineTrailingSpaceWarning()}

"set statusline+=%{StatuslineLongLineWarning()}

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

set statusline+=%= "left/right separator
"set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
set statusline+=%c, "cursor column
set statusline+=%l/%L "cursor line/total lines
set statusline+=\ %P "percent through file
set laststatus=2
"-----------------

set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set autowrite           " Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned


"   ===  Python  ===
" some from http://www.vex.net/~x/python_and_vim.html
"set expandtab
set textwidth=79
"set tabstop=8
"set softtabstop=4
"set smarttab
"set shiftwidth=4
set autoindent
let python_highlight_all = 1 " mainly space_error
"Trim Trailing Whitespace
"doesn't work?
"autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``


"http://items.sjbach.com/319/configuring-vim-right
nnoremap ' `
nnoremap ` '
let mapleader = " "
set history=1000
runtime macros/matchit.vim
set wildmenu
set wildmode=list:longest

set ignorecase 
set smartcase
set title
set scrolloff=3 "to reconsider
set ruler
set hlsearch
set incsearch

set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅
nmap <silent> <leader>s :set nolist!<CR> "show white with " s"


"cont from http://sontek.net/turning-vim-into-a-modern-python-ide
set foldmethod=indent
set foldlevel=99

map <leader>td <Plug>TaskList
map <leader>g :GundoToggle<CR>
let g:pep8_map='<leader>8'

au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

map <leader>n :NERDTreeToggle<CR>

"no rope config for now
"and some others....

map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>


