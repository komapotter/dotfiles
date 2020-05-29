"### general settings {{{
set nocompatible
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

"### map leader
let mapleader = ","

"### remap escape
xmap <C-;> <Esc>

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

"### line yank
nnoremap Y y$

"### Clipboard
vnoremap <Leader>y "+y
nnoremap <Leader>p "+p

"### visual mode select search
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>

"### visual mode select substitute
vnoremap <silent> + "vy:%s/<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g').'/'

"### undo persistence
if has('persistent_undo')
    set undodir=~/.vim/vimundo
    set undofile
endif
"}}}

"### plugins {{{
call plug#begin('~/.vim/plugged')
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-goimports'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'Shougo/vimfiler'
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'cohama/lexima.vim'
call plug#end()
"}}}

"### asyncomplete {{{
let g:asyncomplete_auto_popup = 0
let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_popup_delay = 200

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'whitelist': ['*'],
    \ 'blacklist': ['go'],
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ 'config': {
    \    'max_buffer_size': 5000000,
    \  },
    \ }))
"}}}

"### cmdline-window {{{
nnoremap <sid>(command-line-enter) q:
xnoremap <sid>(command-line-enter) q:
nnoremap <sid>(command-line-norange) q:<C-u>
nmap : <sid>(command-line-enter)
xmap : <sid>(command-line-enter)

autocmd CmdwinEnter * call s:init_cmdwin()

function! s:init_cmdwin()

    nnoremap <buffer><silent> q :<C-u>quit<CR>
    nnoremap <buffer><silent> <TAB> :<C-u>quit<CR>

    inoremap <buffer><expr><CR> asyncomplete#close_popup()."\<CR>"
    inoremap <buffer><expr><C-h> col('.') == 1 ? "\<ESC>:quit\<CR>" : asyncomplete#cancel_popup()."\<C-h>"
    inoremap <buffer><expr><BS> col('.') == 1 ? "\<ESC>:quit\<CR>" : asyncomplete#cancel_popup()."\<C-h>"

    " Completion.
    inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ asyncomplete#force_refresh()
    
    startinsert!
endfunction
"}}}

"### Unite {{{
let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable  = 1
let g:unite_source_file_mru_limit  =  200
let g:unite_source_directory_mru_limit  =  200
let g:unite_source_grep_max_candidates = 200
noremap <C-l> :Unite buffer file directory file/new file_mru directory_mru<CR>
"}}}

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

"### vim-lsp {{{
if empty(globpath(&rtp, 'autoload/lsp.vim'))
  finish
endif

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <f2> <plug>(lsp-rename)
  nmap <silent> <Leader>d :LspTypeDefinition<CR>
  nmap <silent> <Leader>r :LspReferences<CR>
  nmap <silent> <Leader>i :LspImplementation<CR>
  inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
"command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_text_edit_enabled = 1
let g:lsp_signs_error = {'text': '💩'}
let g:lsp_signs_warning = {'text': '🤔'}
let g:lsp_signs_information = {'text': '📖'}
let g:lsp_signs_hint = {'text': '💡'}
" }}}

"### vim-terraform {{{
let g:terraform_align = 1
let g:terraform_fmt_on_save = 1
" }}}

""### airline theme {{{
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline_theme ='molokai'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_highlighting_cache = 1

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
" }}}
