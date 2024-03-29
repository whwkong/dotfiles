" vim needs a more POSIX compatible shell than fish to work
" see github.com/dag/vim-fish
"
" :source ~/.vimrc  - reload .vimrc
if &shell =~# 'fish$'
    set shell=sh
endif

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" https://stackoverflow.com/questions/2287440/how-to-do-case-insensitive-search-in-vim
set ignorecase
set smartcase  "only usable if ignorecase is set

if has("vms")
  set nobackup      " do not keep a backup file, use versions instead
else
  set backup        " keep a backup file (restore to previous version)
  set undofile      " keep an undo file (undo changes after closing)
endif
set history=50      " keep 50 lines of command line history
set ruler           " show the cursor position all the time
set showcmd         " display incomplete commands
set incsearch       " do incremental searching
set showmode        " displays mode
set splitbelow      " split panes to bottom and right
set splitright
set autoread        " reloads changed files

" MacVim; yank now works with system clipboard. No need to prefix '"+'
set clipboard=unnamed

" set ag as default search tool
let g:ackprg = 'ag --nogroup --nocolor --column'

" Shift-enter inserts <CR>; <S-Enter> does not work on Mac.
nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>k

nnoremap o o<Esc>
nnoremap O O<Esc>

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes all changes to line.  CTRL-G u starts a new
" change as far as undo is concerned.
inoremap <C-U> <C-G>u<C-U>
inoremap <c-w> <c-g>u<c-w> 

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  " Set 2-space YAML as the default with carriage return after colon
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  augroup END

else

  set autoindent        " always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif

" Always wrap long lines;
set wrap
" Wrap around search
set wrapscan

" set line numbers
set number

" use syntax enable rather than 'on' for vim-fish
syntax enable
set tabstop=4 shiftwidth=4 expandtab

" highlight search
" set hlsearch

" ignore case as default
set ic
" set incremental search
set is
" enable mouse
set mouse=a

set laststatus=2

set pastetoggle=<F2>

" amazing vim trick; works with tmux as well.
" see : https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" more on statuslines: see: http://got-ravings.blogspot.ca/search/label/statuslines
" below from : https://github.com/sk1418/myConf/blob/master/common/.vimrc
"-------[ Status bar ]------------------------------------❱----{{{1

set statusline =%7*[%n]%*
set statusline +=%1*%F\ %*%8*%m%r%*%1*%h%w%* "filename
set statusline +=%7*\|%*
set statusline+=%2*\ %Y: "filetype
set statusline+=%{&ff}:  "dos/unix
set statusline+=%{&fenc!=''?&fenc:&enc}\ %* "encoding

" vim plugin
" see: https://github.com/junegunn/vim-plug
" use :PlugInstall to install plugins :)
"
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
" A small sensible Vim config. see: https://github.com/tpope/vim-sensible
Plug 'tpope/vim-sensible'

Plug 'vim-syntastic/syntastic'
Plug 'easymotion/vim-easymotion'
Plug 'https://github.com/tpope/vim-commentary.git'  " this isn't working :/

" Amazing color schemes :)
" Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tomasiser/vim-code-dark'  " vscode inspired dark+ scheme

Plug 'pangloss/vim-javascript'
Plug 'dag/vim-fish'

Plug 'wesQ3/vim-windowswap'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"Plug 'SirVer/ultisnips' " ultisnips is raising warnings; disable for now.
Plug 'honza/vim-snippets'
Plug 'gabrielelana/vim-markdown'

" Commenter functions
Plug 'scrooloose/nerdcommenter'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Make yanked region apparent. Must have.  (brew install vim first)
Plug 'machakann/vim-highlightedyank'

" Initialize plugin system
call plug#end()

"for vim-code-dark scheme
colorscheme codedark
"tab bar highlighting
hi TabLineSel ctermfg=Blue ctermbg=Yellow
" vim-javascript: htts://github.com/pangloss/vim-javascript
let g:javascript_plugin_jsdoc = 1
" paste with a space
let @p='a p'

" vim-syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> <leader>ww :call WindowSwap#EasyWindowSwap()<CR>

" call with :DiffSaved.  Exit diff view with :diffoff
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

