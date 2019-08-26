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

" To install vundle, run
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plugin 'google/vim-glaive'

call vundle#end()
filetype plugin indent on    " required

" the glaive#Install() should go after the "call vundle#end()"
call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
"Glaive codefmt google_java_executable="java -jar /path/to/google-java-format-VERSION-all-deps.jar"

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

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

"augroup filetype
  "au! BufRead,BufNewFile *.proto setfiletype proto
"augroup end

" TODO(austin): Handle BUILD files better.  They take :FormatCode
map <C-k> :FormatLines<CR>
imap <C-k> :FormatLines<CR>i

color default
set nu

if has('autocmd')
  augroup autoformat_settings
    autocmd!

    autocmd FileType c,cpp,proto AutoFormatBuffer clang-format
    autocmd FileType javascript AutoFormatBuffer prettier
    autocmd FileType go AutoFormatBuffer gofmt
    autocmd FileType java AutoFormatBuffer google-java-format
    autocmd FileType python AutoFormatBuffer yapf
  augroup END
endif
