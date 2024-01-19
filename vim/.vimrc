" Relative line numbers, to jump with [n]j, [n]k.
set number
set relativenumber

" Highlight current line (ugly in some terminals/colorschemes).
set cursorline

" Set maximum text width. This is for the auto format option.
set textwidth=79

" Show vertical columns after `textwidth` (normal and python).
set colorcolumn=+1,+10

" Auto format code comments only. See `:h fo-table`.
set formatoptions+=acjroql
set formatoptions-=t

" Turn on file type detection and related stuff. See :h filetype-overview.
filetype plugin on
filetype indent on

" Add vertical padding for the cursor.
set scrolloff=5

" Turn on wild menu.
set wildmenu

" Hidden buffers by default. This allows switching buffers freely.
set hidden

" Ignore case, unless the search pattern contains an upper case character. Not
" used for "*" and "#" though, see :h smartcase.
set ignorecase
set smartcase

" Highlight search results.
set hlsearch

" Highlight matching bracket when cursor is on top.
set showmatch

" Blink duration of brackets when cursor moves on it.
set matchtime=1

" Disable the `matchparen` plugin.
let loaded_matchparen = 1

" Reserve a column for the side fold indicator.
set foldcolumn=1

" Turn on syntax highlighting.
syntax enable

" Set utf8 encoding.
set encoding=utf8

" Save swap files in a separate directory, to avoid messing with git. The
" reason for using the home directory is because whenever a recovery situation
" occurs, the swap files will be in the most visible path instead of scattered
" around multiple paths. For context, this was very useful back in 2009 with an
" unreliable computer. See :h 'directory' for the meaning of "//".
set directory=$HOME//

" Disable auto read. Buffers better have a single source of truth.
set noautoread

" Use spaces for indentation instead of a tab character.
set expandtab

" In insert mode the <Tab> and <BS> keys will indent and outdent, respectively.
set smarttab

" Indent with 4 space characters (combo with 'expandtab' and 'smarttab').
set shiftwidth=4
" But 2 spaces for web files.
autocmd BufEnter *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html :set shiftwidth=2

" Use same indentation as previous line. Mostly for regular text.
set autoindent

" Code indentation. Consider using 'cindent' when working with c code.
set smartindent

" Horizontal scrolling is uncomfortable. This does not change the buffer.
set wrap

" Disable search highlighting. Useful after a search.
map <leader><CR> :noh<CR>

" Shortcuts to work with buffers.
map <leader>j :bnext<CR>
map <leader>k :bprevious<CR>
map <leader>l :ls<CR>

" Restore cursor position after reading any file. See :h restore-cursor. This
" works thanks to the viminfo file, which saves the `" register.
autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif

" Always show the status line.
set laststatus=2

" Status line with useful information. Notice the "\" to scape characters.
set statusline=\ %t%m%r%h\ %y\ \|\ Buffer:\ %n\ \|\ Line:\ %l\ of\ %L\ --%p%%--\ \|\ Column:\ %c\ of\ %{col('$')-1}

" Delete trailing white space on save.
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun
autocmd BufWritePre * :call CleanExtraSpaces()

" Turn on spell check. Requires slightly more memory but shouldn't be a problem
" these days. See :h spell.
set spell
set spelllang=en_us
" Command to toggle spell check on a buffer. Because sometimes spell
" highlighting is distracting.
map <leader>s :setlocal spell!<CR>

" A reduced brightness built-in theme. Another option: `slate`.
colorscheme habamax
