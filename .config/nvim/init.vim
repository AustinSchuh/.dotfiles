" Check to see if vundle is installed.  If not, install it.
let vundle_already_installed=1
let vundle_readme=expand('~/.config/nvim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.config/nvim/bundle
  silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
  let vundle_already_installed=0
endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim/
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

" If vundle wasn't installed, install it now that all the plugins are listed.
if vundle_already_installed == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :PluginInstall
endif

filetype plugin indent on    " required

" the glaive#Install() should go after the "call vundle#end()"
call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt google_java_executable="java -jar /home/austin/bin/google-java-format-1.7-all-deps.jar"
Glaive codefmt clang_format_executable=`fnamemodify('~/bin/clang-format-auto', ':p')`

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
set showcmd             " Show (partial) command in status line.

set ignorecase          " Do case insensitive matching
set incsearch           " Incremental search
set autowrite           " Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned

"set showmatch          " Show matching brackets.
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

" These are script local in vim-codefmt/plugin/commands.vim.
" I couldn't figure out how to pass ranges into FormatCode and FormatLines.
function! s:FormatLinesAndSetRepeat(startline, endline, ...) abort
  call call('codefmt#FormatLines', [a:startline, a:endline] + a:000)
  let l:cmd = ":FormatLines " . join(a:000, ' ') . "\<CR>"
  let l:lines_formatted = a:endline - a:startline + 1
  silent! call repeat#set(l:cmd, l:lines_formatted)
endfunction

function! s:FormatBufferAndSetRepeat(...) abort
  call call('codefmt#FormatBuffer', a:000)
  let l:cmd = ":FormatCode " . join(a:000, ' ') . "\<CR>"
  silent! call repeat#set(l:cmd)
endfunction

" Call FormatCode or FormatLines depending on what the filetype is.
let g:fullformattypes = ['bzl']
function s:DoFormat(startline, endline, ...) abort
  if index(g:fullformattypes, &filetype) == -1
    call call("s:FormatLinesAndSetRepeat", [a:startline, a:endline] + a:000)
  else
    call call("s:FormatBufferAndSetRepeat", a:000)
  endif
endfunction

" Create a command so what is printed looks nice when <C-k> is pressed.
command -nargs=? -range -complete=custom,codefmt#GetSupportedFormatters Format call s:DoFormat(<line1>, <line2>, <f-args>)

map <C-k> :Format<CR>
imap <C-k> <Esc>:Format<CR>a

augroup proto_filetype
au BufRead,BufNewFile *.proto setfiletype proto
augroup end
augroup bzl_filetype
au BufRead,BufNewFile BUILD.*.bazel setfiletype bzl
augroup end

augroup ts_filetype
au BufRead,BufNewFile *.ts set filetype=typescript
augroup end

color austin
set nu

set noignorecase

augroup Binary
  au!
  au BufReadPre  *.bfbs.xz let &bin=1
  au BufReadPost *.bfbs.xz if &bin | %!xxd
  au BufReadPost *.bfbs.xz set ft=xxd | endif
  au BufWritePre *.bfbs.xz if &bin | %!xxd -r
  au BufWritePre *.bfbs.xz endif
  au BufWritePost *.bfbs.xz if &bin | %!xxd
  au BufWritePost *.bfbs.xz set nomod | endif
augroup END

" Ask instead of automatically loading new file contents
set noautoread

set mouse=

set wildmenu
set wildmode=longest:list

# Check if the file has changed ever time we start typing, or focus on the window.
au CursorHold * checktime
au FocusGained * checktime
au WinEnter * checktime
