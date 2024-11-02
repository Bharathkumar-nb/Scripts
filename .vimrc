filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set number
set relativenumber

set showcmd
set showmode
" Show file stats
set ruler

set backspace=indent,eol,start

" Status bar
set laststatus=2

" enable syntax processing
syntax enable 

" highlight matching [{()}]
set showmatch

" highlight matches
set hlsearch

colorscheme desert


" ---------- Plugins settings --------------
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'morhetz/gruvbox'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
colorscheme gruvbox             " Set the colorscheme
set background=dark             " Set the background to dark
filetype plugin indent on       " Enable filetype detection, plugins, and indenting
set t_Co=256                    " Enable 256 colors
set showmatch                           " show matching braces
set cursorline                  " highlight cursor line
set tabstop=8                   " set tabstop to 8
set shiftwidth=4                " set shiftwidth to 4
set softtabstop=4               " set softtabstop to 4
set smarttab                    " set smarttab
set noexpandtab                 " set noexpandtab
set number                      " set line numbers
set relativenumber              " set relative line numbers
set autoindent                  " set autoindent
set smartindent                 " set smartindent
set laststatus=2                " set laststatus to 2
set title                       " set title
set ruler                       " set ruler
set showcmd                     " set showcmd
set hls                         " set hls
set shortmess-=S                " Show count of search matches
set backspace=indent,eol,start  " backspace through everything in insert mode
autocmd BufNewFile,BufReadPost *.ut set filetype=cpp " set filetype to cpp for .ut files
syntax on                       " enable syntax highlighting
"colorscheme desert
nmap <c-s-t> :vs<bar>:b#<CR>        " Ctrl+Shift+T to switch between buffers
set enc=utf-8                   " set UTF-8 encoding
set fenc=utf-8                  " set UTF-8 encoding
set termencoding=utf-8          " set UTF-8 encoding
set mouse=a                     " enable mouse use in vim
"set list                       " to show extra tabs, whitespaces
set lazyredraw                  " enable lazyredraw
"set cursorline                 " highlight cursor line
set ttyfast                     " enable fast terminal connection

" Fix home/end key in all modes
map <esc>[H <home>
cmap <esc>[H <home>
imap <esc>[H <home>
map <esc>[F <end>
cmap <esc>[F <end>
imap <esc>[F <end>

:inoremap <C-H> <C-\><C-O>b     " Ctrl-H to move to beginning of word
:inoremap <C-L> <C-\><C-O>w     " Ctrl-L to move to end of word


" Mouse works on large screens in 'sgr' mode
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

" ------------Auto Highlight Settings -----------
" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction

" ---------Useful Key Mappings ------------------
nnoremap <leader>s :source $MYVIMRC<CR>|         " reload .vimrc
filetype on

" Function to disable Copilot
function! DisableCopilot()
  " Check if Copilot is installed
  if exists(':Copilot')
    Copilot disable
  endif
endfunction

" --------Toggle relative or absolute number lines-----------
function! NumberToggle()
    if(&relativenumber == 1)
        set nonumber norelativenumber
        set number
    else
        set nonumber
        set number relativenumber
    endif
endfunction

nnoremap <C-n> :call NumberToggle()<CR>
