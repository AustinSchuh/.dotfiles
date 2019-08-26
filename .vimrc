" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
runtime! /usr/share/vim/vimcurrent/syntax/syntax.vim
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
" set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules according to the
" detected filetype. Per default Debian Vim only load filetype specific
" plugins.
if has("autocmd")
  filetype indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.

set ignorecase		" Do case insensitive matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned

"set showmatch		" Show matching brackets.
let loaded_matchparen = 1

set nobackup
" Set how much a tab is worth and how much to move the code over when you auto indent.
set tabstop=8
set shiftwidth=2
set expandtab

set t_Co=256

" Set the fold mode to be syntax based
set fdm=syntax
" Set the default fold level to be from the 100th deep and on.
"  This effectively starts all you code out uncollapsed.
set foldlevel=100

set modeline
set hlsearch

au FileType python setl sw=4 sts=4 et
au BufRead,BufNewFile BUILD setfiletype python

augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
augroup end

map <C-k> :pyf /usr/share/vim/addons/syntax/clang-format-3.8.py<CR>
imap <C-k> :pyf /usr/share/vim/addons/syntax/clang-format-3.8.py<CR>i
