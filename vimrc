""" Appearance """

set t_Co=256
set background=dark
set cursorline
unlet! g:zenburn_high_Contrast
unlet! g:zenburn_alternate_Visual
unlet! g:zenburn_alternate_Error
let g:zenburn_alternate_Include = 1
colorscheme zenburn


""" Behavior """

syntax on " use syntax highlighting
set nocompatible " don't limit to vi-compatible features
set incsearch " search as you type
set ignorecase " case insensitive search
set hidden " allow using multiple buffers
set linebreak " wrap long lines
set showbreak=> " show line wrapping with a > character
set tags=tags " specify tag file name
set smarttab
set scrolloff=3 " set a margin of lines when scrolling
set virtualedit=block " free roaming cursor in block mode

" do tab completion for file names more like bash
set wildmode=longest,list,full
set wildmenu
set wildignore+=*.pyc,*.pyo,.svn,.git,.bzr,*.o,*~

" status line
set laststatus=2 " always show status line
set statusline=
set statusline+=%< " if line overflows, truncate at start
set statusline+=%f\  " current file name
set statusline+=%h%m%r " flags: help, modified, read only
set statusline+=%= " left/right separator
set statusline+=%-14.(%l,%c%V%)\ %P " line, column, and percentage display.


""" Indentation and Syntax """

" activate pathogen, bounce indentation plugin to force reload.
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

" default indentation
set tabstop=4
set shiftwidth=4
set noexpandtab

" filetype plugin
filetype on

" file types
autocmd FileType python,javascript set ts=4 sw=4 et
autocmd FileType ruby,scala,coffee set ts=2 sw=2 et
autocmd FileType html,htmldjango,xhtml,xml,css set ts=2 sw=2 et

" remove trailing whitespace on save
function! RemoveTrailingWhitespace()
	:call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
:endfunction
autocmd FileType c,cpp,java,php,python,ruby,html,htmldjango,xhtml,xml,css,javascript 
			\autocmd BufWritePre <buffer> :call RemoveTrailingWhitespace()


""" Key Mappings (Dvorak Layout) """

" press v w to exit instead of escape
imap vw <esc>

" use d, h, t, n to move left, up, down, and right
noremap d h
noremap D H
noremap h j
noremap H J
noremap gh gj
noremap t k
"noremap T K
noremap gt gk
noremap n l
noremap N L

" reassign the keys we overwrote
noremap k d
noremap K D
noremap l t
noremap L T
noremap j n
noremap J N

" intuitive Y
noremap Y y$

" remap tag functions
noremap T <C-]>
noremap gj g]

" quick buffer switching
noremap <C-s> :b#<cr>
noremap <C-n> :bn<cr>
noremap <C-p> :bp<cr>
noremap <C-d> :BD<cr>

" unmap frequently accidental commands
nmap Q <Nop>


""" Plugins """

" use comma as leader key for custom bindings
let mapleader = ","
let g:mapleader = ","

" syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_auto_jump = 0
let g:syntastic_auto_loc_list = 1
" syntastic, jslint
let g:syntastic_jslint_conf=" --indent=4 --es5=false --white"
