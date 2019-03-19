"### map leader
let mapleader = ","

"### remap escape
xmap <C-;> <Esc>

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
set directory=~/.vim/tmp
set ambiwidth=double
set redrawtime=10000
"set encoding=utf-8
syntax enable
let g:netrw_altv=1


"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " My favorite
  call dein#add('Shougo/vimproc.vim', {'build': 'make'})
  call dein#add('Shougo/vimshell')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/unite-outline')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/vimfiler')
  call dein#add('Shougo/echodoc.git')
  call dein#add('Shougo/vinarise.git')
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/neosnippet')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('fatih/vim-go.git')
  call dein#add('tpope/vim-fugitive')
  call dein#add('kmnk/vim-unite-giti.git')
  call dein#add('majutsushi/tagbar')
"  call dein#add('dgryski/vim-godef')
"  call dein#add('vim-jp/vim-go-extra')
  call dein#add('cohama/lexima.vim')
  call dein#add('kana/vim-smartchr.git')
"  call dein#add('osyo-manga/vim-over.git')
  call dein#add('vim-scripts/nginx.vim')
"  call dein#add('rust-lang/rust.vim')
"  call dein#add('racer-rust/vim-racer')
  call dein#add('tpope/vim-markdown')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('aklt/plantuml-syntax')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('AndrewRadev/splitjoin.vim')
  call dein#add('tpope/vim-surround')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  if has('job') && has('channel') && has('timers')
    call dein#add('w0rp/ale')
  else
    call dein#add('vim-syntastic/syntastic')
  endif

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

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

"### grep
nnoremap <Leader>gr :<C-u>InnerGrep<Space>
command! -nargs=? InnerGrep vimgrep /<args>/ % | cw

"### substitute
nnoremap <expr> <Leader>ss ':%substitute/\<' . expand('<cword>') . '\>/'

"### terminal
nnoremap <Leader>tr :<C-u>rightbelow term ++rows=10<CR>

"### cmdline-window
nnoremap <sid>(command-line-enter) q:
xnoremap <sid>(command-line-enter) q:
nnoremap <sid>(command-line-norange) q:<C-u>
nmap : <sid>(command-line-enter)
xmap : <sid>(command-line-enter)

autocmd CmdwinEnter * call s:init_cmdwin()
" autocmd CmdwinLeave * let g:neocomplete#enable_auto_select = 1

function! s:init_cmdwin()
	let g:deoplete#enable_auto_select = 0

    nnoremap <buffer><silent> q :<C-u>quit<CR>
    nnoremap <buffer><silent> <TAB> :<C-u>quit<CR>

    inoremap <buffer><expr><CR> deoplete#close_popup()."\<CR>"
    inoremap <buffer><expr><C-h> col('.') == 1 ? "\<ESC>:quit\<CR>" : deoplete#cancel_popup()."\<C-h>"
    inoremap <buffer><expr><BS> col('.') == 1 ? "\<ESC>:quit\<CR>" : deoplete#cancel_popup()."\<C-h>"

    " Completion.
    inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : deoplete#manual_complete()
    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~ '\s'
    endfunction
    
    startinsert!
endfunction

"### deoplete-------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Use smartcase.
let g:deoplete#enable_smart_case = 1

" Set minimum syntax keyword length.
let g:deoplete#sources#syntax#min_keyword_length = 3

" disable preview
set completeopt-=preview

" Define dictionary.
let g:deoplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction

" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : deoplete#manual_complete()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"

"### END deoplete-------------------------

"### neosnippet-------------------------
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-t>     <Plug>(neosnippet_expand_or_jump)
smap <C-t>     <Plug>(neosnippet_expand_or_jump)
xmap <C-t>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"set snippet file dir
let g:neosnippet#snippets_directory ='~/.cache/dein/repos/github.com/Shougo/neosnippet-snippets/neosnippets/,~/.vim/snippets'
"### END neosnippet-------------------------

" ### manual resize
nnoremap <silent> <Leader>k :<C-u>resize +3<CR>
nnoremap <silent> <Leader>j :<C-u>resize -3<CR>
nnoremap <silent> <Leader>h :<C-u>vertical resize +3<CR>
nnoremap <silent> <Leader>l :<C-u>vertical resize -3<CR>

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
xnoremap <Leader>se y<Esc>q/<Esc>P<CR>

"### Unite
let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable  = 1
let g:unite_source_file_mru_limit  =  200
let g:unite_source_directory_mru_limit  =  200
let g:unite_source_grep_max_candidates = 200
noremap <C-l> :Unite buffer file directory file/new file_mru directory_mru<CR>

"### visual mode select search
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>

"### visual mode select substitute
vnoremap <silent> + "vy:%s/<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g').'/'

"### visual mode convert CamelCase to snake_case
vnoremap <silent> <Leader>cs :s#\(\<\u\l\+\\|\l\+\)\(\u\)#\l\1_\l\2#g<CR>:noh

"### visual mode convert snake_case to CamelCase
vnoremap <silent> <Leader>sc :s#\(\%(\<\l\+\)\%(_\)\@=\)\\|_\(\l\)#\u\1\2#g<CR>:noh

"### marking
inoremap <Leader>yy ¨
inoremap <Leader>mm 

"### Clipboard
vnoremap <Leader>y "+y
nnoremap <Leader>p "+p

"### visual mode select calculate(visual selected numbers into 'c'register and
"### add to 'r'register)
vnoremap <silent> <Leader>cal "cy:let @r=substitute(escape(@c,'\/'),"\n",'+','g')<CR>

""### golang
set path+=$GOPATH/src/**
""set runtimepath+=$GOROOT/misc/vim
""exe "set runtimepath+=".globpath( "$GOPATH", "src/github.com/nsf/gocode/vim")

" omnifunc mapping
inoremap <C-a> <C-x><C-o>

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

au FileType go compiler go
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b :call <SID>build_go_files()<CR>
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>cv <Plug>(go-coverage-toggle)
au FileType go nmap <leader>gd <Plug>(go-implements)
au FileType go nmap <leader>gt :GoDeclsDir<cr>
au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
au Filetype go nmap <leader>gah <Plug>(go-alternate-split)
au Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)
au FileType go nmap <F10> :GoTest -short<cr>
au FileType go nmap <F9> :GoCoverageToggle -short<cr>
au FileType go nmap <C-p> <Plug>(ale_previous)
au FileType go nmap <C-n> <Plug>(ale_next)

au FileType go :highlight goExtraVars cterm=bold ctermfg=6
au FileType go :match goExtraVars /\<ok\>\|\<err\>/

au BufNewFile,BufRead *.go setlocal sw=4 noexpandtab ts=4 completeopt=menu,preview filetype=go
au BufNewFile,BufRead *.go inoremap <expr> = smartchr#loop(' = ', ' := ', ' != ', ' == ', '=')
au BufNewFile,BufRead *.go inoremap <expr> - smartchr#loop('-', '<-')
""au BufNewFile,BufRead *.go nnoremap <C-p> :lprev<CR>
""au BufNewFile,BufRead *.go nnoremap <C-n> :lnext<CR>
au BufWritePre *.go :GoFmt

let g:go_fmt_command = 'goimports'
let g:go_fmt_fail_silently = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_declarations = 1
let g:go_def_mode = 'gopls'

""let g:go_auto_type_info = 1
""let g:go_auto_sameids = 1

""let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['go', 'python'] }
""let g:syntastic_go_checkers = ['go', 'golint']
""let g:syntastic_always_populate_loc_list = 1
""let g:syntastic_check_on_wq = 0
""let g:syntastic_auto_loc_list = 1
""let g:syntastic_check_on_open = 1

""let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
""let g:go_metalinter_autosave = 1
""let g:go_metalinter_autosave_enabled = ['vet', 'golint']

""let g:go_gocode_unimported_packages = 1

let g:go_snippet_engine = "neosnippet"

" VimFilerTree {{{
nnoremap <Leader>ft :VimFilerTree<CR>
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

" Enable file operation commands.
" Edit file by tabedit.
call vimfiler#custom#profile('default', 'context', {
      \ 'safe' : 0,
      \ })
" }}}

"### vim-over
"nnoremap <silent> <Leader>ov :OverCommandLine<CR>%s/

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
  nnoremap <silent><buffer><expr>ga unite#do_action('add')
  nnoremap <silent><buffer><expr>gA unite#do_action('add_patch')
  nnoremap <silent><buffer><expr>gc unite#do_action('checkout')
  nnoremap <silent><buffer><expr>gd unite#do_action('diff')
  nnoremap <silent><buffer><expr>gD unite#do_action('diff_cached')
  nnoremap <silent><buffer><expr>gu unite#do_action('unstage')
endfunction
"}}}

function! s:unite_hooks.giti_branch() "{{{
  nnoremap <silent><buffer><expr>s unite#do_action('switch')
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

""### Rust
au FileType rust set hidden
let g:racer_cmd = "$HOME/.cargo/bin/racer"
let g:racer_experimental_completer = 1
let g:rustfmt_autosave = 1
let g:rustfmt_command = "$HOME/.cargo/bin/rustfmt"
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

""### Python
let g:syntastic_python_checkers = ['flake8']

""### PluntUML
let g:plantuml_executable_script="~/dev/misc/dotfiles/misc/plantuml.sh"

""### Cron
set backupskip=/tmp/*,/private/tmp/*

""### ALE and airline
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {'go': ['gometalinter']}
let g:ale_go_gometalinter_options = '--fast --enable=staticcheck --enable=gosimple --enable=unused'
""let g:ale_linters = {'go': ['golangci-lint']}
""let g:ale_go_golangci_lint_options = '--disable=typecheck --disable=gochecknoinits --disable=lll --disable=megacheck'

""### airline theme
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline_theme ='molokai'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

" TagBar {{{
nnoremap <Leader>tb :Tagbar<CR>
