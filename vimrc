call plug#begin('~/.vim/plugged')

Plug 'mileszs/ack.vim' "grep
Plug 'qpkorr/vim-bufkill' "windows stays open
Plug 'tpope/vim-fugitive' "git
Plug 'tpope/vim-rhubarb' "github
Plug 'tpope/vim-surround' "parentheses
Plug 'tpope/vim-sensible' "base config
Plug 'tpope/vim-sleuth' "indents
Plug 'tpope/vim-commentary' "comment out
Plug 'sjl/gundo.vim' "visual undo history
Plug 'AndrewRadev/splitjoin.vim' "multiline statements
Plug 'vim-syntastic/syntastic' "lint
Plug 'hashivim/vim-terraform'

Plug 'wincent/Command-T' "fuzzy navigation
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

call plug#end()


" GNU screen apparently needs this for colours
set t_Co=256

set background=dark
colorscheme kimiko

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"syntastic settings
"let g:syntastic_enable_signs=0 "takes pre columns
"let g:syntastic_auto_loc_list=2
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Python 3.newer
let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_markdown_mdl_args = "-r ~MD003,~MD004,~MD033"

"make Y consistent with C and D
nnoremap Y y$

" slide switch
"nnoremap <expr> <right> (len(filter(range(0, bufnr('$')), 'buflisted(v:val)')) > 1 ? ":bn\<cr>" : "\<right>")
"nnoremap <expr> <left> (len(filter(range(0, bufnr('$')), 'buflisted(v:val)')) > 1 ? ":bp\<cr>" : "\<left>")

"spell check when writing commit logs
autocmd filetype svn,*commit*,markdown setlocal spell

"http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
"hacks from above to delete fugitive buffers when we
"leave them - otherwise the buffer list gets poluted
"add a mapping on .. to view parent tree
autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd BufReadPost fugitive://*
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \ nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

" https://github.com/derekwyatt/vim-config/
" Printing options
set printoptions=header:0,duplex:long,paper:a4
" set the forward slash to be the slash of note. Backslashes suck
set shellslash

" Make command line two lines high
set ch=2
" Make the 'cw' u like commands put a $ at the end instead of just deleting
" the text and replacing it
set cpoptions+=$
" Set up the gui cursor to look nice
"set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" When completing by tag, show the whole tag, not just the function name
set showfulltag
" blank window separators
set fillchars = ""
" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048


set showmode
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ignorecase          " Apparently these 2 go together
set smartcase           " Do smart case matching
set hlsearch
set hidden             " Hide buffers when they are abandoned
"set autowrite           " Automatically save before commands like :next and :make

"set guioptions-=TmrL
"set guioptions = agit
" set guioptions = ai

"  === Mappings ===
" Toggle paste mode
nmap <silent><leader>p :set invpaste<CR>:set paste?<CR>
" clear the highlight as well as redraw
nnoremap <leader>n :nohls<CR><C-L>
" Underline the current line with '='
nmap <silent><leader>ul :t.\|s/./=/g\|:nohls<cr>
" Shrink the current window to fit the number of lines in the buffer
nmap <silent><leader>sw :execute ":resize " . line('$')<cr>
" Use the bufkill plugin to eliminate a buffer but keep the window layout
nmap <leader>bd :BD<cr>
" Leave Insert mode with jj
imap jj <esc>
" Terraform
nmap <leader>tf :Terraform<cr>
nmap <leader>tff :TerraformFmt<cr>
let g:terraform_fmt_on_save = 1

" Markdown
"autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'sh', 'yaml']
let g:markdown_minlines = 100

""   ===  Python  ===
"" some from http://www.vex.net/~x/python_and_vim.html
""set textwidth=80
"set expandtab
"set tabstop=8
"set softtabstop=4
"set smarttab
"set shiftwidth=4
"set autoindent
"let python_highlight_all = 1 " mainly space_error
""Trim Trailing Whitespace
""doesn't work?
""autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
"
"if has("autocmd")
"  au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
"  au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
"  au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
"endif


"http://items.sjbach.com/319/configuring-vim-right
nnoremap ' `
nnoremap ` '
"nnoremap <SPACE> <Nop>
"let mapleader = " "
"the above broke mysteriously
let mapleader="\\"
map <Space> <Leader>

set history=1000
" runtime like source rel to the Vim installation dir
runtime macros/matchit.vim
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp "swap files
" From http://stripey.com/vim/vimrc.html
" have command-line completion <Tab> (for filenames, help topics, option
" names)
" first list the available options and complete the longest common part, then
" have further <Tab>s cycle through the possibilities:
set wildmenu
set wildmode=list:longest,full
"stuff to ignore when tab completing
set wildignore=*.o,*.obj,*~,*.pyc

set title
set scrolloff=5
set ruler

" whitespace display
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅
nmap <silent><leader>s :set nolist!<CR>


" cont from http://sontek.net/turning-vim-into-a-modern-python-ide
set foldmethod=indent
set foldlevel=99

" window movement
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"map <leader>td <Plug>TaskList
map <leader>g :GundoToggle<CR>
"let g:pep8_map='<leader>8'
" SuperTab
set omnifunc=syntaxcomplete#Complete
"au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
" Ack
nmap <leader>a <Esc>:Ack!
"" py.test
"" Execute the tests
"nmap <silent><Leader>tf <Esc>:Pytest file<CR>
"nmap <silent><Leader>tc <Esc>:Pytest class<CR>
"nmap <silent><Leader>tm <Esc>:Pytest method<CR>
"" cycle through test errors
"nmap <silent><Leader>tn <Esc>:Pytest next<CR>
"nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
"nmap <silent><Leader>te <Esc>:Pytest error<CR>
""currently no config for virtualenv

"" http://blog.fluther.com/django-vim/
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" https://github.com/scrooloose/vimfiles/blob/master/vimrc
set formatoptions-=o "dont continue comments when pushing o/O





" ## Custom stuff from ~2011

" Macros
" django model->modelAdmin. start line above
let @c='j0Oojwvt(yf(iAdminllcwadminf)iAdminopassadmin.site.register(mls."0pa, "0paAdmin)'
" awscli space separated -> credentials + config
let @r='0dt.r[Ea]ld2wiaws_access_key_id = Eldwiaws_secret_access_key = oj'
let @o='/[aprofile jdjOoutput = jsonregion = eu-central-1'


command Md2tei call Md2tei()
function Md2tei()

    " paragraph wrapping
    g/^\w/normal vapkS<p>

    " establish helper hash for proper nesting
    normal Go# 
    " section nesting
    g/^#\{4}\s/normal V/^#\{1,4}\skS<div>
    g/^#\{3}\s/normal V/^#\{1,3}\skS<div>
    g/^#\{2}\s/normal V/^#\{1,2}\skS<div>
    " remove helper hash
    normal G dd

    " generate internal link targets
    " this can be overly complicated
    " as I had confusing binding conflicts
    g/##/normal nwy$O0C@@midstep@@"0pVu
    g/@@midstep@@/s/\s/-/g
    g/@@midstep@@/normal 0i<div xml:id="kddA">
    %s/@@midstep@@//
    " wrap section titles
    %s/#\{2,5}\s\+\(.\+\)/<head>\1<\/head>

    " title, yanked into "t
    normal gg/^#\sxx"ty$yss<head>
    normal 0V/<divkS<div>

    normal nO</front><body>
    normal Go</body>
    normal gg/<divO<front>
    "normal ggO<front>

    set filetype=xml
    " reformat
    normal gg v G =

    " highlights - warning, misses line-spanning ones
    %s/\*\*\([^*]\+\)\*\*/<hi rend="HINT">\1<\/hi>/g
    %s/\*\([^*]\+\)\*/<hi>\1<\/hi>/g

    " internal links - warning as above, + spaces in targets
    %s/_\([^_]\+\)_/<ptr target="#\L\1\E"\/>/g

endfunction

command TeiWrap call TeiWrap()
function TeiWrap()
    normal gg
    read doc/xmlstub.xml
    normal Go</text></TEI>
    normal gg v G =
endfunction




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
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*

set statusline+=%{StatuslineTrailingSpaceWarning()}

set statusline+=%{StatuslineLongLineWarning()}

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

set statusline+=%= "left/right separator
"set statusline+=%#Comment#
set statusline+=%{StatuslineCurrentHighlight()}\ \
"set statusline+=%*
set statusline+=%c, "cursor column
set statusline+=%l/%L "cursor line/total lines
set statusline+=\ %P "percent through file
set laststatus=2
"-----------------
if v:version >= 703
    set undodir=~/tmp/undofiles
    set undofile
    " mark the ideal max text width
    set colorcolumn=+1
endif

"recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning
"return '[\s]' if trailing white space is detected
"return '' otherwise
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")

        if !&modifiable
            let b:statusline_trailing_space_warning = ''
            return b:statusline_trailing_space_warning
        endif

        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = '[\s]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction
"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction
"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning
"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let b:statusline_tab_warning = ''
        if !&modifiable
            return b:statusline_tab_warning
        endif
        let tabs = search('^\t', 'nw') != 0
"find spaces that arent used as alignment in the first indent column
        let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0
        if tabs && spaces
            let b:statusline_tab_warning = '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        endif
    endif
    return b:statusline_tab_warning
endfunction
"recalculate the long line warning when idle and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning
"return a warning for long lines where long is either &textwidth or 80 (if
"no &textwidth is set)
"return '' if no long lines
"return '[#x,my,$z] if long lines are found, were x is the number of long
"lines, y is the median length of the long lines and z is the length of the
"longest line
function! StatuslineLongLineWarning()
    if !exists("b:statusline_long_line_warning")
        if !&modifiable
            let b:statusline_long_line_warning = ''
            return b:statusline_long_line_warning
        endif
        let long_line_lens = s:LongLines()
        if len(long_line_lens) > 0
            let b:statusline_long_line_warning = "[" .
                        \ '#' . len(long_line_lens) . "," .
                        \ 'm' . s:Median(long_line_lens) . "," .
                        \ '$' . max(long_line_lens) . "]"
        else
            let b:statusline_long_line_warning = ""
        endif
    endif
    return b:statusline_long_line_warning
endfunction
"return a list containing the lengths of the long lines in this buffer
function! s:LongLines()
    let threshold = (&tw ? &tw : 80)
    let spaces = repeat(" ", &ts)
    let long_line_lens = []
    let i = 1
    while i <= line("$")
        let len = strlen(substitute(getline(i), '\t', spaces, 'g'))
        if len > threshold
            call add(long_line_lens, len)
        endif
        let i += 1
    endwhile
    return long_line_lens
endfunction
"find the median of the given array of numbers
function! s:Median(nums)
    let nums = sort(a:nums)
    let l = len(nums)
    if l % 2 == 1
        let i = (l-1) / 2
        return nums[i]
    else
        return (nums[l/2] + nums[(l/2)-1]) / 2
    endif
endfunction

