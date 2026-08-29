" Relative line numbers, to jump with [n]j, [n]k.
set number
set relativenumber

" Highlight current line (ugly in some terminals/colorschemes).
"set cursorline

" Set maximum text width. This is for the auto format option.
set textwidth=79

" Show vertical columns after `textwidth` (normal and python).
"set colorcolumn=+1,+10

" Auto format code comments only. See `:h fo-table`.
set formatoptions+=acjroql
set formatoptions-=t

" Turn on file type detection and related stuff. See :h filetype-overview.
filetype plugin indent on

" Add vertical padding for the cursor.
set scrolloff=5

" Enable true color support in terminals if available.
if has("termguicolors")
    set termguicolors
endif

" Turn on wild menu.
set wildmenu

" Hidden buffers by default. This allows switching buffers freely.
set hidden

" Ignore case, unless the search pattern contains an upper case character.
set ignorecase
set smartcase

" Show search matches while typing and highlight results.
set incsearch
set hlsearch

" Enable matchparen highlighting (set matchtime duration).
set showmatch
set matchtime=1

" Reserve a column for the side fold indicator.
set foldcolumn=1

" Turn on syntax highlighting.
syntax enable

" Set utf8 encoding.
set encoding=utf8

" Save swap files in a separate directory, to avoid messing with git.
set directory=$HOME//

" Disable auto read. Buffers better have a single source of truth.
set noautoread

" Use spaces for indentation instead of a tab character.
set expandtab

" In insert mode the <Tab> and <BS> keys will indent and outdent, respectively.
set smarttab

" Indent with 4 space characters (combo with 'expandtab' and 'smarttab').
set shiftwidth=4
set tabstop=4
set softtabstop=4

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

" Status line with useful information.
set statusline=\ %t%m%r%h\ %y\ \|\ Buffer:\ %n\ \|\ Line:\ %l\ of\ %L\ --%p%%--\ \|\ Column:\ %c\ of\ %{col('$')-1}

" Turn on spell check. Toggle with <leader>s.
set spell
set spelllang=en_us

" Non-recursive Key Mappings
nnoremap <leader><CR> :noh<CR>
nnoremap <leader>j :bnext<CR>
nnoremap <leader>k :bprevious<CR>
nnoremap <leader>l :ls<CR>
nnoremap <leader>s :setlocal spell!<CR>

" Delete trailing white space on save.
function! CleanExtraSpaces()
    if !&binary && &filetype !=# 'diff'
        let l:save_cursor = getpos(".")
        keepjumps %s/\s\+$//e
        call setpos('.', l:save_cursor)
    endif
endfunction

" Autocommand group to prevent duplicate autocommands when re-sourcing .vimrc
augroup VimInitAutocmds
    autocmd!

    " 2 spaces indentation for web/markup files.
    autocmd FileType javascript,javascriptreact,typescript,typescriptreact,css,less,scss,json,graphql,markdown,vue,svelte,yaml,html setlocal shiftwidth=2 tabstop=2 softtabstop=2

    " Restore cursor position after reading any file. See :h restore-cursor.
    autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' | exe "normal! g`\"" | endif

    " Clean trailing whitespaces on save.
    autocmd BufWritePre * call CleanExtraSpaces()
augroup END

" Colorscheme option
colorscheme habamax
