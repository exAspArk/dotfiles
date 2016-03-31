let mapleader = " "

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on " required to detect filetype
syntax on                 " enable syntax highlighting

" theme
set t_Co=256

" status line
set statusline=%f\ %=col:%2c\ line:%2l

set backspace=2       " make backspace work like most other apps
set noswapfile        " don't swap buffer to file
set ruler             " show the cursor position all the time
set showcmd           " display incomplete commands
set incsearch         " do incremental searching
set laststatus=2      " always display the status line
set history=500       " sets how many lines of history VIM has to remember
set nowrap            " don't wrap long lines
set wildmenu          " visual autocomplete for command menu
set ignorecase        " /the would find 'the' or 'The', add \C if you want 'the' only
set smartcase         " while /The would find only 'The' etc. 
set nopaste           " enable formatting while pasting
set clipboard=unnamed " yank to and paste the selection without prepending "*
set autowrite         " save file before switching a buffer
set autoindent        " indent
set showmatch         " highlight matching brackets
set autoread          " when file was changed
set lazyredraw        " redraw only when we need to"
set hlsearch          " highlight same words while searching with Shift + *

" line numbers
set number            " show
set numberwidth=5     " line numbers width

" make it obvious where 100 characters is
set textwidth=120
set colorcolumn=+1

" softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" map russian keyboard
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

" show whitespaces
set list listchars=tab:»·,trail:·

" removes the delay when hitting esc in insert mode
set ttimeout
set ttimeoutlen=1

augroup vimrcEx
  " clears all the autocmd's for the current group
  autocmd! 
  
  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
  
  autocmd FileType ruby,eruby,yaml,clojure setlocal ai sw=2 sts=2                   " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml setlocal iskeyword+=?                            " make ?s part of words
  autocmd FileType markdown setlocal wrap                                           " automatically wrap for Markdown
  autocmd FileType gitcommit setlocal textwidth=72                                  " automatically wrap at 72 characters
  autocmd FileType markdown setlocal spell spelllang=ru_ru,en_us                    " enable spellchecking for Markdown messages
  autocmd FileType gitcommit setlocal spell                                         " enable spellchecking for git commit messages
  autocmd FileType css,scss,sass setlocal iskeyword+=-                              " allow stylesheets to autocomplete hyphenated words
  autocmd FileType clojure setlocal iskeyword=@,48-57,_,192-255,?,-,*,!,+,=,<,>,:,$ " customize keywords
  autocmd BufWritePre *.rb,*.coffee,*.yml,*.md,*.rake,*.clj :%s/\s\+$//e            " remove trailing whitespaces
augroup END

" Build ctags by using 'gem-ctags' gem
nnoremap tt :!ctags -R<CR>

" redraw vim
nnoremap rr :redraw!<CR>

" Clear current search highlight by double tapping //
nnoremap // :noh<CR>

" switch to Russian keyboard
inoremap <C-c> <C-^>

" get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" highlight last inserted text
nnoremap gV `[v`]

" move line up / down with Alt + j / k
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" copy relative filepath
nnoremap cP :let @+ = expand("%")<CR>
" copy full filepath
nnoremap cFP :let @+ = expand("%:p")<CR>

" navigating between buffers with Alt + ] / [ / w
nnoremap ‘ :bn<CR>
nnoremap “ :bp<CR>
nnoremap ∑ :bd<CR>

" format xml
nnoremap fx :%!xmllint --format --encode UTF-8 -<CR>
" format json
nnoremap fj :%!python -m json.tool<CR>

" save file with Alt + s
" note that remapping C-s requires flow control to be disabled, e.g. in .bashrc or .zshrc
map ß <esc>:w<CR>
imap ß <esc>:w<CR>
"
" change without yanking
nnoremap c "_c
vnoremap c "_c

" replace currently selected text with default register without yanking it
vnoremap p "_dP

" add binding.pry line
nnoremap <Leader>p Orequire 'pry'; binding.pry<Esc>

" open large files > 10 MB
let g:LargeFile = 10 * 1024 * 1024
augroup LargeFile 
  " files with filesize too large are recognized too (getfsize = -2)
  autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END
function LargeFile()
  set eventignore+=FileType " no syntax highlighting etc
  setlocal bufhidden=unload " save memory when other file is viewed
  setlocal buftype=nowrite " is read-only (write with :w new_filename)
  setlocal undolevels=-1 " no undo possible
  setlocal foldmethod=manual
  setlocal noswapfile
endfunction

" create dir for new file
function s:MKDir(...)
  if         !a:0 
        \|| isdirectory(a:1)
        \|| filereadable(a:1)
        \|| isdirectory(fnamemodify(a:1, ':p:h'))
    return
  endif
  return mkdir(fnamemodify(a:1, ':p:h'), 'p')
endfunction
command -bang -bar -nargs=? -complete=file E :call s:MKDir(<f-args>) | e<bang> <args>

" use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
endif
