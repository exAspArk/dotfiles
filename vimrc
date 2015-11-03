set nocompatible                  " required by Vundle
filetype off                      " required by Vundle
set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize

call vundle#begin() " required by Vundle

Plugin 'VundleVim/Vundle.vim'         " let Vundle manage Vundle, required

" text editing
Plugin 'tpope/vim-surround'           " better brackets
Plugin 'scrooloose/syntastic'         " check syntax
Plugin 'tpope/vim-commentary'         " comments
Plugin 'tpope/vim-repeat'             " repeat more commands with '.'
Plugin 'terryma/vim-multiple-cursors' " multiple cursors like in ST
Plugin 'Valloric/YouCompleteMe'       " autocomplete
Plugin 'jiangmiao/auto-pairs'         " closing brackets

" navigation
Plugin 'scrooloose/nerdtree'          " file tree
Plugin 'ctrlpvim/ctrlp.vim'           " fuzzy search
Plugin 'mileszs/ack.vim'              " faster text search
Plugin 'jlanzarotta/bufexplorer'      " buffer explorer

" theme
Plugin 'w0ng/vim-hybrid'              " theme
Plugin 'bling/vim-airline'            " status line

" files
Plugin 'tpope/vim-eunuch'             " helpers for UNIX shell commands (mkdir, rename, etc.)

" git
Plugin 'tpope/vim-fugitive'           " git commands

" ruby / rails
Plugin 'vim-ruby/vim-ruby'            " ruby 
Plugin 'tpope/vim-rails'              " helpers for Rails
Plugin 'tpope/vim-bundler'            " bundle commands and tags
Plugin 'tpope/vim-endwise'            " auto end keyword
Plugin 'thoughtbot/vim-rspec'         " run rspec

" syntaxes and languages
Plugin 'slim-template/vim-slim'       " slim
Plugin 'kchmck/vim-coffee-script'     " coffe script
Plugin 'suan/vim-instant-markdown'    " real time markdown editing

call vundle#end() " required by Vundle

filetype plugin indent on " required to detect filetype
syntax on                 " enable syntax highlighting

" theme
set t_Co=256
color hybrid

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
set ignorecase        " ingore case
set nopaste           " enable formatting while pasting
set clipboard=unnamed " yank to and paste the selection without prepending "*
set autowrite         " save file before switching a buffer
set autoindent        " indent
set showmatch         " highlight matching [{()}]
set autoread          " when file was changed
set lazyredraw        " redraw only when we need to"


" line numbers
set number            " show
set numberwidth=5     " line numbers width

" make it obvious where 100 characters is
set textwidth=100
set colorcolumn=+1

" softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" map russian keyboard
set langmap=!\\"№\\;%?*ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;!@#$%&*`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

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
  
  autocmd FileType ruby,eruby,yaml setlocal ai sw=2 sts=2 " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml setlocal iskeyword+=?  " make ?s part of words
  autocmd FileType markdown setlocal textwidth=80         " automatically wrap at 80 characters for Markdown
  autocmd FileType gitcommit setlocal textwidth=72        " automatically wrap at 72 characters
  autocmd FileType markdown,gitcommit setlocal spell      " enable spellchecking for Markdown and git commit messages
  autocmd FileType css,scss,sass setlocal iskeyword+=-    " allow stylesheets to autocomplete hyphenated words
  autocmd BufWritePre *.rb,*.coffee,*.yml :%s/\s\+$//e    " remove trailing whitespaces
augroup END

let mapleader = " "

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

" open nerdtree
map <leader><leader> :NERDTreeToggle<CR>
" open current file's path
map <leader>c :NERDTreeFind<CR>

map ∫ :ToggleBufExplorer<CR>

" move line up / down
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" copy relative filepath
nnoremap cp :let @+ = expand("%")<CR>
" copy full filepath
nnoremap cP :let @+ = expand("%:p")<CR>

" navigating between buffers
nnoremap ‘ :bn<CR>
nnoremap “ :bp<CR>
nnoremap ∑ :bd<CR>

" search
nnoremap <C-f> "_:Ack 

" format xml
nnoremap fx :%!xmllint --format --encode UTF-8 -<CR>
" format json
nnoremap fj :%!python -m json.tool<CR>

" vim-rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" note that remapping C-s requires flow control to be disabled, e.g. in .bashrc or .zshrc
map ß <esc>:w<CR>
imap ß <esc>:w<CR>

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
  " use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
  " ag is fast enough that CtrlP doesn't need to cache or not :)
  let g:ctrlp_use_caching = 1

  let g:ackprg = 'ag --vimgrep'
endif

" autocomplete
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_comments = 1

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb' " order matching files top to bottom
let g:ctrlp_switch_buffer = 0                 " always open files in new buffers
let g:ctrlp_working_path_mode = 0             " lets us change the working directory during a Vim session and make CtrlP respect that change

" status line
let g:airline#extensions#tabline#enabled = 1

" multiple cursors
let g:multi_cursor_start_key='<C-n>'
let g:multi_cursor_start_word_key='g<C-n>'

" markdown preview
let g:instant_markdown_slow = 1

" rspec command
let g:rspec_command = "!sr {spec}"
