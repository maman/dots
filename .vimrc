"#=-=-=-=-=-=-=-=-=-=-=-=-=-
"#
"#  V I M    C O N F I G 
"#
"#=-=-=-=-=-=-=-=-=-=-=-=-=-

set nocompatible
filetype off

" VUNDLE {{{
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
" Vundles
"
" Github Repos
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-pastie'
Bundle 'tyru/current-func-info.vim'
Bundle 'mattn/zencoding-vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'kien/ctrlp.vim'
Bundle 'mattn/webapi-vim'

" Vim-Script Repos
Bundle 'vim-scripts/Auto-Pairs'
Bundle 'vim-scripts/Figlet.vim'
Bundle 'vim-scripts/Solarized'
Bundle 'vim-scripts/shell.vim--Odding'
Bundle 'vim-scripts/SingleCompile'
Bundle 'vim-scripts/Gist.vim'

" non Github Repos
Bundle "git://github.com/MarcWeber/vim-addon-mw-utils.git"
Bundle "git://github.com/tomtom/tlib_vim.git"
Bundle "git://github.com/honza/snipmate-snippets.git"
Bundle "git://github.com/garbas/vim-snipmate.git"
" }}}
" DONT TOUCH {{{
filetype plugin indent on
syntax on
set autoread
set hidden
"}}}
" GUI OPTS {{{
if has('gui_running')
    set guicursor+=a:blinkon0       " Cursor doesn't blink - it's annoying
    "set guioptions-=m               " No Menubar
    set guioptions-=T               " No Toolbar
    set guioptions-=l               " No Scrollbar left
    set guioptions-=L               " No Scrollbar left when split
    set guioptions-=r               " No Scrollbar right
    set guioptions-=r               " No Scrollbar right when split
    set gfn=Menlo\ for\ Powerline\ 8
    set lines=50                    " Height
    set columns=155                  " Width
    "set background=dark
    colorscheme getfresh
    "colorscheme solarized
else
  set background=dark
	colorscheme xdefaults
endif
" VIM Powerline opts
let g:Powerline_symbols = 'fancy'
"}}}
" CUSTOMIZATIONS {{{
set title             " set title
set mouse=a           " make mouse works
set shortmess=at      " shorten error messages
set nrformats+=alpha  " in-/decrease letters with C-a/C-x
set modeline          " enable modelines
set modelines=5
set number            " enable line numbers
set ruler             " enable something
set cursorline        " enable hiliting of cursor line
set backspace=2       " backspace over EOL etc.
"set background=dark   " i prefer dark backgrounds
set hidden            " buffer switching should be quick
set confirm           " ask instead of just print errors
set equalalways       " make splits equal size
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set expandtab
set laststatus=2
set encoding=utf-8
" }}}
" FOLDING {{{
set foldmethod=marker
set foldcolumn=1
" }}}
" SEARCH OPTIONS {{{
set showmatch
set incsearch
set ignorecase
"}}}
" DISABLE TEMPFILES {{{
set nobackup
set nowb
set noswapfile
"}}}
" ENABLING COMPLETION {{{
set wildmenu
set wildmode=longest,full,list
set ofu=syntaxcomplete#Complete
"let g:acp_enableAtStartup = 0
"let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_enable_smart_case = 1

"map <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ?"\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

"inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y> neocomplcache#close_popup()
"inoremap <expr><C-e> neocomplcache#close_popup()

"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"}}}
" NERDTree {{{
map <F3> :NERDTreeToggle<CR>
let NERDTreeChDirMode = 2
let NERDTreeShowBookmarks = 1
let NERDTreeMinimalUI = 1
autocmd vimenter * if !argc() | NERDTree | endif
"}}}
" COLORIZER {{{
"let g:cssColorVimDoNotMessMyUpdateTime = 1
" }}}
" KEYBINDS {{{
inoremap <Nul> <C-x><C-o>
autocmd! BufWritePost .vimrc source %
"}}}
" SNIPMATE CONFIG {{{
let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['html'] = 'html,javascript'
" }}}
" CUSTOM SCRIPTS {{{
  function! s:ExecuteInShell(command)
  let command = join(map(split(a:command), 'expand(v:val)'))
  let winnr = bufwinnr('^' . command . '$')
  silent! execute  winnr < 0 ? 'botright new ' . fnameescape(command) : winnr . 'wincmd w'
  setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap number
  echo 'Execute ' . command . '...'
  silent! execute 'silent %!'. command
  silent! execute 'resize ' . line('$')
  silent! redraw
  silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
  silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>'
  echo 'Shell command ' . command . ' executed.'
endfunction
  command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)
"}}}
