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
Bundle 'skammer/vim-css-color'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-pastie'
Bundle 'tyru/current-func-info.vim'
Bundle 'mattn/zencoding-vim'
Bundle 'wincent/Command-T'

" Vim-Script Repos
Bundle 'vim-scripts/Auto-Pairs'
Bundle 'vim-scripts/Figlet.vim'
Bundle 'vim-scripts/Solarized'
Bundle 'vim-scripts/shell.vim--Odding'
"Bundle 'vim-scripts/vimmpc'

" non Github Repos
Bundle "git://github.com/MarcWeber/vim-addon-mw-utils.git"
Bundle "git://github.com/tomtom/tlib_vim.git"
Bundle "git://github.com/honza/snipmate-snippets.git"
Bundle "git://github.com/garbas/vim-snipmate.git"
" }}}
" DONT TOUCH {{{
filetype plugin indent on
syntax on

"}}}
" GUI OPTS {{{
if has('gui_running')
    set guicursor+=a:blinkon0       " Cursor doesn't blink - it's annoying
    set guioptions-=m               " No Menubar
    set guioptions-=T               " No Toolbar
    set guioptions-=l               " No Scrollbar left
    set guioptions-=L               " No Scrollbar left when split
    set guioptions-=r               " No Scrollbar right
    set guioptions-=r               " No Scrollbar right when split
    set gfn=Inconsolata\ 9
    set lines=40                    " Height
    set columns=85                  " Width
    "set background=dark
    "colorscheme github
    colorscheme getfresh
else
	colorscheme xdefaults
endif
" }}}
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
set background=dark   " i prefer dark backgrounds
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
" ENABLING OMNICOMPLETE {{{
set wildmenu
set wildmode=longest,full,list
set ofu=syntaxcomplete#Complete
"}}}
" NERDTree {{{
map <F3> :NERDTreeToggle<CR>
let NERDTreeChDirMode = 2
let NERDTreeShowBookmarks = 1
"}}}
" COLORIZER {{{
"let g:cssColorVimDoNotMessMyUpdateTime = 1
" }}}
" KEYBINDS {{{
inoremap <Nul> <C-x><C-o>
autocmd! BufWritePost .vimrc source %
"}}}
" STATUSLINE {{{
  " Generic Statusline {{{
  function! SetStatus()
    setl statusline+=
          \%1*\ %f
          \%H%M%R%W%7*\ ┃
          \%2*\ %Y\ <<<\ %{&ff}%7*\ ┃
  endfunction

  function! SetRightStatus()
    setl statusline+=
          \%2*\ %{cfi#get_func_name()}%7*\ ┃
          \%5*\ %{StatusFileencoding()}%7*\ ┃
          \%=%<%7*\ ┃
          \%5*\ %{fugitive#statusline()}\ %7*┃
          \%3*\ %l,%c\ >>>\ %P
          \\ 
  endfunction " }}}
  " Update when leaving Buffer {{{
  function! SetStatusLeaveBuffer()
    setl statusline=""
    call SetStatus()
  endfunction
  au BufLeave * call SetStatusLeaveBuffer() " }}}
  " Update when switching mode {{{
  function! SetStatusInsertMode(mode)
    setl statusline=%4*
    if a:mode == 'i'
      setl statusline+=\ insert\ ◥
    elseif a:mode == 'r'
      setl statusline+=\ Ersetzen\ ◥
    elseif a:mode == 'normal'
      setl statusline+=\ \ ◥
    endif
    call SetStatus()
    call SetRightStatus()
  endfunction

  au VimEnter     * call SetStatusInsertMode('normal')
  au InsertEnter  * call SetStatusInsertMode(v:insertmode)
  au InsertLeave  * call SetStatusInsertMode('normal')
  au BufEnter     * call SetStatusInsertMode('normal') " }}}
  "fileencoding (three characters only) {{{
  function! StatusFileencoding()
    if &fileencoding == ""
      if &encoding != ""
        return &encoding
      else
        return " -- "
      endif
    else
      return &fileencoding
    endif
  endfunc " }}}
" }}}
