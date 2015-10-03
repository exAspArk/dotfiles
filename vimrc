set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-commentary'         " comments
Plugin 'tpope/vim-repeat'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Valloric/YouCompleteMe'       " autocomplete
Plugin 'jiangmiao/auto-pairs'         " closing brackets

" sessions
Plugin 'xolox/vim-session'
Plugin 'vim-misc'

" navigation
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'

" search
Plugin 'mileszs/ack.vim'

" theme
Plugin 'w0ng/vim-hybrid'
Plugin 'bling/vim-airline'

" files
Plugin 'tpope/vim-eunuch'

" git
Plugin 'tpope/vim-fugitive'

" ruby / rails
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-endwise'

" slim
Plugin 'slim-template/vim-slim'

" coffee
Plugin 'kchmck/vim-coffee-script'

" markdown
Plugin 'suan/vim-instant-markdown'

call vundle#end()

syntax on
filetype on
filetype plugin indent on
filetype plugin on

set backspace=2
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set history=500   " Sets how many lines of history VIM has to remember

" status line
set statusline=%f\ %=col:%2c\ line:%2l

" don't wrap long lines
set nowrap

" enhanced command completion
set wildmenu

set ignorecase
set smartcase

set nopaste

set clipboard=unnamed

" save file before switching a buffer
set autowrite

" remove trailing whitespaces
autocmd BufWritePre *.rb :%s/\s\+$//e

" Make it obvious where 100 characters is
set textwidth=100
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" theme
set t_Co=256
color hybrid

" russian keyboard
set langmap=!\\"№\\;%?*ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;!@#$%&*`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

set list listchars=tab:»·,trail:·,nbsp:·

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

let mapleader = " "

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" open nerdtree
map <leader><leader> :NERDTreeToggle<CR>
" open current file's path
map <leader>c :NERDTreeFind<CR>

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

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  let g:ackprg = 'ag --vimgrep'
endif

let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_comments = 1

let g:airline#extensions#tabline#enabled = 1

let g:multi_cursor_start_key='<C-n>'
let g:multi_cursor_start_word_key='g<C-n>'
