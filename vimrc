let mapleader = " "

" enable syntax highlighting
syntax on

" theme
set t_Co=256
set background=light
if has("termguicolors")
  set termguicolors
endif

" load plugins
if $ZSH_TERM == '1'
  call plug#begin('~/.vim/plugged')
  Plug 'terryma/vim-expand-region'
  Plug 'tpope/vim-fugitive'
  call plug#end()
elseif has('nvim') && filereadable(expand("~/.vimrc.plugins"))
  source ~/.vimrc.plugins
endif

" required to detect filetype
filetype plugin indent on

set shell=/bin/bash

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
set pastetoggle=<F2>  " switch paste mode
set clipboard=unnamedplus " yank to and paste the selection without prepending "*
set autowrite         " save file before switching a buffer
set autoindent        " indent
set showmatch         " highlight matching brackets
set autoread          " when file was changed
set lazyredraw        " redraw only when we need to"
set hlsearch          " highlight same words while searching with Shift + *

" line numbers
set number            " show
set numberwidth=5     " line numbers width
set number relativenumber " hybrid relative number + absolute

" make it obvious where 120 characters is
set colorcolumn=121
set textwidth=240
set formatoptions+=w " for wraping long lines without broken words

" spaces
set tabstop=2     " tab width
set shiftwidth=2  " indent size
set softtabstop=2 " simulated tab width
set expandtab     " spaces on tab press
set smartindent   " indent automatically
set shiftround    " uses shiftwidth when >, <

" map russian keyboard
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

" show whitespaces
set list listchars=tab:»·,trail:·

" removes the delay when hitting esc in insert mode
set ttimeout
set ttimeoutlen=1

" disable sound
set visualbell t_vb=

" automatically refresh changed files
set autoread

" fold method definitions
set foldenable        " enable folding
set foldlevelstart=20 " open most folds by default
set foldmethod=indent " fold based on indent level
nnoremap fo za        " folding shortcut

" coc.nvim settings:
set cmdheight=2    " give more space for displaying messages.
set updatetime=300 " having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.

if $ZSH_TERM == '1'
  set laststatus=0
  set nonumber norelativenumber
endif

" highlight trailing whitespaces
hi ExtraWhitespace ctermbg=172 guifg=#d78700
match ExtraWhitespace /\s\+$/

" make line number brighter
hi LineNr ctermfg=240 guifg=#585858

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

  " create directory if doesn't exist before saving
  autocmd BufWritePre * if !isdirectory(expand('%:h')) | call mkdir(expand('%:h'), 'p') | endif

  " highlight trailing whitespaces
  autocmd InsertLeave * hi ExtraWhitespace ctermbg=172 guifg=#d78700
  autocmd InsertEnter * hi ExtraWhitespace NONE

  if $ZSH_TERM != '1'
    " don't use relative numbers in insert more
    autocmd BufLeave,FocusLost,InsertEnter * setlocal norelativenumber
    autocmd BufEnter,FocusGained,InsertLeave * setlocal relativenumber
  endif

  autocmd FileType ruby,eruby,yaml,clojure setlocal ai sw=2 sts=2                   " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml,elixir setlocal iskeyword=@,48-57,192-255,_      " make @,numbers,latin chars,_,? part of words
  autocmd FileType markdown setlocal wrap colorcolumn=240                           " automatically wrap for Markdown
  autocmd FileType gitcommit setlocal colorcolumn=72                                " automatically wrap at 72 characters
  autocmd FileType markdown setlocal spell spelllang=ru_ru,en_us                    " enable spellchecking for Markdown messages
  autocmd FileType gitcommit setlocal spell                                         " enable spellchecking for git commit messages
  autocmd FileType css,scss,sass setlocal iskeyword+=-                              " allow stylesheets to autocomplete hyphenated words
  autocmd FileType clojure setlocal iskeyword=@,48-57,_,192-255,?,-,*,!,+,=,<,>,:,$ " customize keywords
  autocmd FileType crontab setlocal nobackup nowritebackup                          " allow to edit crontab -e
  autocmd BufWritePre *.rb,*.haml,*.coffee,*.md,*.rake,*.clj,*.js,*.jsx,*.ts,*.tsx,*.sol,*.ex :%s/\s\+$//e " remove trailing whitespaces

  " Rebuild ctags async on entering the insert mode for the first time
  autocmd InsertEnter *.rb if !exists('b:has_been_entered_rb')
    \| let b:has_been_entered_rb = 1
    \| execute ":!(cp tags tags_tmp 2>/dev/null || :) && gem ctags >/dev/null && fd --type file --extension rb --print0 | xargs -0 ripper-tags --extra=q -R -a -f tags_tmp && mv tags_tmp tags &"
    \| endif
  autocmd InsertEnter *.js,*.jsx,*.ts,*.tsx if !exists('b:has_been_entered_js')
    \| let b:has_been_entered_js = 1
    \| execute ":!(cp tags tags_tmp 2>/dev/null || :) && fd --type file --extension js --extension jsx --extension ts --extension tsx --print0 | xargs -0 ctags -R -a -f tags_tmp && mv tags_tmp tags &"
    \| endif
  autocmd InsertEnter *.ex,*.exs,*.eex if !exists('b:has_been_entered_ex')
    \| let b:has_been_entered_ex = 1
    \| execute ":!(cp tags tags_tmp 2>/dev/null || :) && fd --type file --extension ex --extension exs --print0 | xargs -0 ctags -R -a -f tags_tmp && mv tags_tmp tags &"
    \| endif

  " debugger
  autocmd BufRead *.rb nnoremap <A-p> Orequire 'pry'; binding.pry<Esc>
    \| nnoremap <Leader>d :call JumpToRubyDefinition()<CR>
  autocmd BufRead *.js,*.jsx,*.ts,*.tsx nnoremap <A-p> Odebugger;<Esc>
  autocmd BufRead *.ex,*.exs,*.eex nnoremap <A-p> Orequire IEx; IEx.pry<Esc>

  " format
  autocmd FileType xml,html nnoremap <buffer> ff :%!xmllint --format --encode UTF-8 -<CR>
  autocmd FileType xml,json,javascriptreact,typescriptreact vmap <buffer> ff :%!tidy -q -i -w 0 -xml --show-errors 0<CR>
  autocmd FileType json nnoremap <buffer> ff :%! cat % \| ruby -e "require 'json'; puts JSON.pretty_generate(JSON.parse(STDIN.read))"<CR>
augroup END

function! JumpToRubyDefinition()
  " Copy the whole word with "::" namespace delimiters
  setlocal iskeyword+=:
  setlocal iskeyword+=?
  setlocal iskeyword+=!
  normal yiw
  setlocal iskeyword-=:
  setlocal iskeyword-=?
  setlocal iskeyword-=!
  " Replace prepending "::" and "!
  let l:word = substitute(substitute(@", "^::", "", ""), "^!", "", "")
  " Jump to ctag definition
  execute ":ltag " . word
endfunction

" jump to method or function definition with ctags
nnoremap <Leader>d <C-]>

" wrap long lines
nnoremap wl gggqG

" redraw vim
nnoremap rr :so $MYVIMRC \| checktime<CR>

" replace text in a project with sed
nnoremap <Leader>re :!fd --type file --extension jsx --print0 \| xargs -0 sed -i '' 's,search,replace,g'
nnoremap re :%s,search,replace,gc

" Clear current search highlight by double tapping //
nnoremap // :noh<CR>

" switch to Russian keyboard
inoremap <A-c> <C-^>

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

" max / min tab size
nnoremap ƒ :tabedit %<CR>
nnoremap Ï :tabclose<CR>

" visual blockwise selection
nnoremap <A-v> <C-v>

" move line up / down with Ctrl + j / k
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" jump up and down
nnoremap <A-d> <C-d>
nnoremap <A-u> <C-u>

" undo
nnoremap <A-r> <C-r>

" copy relative filepath
nnoremap cP :let @+=expand("%")<CR>
" copy relative filetype with line
nnoremap cLP :let @+=expand("%") . ':' . line(".")<CR>
" copy full filepath
nnoremap cFP :let @+=expand("%:p")<CR>

" navigating between buffers
nnoremap <A-w> :bd<CR>
nnoremap <A-q> :bd!<CR>
nnoremap <A-]> :bn<CR>
nnoremap <A-[> :bp<CR>

" save file with Alt + s
" note that remapping C-s requires flow control to be disabled, e.g. in .bashrc or .zshrc
noremap <A-s> <esc>:w<CR>
inoremap <A-s> <esc>:w<CR>

" save file and exit
nnoremap <Leader>wq :wq<CR>

" don't save and exit
nnoremap <Leader>cq :cq<CR>

" cut content to new buffer
vnoremap <Leader>x x :w \| :enew<CR>pGE :w<Space>

" saveas with :S filepath
command! -nargs=1 -complete=file S :saveas <args>

" change without yanking
nnoremap c "_c
vnoremap c "_c

" delete / replace currently selected text with default register without yanking it
vnoremap p "_dP
vnoremap d "_d

" delete line / word / end of line without yanking (copying) it
nnoremap dd "_dd
nnoremap de "_de
nnoremap D "_D

" Enter visual mode in terminal
tnoremap <Esc> <C-\><C-n>
" Still allow exiting fzf screen with Esc
autocmd FileType fzf tnoremap <buffer> <esc> <c-c>
" Enter insert mode automatically
if has('nvim')
  autocmd TermOpen * startinsert
endif

" setup undodir if +persistent_undo option included
if has('persistent_undo') && isdirectory($HOME . '/.vim/undo')
  set undodir=~/.vim/undo
  set undofile
end

" use ripgrep
if executable('rg')
  set grepprg=rg\ --vimgrep " use rg over grep
endif

" open large files > 10 MB
let g:LargeFile = 10 * 1024 * 1024
augroup LargeFile
  " files with filesize too large are recognized too (getfsize = -2)
  autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END
function! LargeFile()
  setlocal eventignore+=FileType " no syntax highlighting etc
  setlocal bufhidden=unload " save memory when other file is viewed
  setlocal undolevels=-1 " no undo possible
  setlocal foldmethod=manual
  setlocal noswapfile
endfunction

" show list of all filetypes
function! SortUnique(list, ...)
  let dictionary = {}
  for i in a:list
    let dictionary[string(i)] = i
  endfor
  if ( exists( 'a:1' ) )
    let result = sort( values( dictionary ), a:1 )
  else
    let result = sort( values( dictionary ) )
  endif
  return result
endfunction
command! Filetypes execute "echo
      \ join(
        \ SortUnique(
          \ map(
            \ split(
              \ globpath(&rtp, 'ftplugin/*.vim') . globpath(&rtp, 'syntax/*.vim'),
              \ '\n'),
            \ \"fnamemodify(v:val, ':t:r')\")),
        \'\n')"
