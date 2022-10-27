" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Dec 17
"
" To use it, copy it to
"				 for Unix:  ~/.vimrc
"				for Amiga:  s:.vimrc
"	 for MS-Windows:  $VIM\_vimrc
"				for Haiku:  ~/config/settings/vim/vimrc
"			for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  let &directory = expand('~/.vimdata/swap//')

  set backup
  let &backupdir = expand('~/.vimdata/backup//')

  let &undodir = expand('~/.vimdata/undo//')
  set backup		" keep a backup file (restore to previous version)

  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
    let &undodir = expand('~/.vimdata/undo//')
  endif

  if !isdirectory(&undodir) | call mkdir(&undodir, "p") | endif
  if !isdirectory(&backupdir) | call mkdir(&backupdir, "p") | endif
  if !isdirectory(&directory) | call mkdir(&directory, "p") | endif

  " Source: https://vi.stackexchange.com/a/21709

endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=80
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif


" my configs

" PLUGINS ---------------------------------------------------------------- {{{

" Plugin code goes here.

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

call plug#end()

" }}}


" MAPPINGS --------------------------------------------------------------- {{{

" Mappings code goes here.

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

set number			
set nocp
set cursorline			" horizontal line indicating the current line
set shiftwidth=2
set tabstop=2
set expandtab				" use spaces instead of tabs
set incsearch
set smartcase				" search for terms with capitals letters if
										" the search term has capital letters
set wildmenu				" enable autocompletion using tabs


syntax on

filetype indent on
filetype plugin on

" }}}


" STATUS LINE ------------------------------------------------------------ {{{

" Status bar code goes here.

" }}}

