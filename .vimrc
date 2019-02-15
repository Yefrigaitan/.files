
set nocompatible

" line numbers, syntax, and plugins
set number
syntax on
filetype plugin on

" FINDING FILES 
set path+=**


" Display all matching files 
set wildmenu

set background=dark
colorscheme palenight

set t_Co=256


if (empty($TMUX))
  if (has("nvim"))

    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif

  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Italics for my favorite color scheme
let g:palenight_terminal_italics=1

" FILE BROWSING:

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings

" TAG JUMPING:

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" When coding, auto-indent by 4 spaces
set shiftwidth=4


" Always replace tab with 8 spaces, except for makefiles
set expandtab
autocmd FileType make setlocal noexpandtab

" My settings when editing *.txt files
"   - automatically indent lines according to previous lines
"   - replace tab with 8 spaces
"   - when I hit tab key, move 2 spaces instead of 8
"   - wrap text if I go longer than 76 columns
"   - check spelling
autocmd FileType text setlocal autoindent expandtab softtabstop=2 textwidth=76 spell spelllang=en_us

" Don't do spell-checking on Vim help files
autocmd FileType help setlocal nospell

" Prepend ~/.backup to backupdir so that Vim will look for that directory
" before littering the current dir with backups.
 " You need to do "mkdir ~/.backup" for this to work.
 set backupdir^=~/.backup

" " Also use ~/.backup for swap files. The trailing // tells Vim to
" incorporate full path into swap file names.
set dir^=~/.backup//

" Ignore case when searching
" - override this setting by tacking on \c or \C to your search term to make
"   your search always case-insensitive or case-sensitive, respectively.
set ignorecase

set smartindent
set autoindent
