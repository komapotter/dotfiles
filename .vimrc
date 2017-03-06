"### window basic
set ch=2
set mousehide

"### initialize
set iskeyword&
autocmd!

"### keyword escape
set iskeyword+=\:
set iskeyword+=\;
set iskeyword+=\-
set iskeyword+=\_
set iskeyword+=\.
set iskeyword+=\$
set iskeyword+=\@
set iskeyword+=\%
set iskeyword+=\&
set iskeyword+=\'
set iskeyword+=\"
set iskeyword+=\<
set iskeyword+=\>
set iskeyword+=\#
set iskeyword+=\*

"### general settings
set complete+=k
set nu
set shiftround
set expandtab
set shiftwidth=4
set tabstop=4
set ignorecase
set smartcase
set backspace=eol,indent,start
set virtualedit=all
set nobackup
set history=1000
set hlsearch
syntax enable
let g:netrw_altv=1

"### neobundle
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible " Be iMproved
  endif
  set runtimepath+=~/.vim/neobundle.vim.git/
endif

"" proxy
let g:neobundle_default_git_protocol='https'

call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

"" let NeoBundle manage NeoBundle required! 
NeoBundle 'https://github.com/Shougo/neobundle.vim'
"" recommended to install
NeoBundle 'https://github.com/Shougo/vimproc'
"" after install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'https://github.com/Shougo/vimshell'
NeoBundle 'https://github.com/Shougo/unite.vim'
NeoBundle 'https://github.com/Shougo/unite-outline'
NeoBundle 'https://github.com/Shougo/neocomplcache'
NeoBundle 'https://github.com/Shougo/vimfiler'
NeoBundle 'https://github.com/Shougo/echodoc.git'
NeoBundle 'https://github.com/Shougo/vinarise.git'
NeoBundle 'https://github.com/Shougo/neomru.vim'
NeoBundle 'https://github.com/fatih/vim-go.git'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'https://github.com/kmnk/vim-unite-giti.git'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'dgryski/vim-godef'
NeoBundle 'vim-jp/vim-go-extra'
NeoBundle 'https://github.com/Townk/vim-autoclose'
"
"" My Bundles here:
""
"" original repos on github
"NeoBundle 'tpope/vim-fugitive'
"NeoBundle 'Lokaltog/vim-easymotion'
"NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"" vim-scripts repos
"NeoBundle 'L9'
"NeoBundle 'FuzzyFinder'
"NeoBundle 'rails.vim'
"" non github repos
"NeoBundle 'git://git.wincent.com/command-t.git'
"" non git repos
"NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'
"NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'
"
"" add my favorite
NeoBundle 'https://github.com/kana/vim-smartchr.git'
"NeoBundle 'https://github.com/thinca/vim-quickrun'
"NeoBundle 'davidco/taskpaper'
NeoBundle 'https://github.com/osyo-manga/vim-over.git'
NeoBundle 'nginx.vim'
NeoBundle 'scrooloose/syntastic'
call neobundle#end()

filetype plugin indent on     " required!

" Installation check.
NeoBundleCheck

"### paste
lnoremap <c-v> <c-v>
cnoremap <c-v> <c-v>

"### rc edit
nnoremap <Space>. :<C-u>edit $MYVIMRC<Return>
nnoremap <Space>s. :<C-u>source $MYVIMRC<Return>
nnoremap <Space>h. :<C-u>helptags $VIM\vimfiles\doc\<Return>

"### mac escape 
inoremap \ \

"### updown
noremap j gj
noremap k gk
noremap gj j
noremap gk k

inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

"### paste select
nnoremap gc `[v`]
vnoremap gc :<C-u>normal gc<Return>
onoremap gc :<C-u>normal gc<Return>

"### help
"nnoremap <C-h> :<C-u>help<Space>
"nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><Return>

"### grep
nnoremap ,gr :<C-u>InnerGrep<Space>
command! -nargs=? InnerGrep vimgrep /<args>/ % | cw

"### substitute
nnoremap <expr> ,ss ':%substitute/\<' . expand('<cword>') . '\>/'

""### buffer select
" noremap <C-l> :<C-u>ls<Return>:b<Space>
" nnoremap <LEFT> :bn<RETURN>
" nnoremap <RIGHT> :bN<RETURN>

"### paren
vnoremap ,sc "zc(<C-r>z)<Esc>
inoremap ,mc ()<Esc>i

"### smartchr
"inoremap <expr> = smartchr#loop('=', ' = ', ' => ', ' == ')
"inoremap <expr> - smartchr#loop('-', '->')
"inoremap <expr> $ smartchr#loop('$', '$(''', '$(''#')
"inoremap <expr> [ smartchr#loop('[ ', ' [ ',)
"inoremap <expr> ] smartchr#loop(' ]', '] ',)
"inoremap <expr> { smartchr#loop('{ ', ' { ',)
"inoremap <expr> } smartchr#loop(' }', '} ',)
"inoremap <expr> ( smartchr#loop('( ', ' ( ',)
"inoremap <expr> ) smartchr#loop(' )', ') ',' ) )',)

"### amp escape
"noremap <C-i> :ToAmp<Space>
"command! -range -nargs=? ToAmp :<line1>,<line2>call _ToAmp()
"function! _ToAmp() range
"    for linenum in range(a:firstline, a:lastline)
"       let l:curr_line = getline(linenum)
"        let l:replacement = substitute(l:curr_line, '&', '&amp', '')
"        call setline(linenum, l:replacement)
"    endfor
"endfunction

"### neocomplcache
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
" let g:neocomplcache_dictionary_filetype_lists = {
"     \ 'default' : '',
"     \ 'vimshell' : $HOME.'/.vimshell_hist',
"     \ 'scheme' : $HOME.'/.gosh_completions'
"         \ }
	
" Define keyword.
" if !exists('g:neocomplcache_keyword_patterns')
"     let g:neocomplcache_keyword_patterns = {}
" endif
" let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
"imap <C-k>     <Plug>(neocomplcache_snippets_expand)
"smap <C-k>     <Plug>(neocomplcache_snippets_expand)
"inoremap <expr><C-g>     neocomplcache#undo_completion()
"inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
" inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "<CR>"
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
" if !exists('g:neocomplcache_omni_patterns')
" 	let g:neocomplcache_omni_patterns = {}
" endif
" let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
" let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
" let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
" let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" ### window width
"nnoremap <C-w><C-w> <C-w>w:call <SID>good_width()<Cr>
"nnoremap <C-w><C-h> <C-w>h:call <SID>good_width()<Cr>
"nnoremap <C-w><C-l> <C-w>l:call <SID>good_width()<Cr>
"nnoremap <C-w><C-j> <C-w>j:call <SID>good_width()<Cr>
"nnoremap <C-w><C-k> <C-w>k:call <SID>good_width()<Cr>
"function! s:good_width()
"    if winwidth(0) < 100
"        vertical resize 100
"    endif
"endfunction

" ### cmdline-window
nnoremap <sid>(command-line-enter) q:
xnoremap <sid>(command-line-enter) q:
nnoremap <sid>(command-line-norange) q:<C-u>
"
nmap :  <sid>(command-line-enter)
xmap :  <sid>(command-line-enter)

autocmd CmdwinEnter * call s:init_cmdwin()
function! s:init_cmdwin()
    nnoremap <buffer> q :<C-u>quit<CR>
    nnoremap <buffer> <TAB> :<C-u>quit<CR>
    inoremap <buffer><expr><CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
    inoremap <buffer><expr><C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
    inoremap <buffer><expr><BS> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"

    " Completion.
    inoremap <buffer><expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    
    startinsert!
endfunction

" ### visual mode select search
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>

" ### manual resize
nnoremap <silent> ,k :<C-u>resize +3<CR>
nnoremap <silent> ,j :<C-u>resize -3<CR>
nnoremap <silent> ,h :<C-u>vertical resize +3<CR>
nnoremap <silent> ,l :<C-u>vertical resize -3<CR>

" ### Buffer read
autocmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
autocmd BufRead * if expand('%') != '' && &buftype !~ 'nofile' | silent loadview | endif
set viewoptions-=options

" ### Search setting
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
  
" ### line yank
nnoremap Y y$

" ### binary edit
" vim -b : edit binary using xxd-format!
augroup Binary
  au!
  au BufReadPre  *.bin,*.exe,*.dll let &bin=1
  au BufReadPost *.bin,*.exe,*.dll if &bin | %!xxd
  au BufReadPost *.bin,*.exe,*.dll set ft=xxd | endif
  au BufWritePre *.bin,*.exe,*.dll if &bin | %!xxd -r
  au BufWritePre *.bin,*.exe,*.dll endif
  au BufWritePost *.bin,*.exe,*.dll if &bin | %!xxd
  au BufWritePost *.bin,*.exe,*.dll set nomod | endif
augroup END

" ### free split 
nmap spj <SID>(split-to-j)
nmap spk <SID>(split-to-k)
nmap sph <SID>(split-to-h)
nmap spl <SID>(split-to-l)

nnoremap <SID>(split-to-j) :<C-u>execute 'belowright' (v:count == 0 ? '' : v:count) 'split'<CR>
nnoremap <SID>(split-to-k) :<C-u>execute 'aboveleft'  (v:count == 0 ? '' : v:count) 'split'<CR>
nnoremap <SID>(split-to-h) :<C-u>execute 'topleft'    (v:count == 0 ? '' : v:count) 'vsplit'<CR>
nnoremap <SID>(split-to-l) :<C-u>execute 'botright'   (v:count == 0 ? '' : v:count) 'vsplit'<CR>

"### undo persistence
if has('persistent_undo')
    set undodir=~/.vim/vimundo
    set undofile
endif

"### yank and search
xnoremap ,se y<Esc>q/<Esc>P<CR>

"### Unite
let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable  = 1
let g:unite_source_file_mru_limit  =  200
noremap <C-l> :Unite buffer file file/new file_mru<CR>

"### visual mode select search
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>

"### visual mode select substitute
vnoremap <silent> + "vy:%s/<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g').'/'

"### marking
inoremap ,yy Å®
inoremap ,mm Åú

"### Clipboard
vnoremap ,y "+y
nnoremap ,p "+p

"### visual mode select calculate(visual selected numbers into 'c'register and
"### add to 'r'register)
vnoremap <silent> ,cal "cy:let @r=substitute(escape(@c,'\/'),"\n",'+','g')<CR>

""### vimshell
"let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
""let g:vimshell_right_prompt = 'vcs#info("(%s)-[%b]", "(%s)-[%b|%a]")'
"let g:vimshell_enable_smart_case = 1
"
"if has('win32') || has('win64')
"  " Display user name on Windows.
"  let g:vimshell_prompt = $USERNAME."% "
"else
"  " Display user name on Linux.
"  let g:vimshell_prompt = $USER."% "
"
"  call vimshell#set_execute_file('bmp,jpg,png,gif', 'gexe eog')
"  call vimshell#set_execute_file('mp3,m4a,ogg', 'gexe amarok')
"  let g:vimshell_execute_file_list['zip'] = 'zipinfo'
"  call vimshell#set_execute_file('tgz,gz', 'gzcat')
"    call vimshell#set_execute_file('tbz,bz2', 'bzcat')
"endif
"
"" Initialize execute file list.
"let g:vimshell_execute_file_list = {}
""call vimshell#set_execute_file('txt,vim,c,h,cpp,d,xml,java', 'vim')
"let g:vimshell_execute_file_list['rb'] = 'ruby'
"let g:vimshell_execute_file_list['pl'] = 'perl'
"let g:vimshell_execute_file_list['py'] = 'python'
""call vimshell#set_execute_file('html,xhtml', 'gexe firefox')
"
"autocmd FileType vimshell
"\ call vimshell#altercmd#define('g', 'git')
"\| call vimshell#altercmd#define('i', 'iexe')
"\| call vimshell#altercmd#define('l', 'll')
"\| call vimshell#altercmd#define('ll', 'ls -l')
"\| call vimshell#hook#add('chpwd', 'my_chpwd', 'g:my_chpwd')
"
"function! g:my_chpwd(args, context)
"  call vimshell#execute('ls')
"endfunction
"
"autocmd FileType int-* call s:interactive_settings()
"function! s:interactive_settings()
"endfunction


""### vimfiler
"let g:vimfiler_as_default_explorer = 1


""### ChangeLog 
"let g:task_paper_date_format = "%Y-%m-%dT%H:%M:%S%z"
""nnoremap <Space>g. :<C-u>edit c:/Documents\ and\ Settings/yasushik/Desktop/memo/gtd.taskpaper<Return>
""nnoremap <Space>t. :<C-u>set filetype=taskpaper<CR>
"autocmd BufRead,BufNewFile *taskpaper set filetype=taskpaper
"
""### matchit
"source $VIMRUNTIME/macros/matchit.vim

""### golang
set path+=$GOPATH/src/**
""set runtimepath+=$GOROOT/misc/vim
exe "set runtimepath+=".globpath( "$GOPATH", "src/github.com/nsf/gocode/vim")
inoremap <C-a> <C-x><C-o>
au BufNewFile,BufRead *.go set sw=4 noexpandtab ts=4 completeopt=menu,preview filetype=go
au BufNewFile,BufRead *.go inoremap <expr> = smartchr#loop(' = ', ' := ', ' != ', ' == ')
au BufWritePre *.go :GoFmt
au FileType go compiler go
let g:go_fmt_command = 'goimports'
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['go'] }
let g:syntastic_go_checkers = ['go', 'golint']
au FileType go :highlight goExtraVars cterm=bold ctermfg=6
au FileType go :match goExtraVars /\<ok\>\|\<err\>/

" VimFilerTree {{{
command! VimFilerTree call VimFilerTree(<f-args>)
function VimFilerTree(...)
    let l:h = expand(a:0 > 0 ? a:1 : '%:p:h')
    let l:path = isdirectory(l:h) ? l:h : ''
    exec ':VimFiler -buffer-name=explorer -split -simple -winwidth=45 -toggle -no-quit ' . l:path
    wincmd t
    setl winfixwidth
endfunction
autocmd! FileType vimfiler call s:my_vimfiler_settings()
function! s:my_vimfiler_settings()
    nmap     <buffer><expr><CR> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
    nnoremap <buffer>s          :call vimfiler#mappings#do_action('my_split')<CR>
    nnoremap <buffer>v          :call vimfiler#mappings#do_action('my_vsplit')<CR>
endfunction

let my_action = {'is_selectable' : 1}
function! my_action.func(candidates)
    wincmd p
    exec 'split '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_split', my_action)

let my_action = {'is_selectable' : 1}
function! my_action.func(candidates)
    wincmd p
    exec 'vsplit '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_vsplit', my_action)
" }}}

"### vim-over
nnoremap <silent> ,m :OverCommandLine<CR>%s/

" ----------------------------------------
" Unite for git
let g:giti_git_command = executable('hub') ? 'hub' : 'git'
nnoremap <silent>gm :Gcommit<CR>
nnoremap <silent>gM :Gcommit --amend<CR>
"nnoremap <silent>gb :Gblame<CR>
"nnoremap <silent>gB :Gbrowse<CR>

let g:fugitive_git_executable = executable('hub') ? 'hub' : 'git'
nnoremap <silent>gs :Unite giti/status -horizontal<CR>
nnoremap <silent>gl :Unite giti/log -horizontal<CR>
nnoremap <silent>gh :Unite giti/branch_all<CR>

augroup UniteCommand
  autocmd!
  autocmd FileType unite call <SID>unite_settings()
augroup END

function! s:unite_settings() "{{{
  for source in unite#get_current_unite().sources
    let source_name = substitute(source.name, '[-/]', '_', 'g')
    if !empty(source_name) && has_key(s:unite_hooks, source_name)
      call s:unite_hooks[source_name]()
    endif
  endfor
endfunction
"}}}

let s:unite_hooks = {}

function! s:unite_hooks.giti_status() "{{{
  nnoremap <silent><buffer><expr>gM unite#do_action('amend')
  nnoremap <silent><buffer><expr>gm unite#do_action('commit')
  nnoremap <silent><buffer><expr>ga unite#do_action('stage')
  nnoremap <silent><buffer><expr>gc unite#do_action('checkout')
  nnoremap <silent><buffer><expr>gd unite#do_action('diff')
  nnoremap <silent><buffer><expr>gu unite#do_action('unstage')
endfunction
"}}}

function! s:unite_hooks.giti_branch() "{{{
  nnoremap <silent><buffer><expr>d unite#do_action('delete')
  nnoremap <silent><buffer><expr>D unite#do_action('delete_force')
"  nnoremap <silent><buffer><expr>rd unite#do_action('delete_remote')
"  nnoremap <silent><buffer><expr>rD unite#do_action('delete_remote_force')
endfunction
"}}}

function! s:unite_hooks.giti_branch_all() "{{{
  call self.giti_branch()
endfunction
"}}}

augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

""### html
au BufNewFile,BufRead *.html set sw=2 expandtab ts=2 completeopt=menu,preview filetype=html
au BufNewFile,BufRead *.html inoremap <expr> = smartchr#loop('="', '=')

""### vue.js
au BufNewFile,BufRead *.vue set sw=2 expandtab ts=2 completeopt=menu,preview filetype=html

""### js
au BufNewFile,BufRead *.js set sw=2 expandtab ts=2 completeopt=menu,preview filetype=javascript

""### css
au BufNewFile,BufRead *.css set sw=2 expandtab ts=2 completeopt=menu,preview filetype=css

""### json
au BufNewFile,BufRead *.json set sw=2 expandtab ts=2 completeopt=menu,preview filetype=json

""### yaml
au BufNewFile,BufRead *.yaml set sw=2 expandtab ts=2 completeopt=menu,preview filetype=yaml
