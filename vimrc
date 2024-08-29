let mapleader = " "

" enable syntax highlighting
syntax on

" theme
set t_Co=256
set background=light
if has("termguicolors")
  set termguicolors
endif

" Custom theme https://github.com/sonph/onehalf ===============================
highlight clear
syntax reset

let g:colors_name="onehalflight"
let colors_name="onehalflight"

let s:black       = { "gui": "#383a42", "cterm": "237" }
let s:red         = { "gui": "#e45649", "cterm": "167" }
let s:green       = { "gui": "#50a14f", "cterm": "71" }
let s:yellow      = { "gui": "#c18401", "cterm": "136" }
let s:blue        = { "gui": "#0184bc", "cterm": "31" }
let s:purple      = { "gui": "#004e9c", "cterm": "127" }
let s:cyan        = { "gui": "#0997b3", "cterm": "31" }
let s:white       = { "gui": "#fafafa", "cterm": "231" }

let s:fg          = s:black
let s:bg          = s:white

let s:comment_fg  = { "gui": "#a0a1a7", "cterm": "247" }
let s:gutter_bg   = { "gui": "#fafafa", "cterm": "231" }
let s:gutter_fg   = { "gui": "#d4d4d4", "cterm": "252" }
let s:non_text    = { "gui": "#e5e5e5", "cterm": "252" }

let s:cursor_line = { "gui": "#f0f0f0", "cterm": "255" }
let s:color_col   = { "gui": "#f0f0f0", "cterm": "255" }

let s:selection   = { "gui": "#bfceff", "cterm": "153" }
let s:vertsplit   = { "gui": "#f0f0f0", "cterm": "255" }

function! s:h(group, fg, bg, attr)
  if type(a:fg) == type({})
    exec "hi " . a:group . " guifg=" . a:fg.gui . " ctermfg=" . a:fg.cterm
  else
    exec "hi " . a:group . " guifg=NONE cterm=NONE"
  endif
  if type(a:bg) == type({})
    exec "hi " . a:group . " guibg=" . a:bg.gui . " ctermbg=" . a:bg.cterm
  else
    exec "hi " . a:group . " guibg=NONE ctermbg=NONE"
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  else
    exec "hi " . a:group . " gui=NONE cterm=NONE"
  endif
endfun

" User interface colors {
call s:h("Normal", s:fg, s:bg, "")

call s:h("Cursor", s:bg, s:blue, "")
call s:h("CursorColumn", "", s:cursor_line, "")
call s:h("CursorLine", "", s:cursor_line, "")

call s:h("LineNr", s:gutter_fg, s:gutter_bg, "")
call s:h("CursorLineNr", s:fg, "", "")

call s:h("DiffAdd", s:green, "", "")
call s:h("DiffChange", s:yellow, "", "")
call s:h("DiffDelete", s:red, "", "")
call s:h("DiffText", s:blue, "", "")

call s:h("IncSearch", s:bg, s:purple, "")
call s:h("Search", s:bg, s:purple, "")

call s:h("ErrorMsg", s:fg, "", "")
call s:h("ModeMsg", s:fg, "", "")
call s:h("MoreMsg", s:fg, "", "")
call s:h("WarningMsg", s:red, "", "")
call s:h("Question", s:purple, "", "")

call s:h("Pmenu", s:fg, s:cursor_line, "")
call s:h("PmenuSel", s:bg, s:blue, "")
call s:h("PmenuSbar", "", s:cursor_line, "")
call s:h("PmenuThumb", "", s:comment_fg, "")

call s:h("SpellBad", s:red, "", "")
call s:h("SpellCap", s:yellow, "", "")
call s:h("SpellLocal", s:yellow, "", "")
call s:h("SpellRare", s:yellow, "", "")

call s:h("StatusLine", s:blue, s:cursor_line, "")
call s:h("StatusLineNC", s:comment_fg, s:cursor_line, "")
call s:h("TabLine", s:comment_fg, s:cursor_line, "")
call s:h("TabLineFill", s:comment_fg, s:cursor_line, "")
call s:h("TabLineSel", s:fg, s:bg, "")

call s:h("Visual", "", s:selection, "")
call s:h("VisualNOS", "", s:selection, "")

call s:h("ColorColumn", "", s:color_col, "")
call s:h("Conceal", s:fg, "", "")
call s:h("Directory", s:blue, "", "")
call s:h("VertSplit", s:vertsplit, s:vertsplit, "")
call s:h("Folded", s:fg, "", "")
call s:h("FoldColumn", s:fg, "", "")
call s:h("SignColumn", s:fg, "", "")

call s:h("MatchParen", s:red, "", "underline")
call s:h("SpecialKey", s:fg, "", "")
call s:h("Title", s:green, "", "")
call s:h("WildMenu", s:fg, "", "")
" }

" Syntax colors {
" Whitespace is defined in Neovim, not Vim.
" See :help hl-Whitespace and :help hl-SpecialKey
call s:h("Whitespace", s:non_text, "", "")
call s:h("NonText", s:non_text, "", "")
call s:h("Comment", s:comment_fg, "", "italic")
call s:h("Constant", s:red, "", "")
call s:h("String", s:green, "", "")
call s:h("Character", s:green, "", "")
call s:h("Number", s:red, "", "")
call s:h("Boolean", s:red, "", "")
call s:h("Float", s:red, "", "")

call s:h("Identifier", s:blue, "", "")
call s:h("Function", s:fg, "", "")
call s:h("Statement", s:purple, "", "")

call s:h("Conditional", s:purple, "", "")
call s:h("Repeat", s:purple, "", "")
call s:h("Label", s:purple, "", "")
call s:h("Operator", s:fg, "", "")
call s:h("Keyword", s:red, "", "")
call s:h("Exception", s:purple, "", "")

call s:h("PreProc", s:yellow, "", "")
call s:h("Include", s:purple, "", "")
call s:h("Define", s:purple, "", "")
call s:h("Macro", s:purple, "", "")
call s:h("PreCondit", s:yellow, "", "")

call s:h("Type", s:yellow, "", "")
call s:h("StorageClass", s:yellow, "", "")
call s:h("Structure", s:yellow, "", "")
call s:h("Typedef", s:yellow, "", "")

call s:h("Special", s:blue, "", "")
call s:h("SpecialChar", s:fg, "", "")
call s:h("Tag", s:fg, "", "")
call s:h("Delimiter", s:green, "", "")
call s:h("SpecialComment", s:comment_fg, "", "italic,bold")
call s:h("Debug", s:fg, "", "")
call s:h("Underlined", s:fg, "", "")
call s:h("Ignore", s:fg, "", "")
call s:h("Error", s:red, s:gutter_bg, "")
call s:h("Todo", s:comment_fg, "", "italic,bold")
" }

" Plugins {
" GitGutter
call s:h("GitGutterAdd", s:green, s:gutter_bg, "")
call s:h("GitGutterDelete", s:red, s:gutter_bg, "")
call s:h("GitGutterChange", s:yellow, s:gutter_bg, "")
call s:h("GitGutterChangeDelete", s:red, s:gutter_bg, "")
" Fugitive
call s:h("diffAdded", s:green, "", "")
call s:h("diffRemoved", s:red, "", "")
" }

" Git {
call s:h("gitcommitComment", s:comment_fg, "", "")
call s:h("gitcommitUnmerged", s:red, "", "")
call s:h("gitcommitOnBranch", s:fg, "", "")
call s:h("gitcommitBranch", s:purple, "", "")
call s:h("gitcommitDiscardedType", s:red, "", "")
call s:h("gitcommitSelectedType", s:green, "", "")
call s:h("gitcommitHeader", s:fg, "", "")
call s:h("gitcommitUntrackedFile", s:cyan, "", "")
call s:h("gitcommitDiscardedFile", s:red, "", "")
call s:h("gitcommitSelectedFile", s:green, "", "")
call s:h("gitcommitUnmergedFile", s:yellow, "", "")
call s:h("gitcommitFile", s:fg, "", "")
hi link gitcommitNoBranch gitcommitBranch
hi link gitcommitUntracked gitcommitComment
hi link gitcommitDiscarded gitcommitComment
hi link gitcommitSelected gitcommitComment
hi link gitcommitDiscardedArrow gitcommitDiscardedFile
hi link gitcommitSelectedArrow gitcommitSelectedFile
hi link gitcommitUnmergedArrow gitcommitUnmergedFile
" }

" Fix colors in neovim terminal buffers {
let g:terminal_color_0 = s:black.gui
let g:terminal_color_1 = s:red.gui
let g:terminal_color_2 = s:green.gui
let g:terminal_color_3 = s:yellow.gui
let g:terminal_color_4 = s:blue.gui
let g:terminal_color_5 = s:purple.gui
let g:terminal_color_6 = s:cyan.gui
let g:terminal_color_7 = s:white.gui
let g:terminal_color_8 = s:black.gui
let g:terminal_color_9 = s:red.gui
let g:terminal_color_10 = s:green.gui
let g:terminal_color_11 = s:yellow.gui
let g:terminal_color_12 = s:blue.gui
let g:terminal_color_13 = s:purple.gui
let g:terminal_color_14 = s:cyan.gui
let g:terminal_color_15 = s:white.gui
let g:terminal_color_background = s:bg.gui
let g:terminal_color_foreground = s:fg.gui
" }
" =============================================================================

" load plugins
if has('nvim') && filereadable(expand("~/.config/nvim/lua/config/lazy.lua"))
  lua require("config.lazy")

  " alternate files
  function! AltCommand(path, vim_command)
    let l:alternate = system("alt " . a:path)
    if empty(l:alternate)
      echo "No alternate file for " . a:path . " exists!"
    else
      exec a:vim_command . " " . l:alternate
    endif
  endfunction
  nnoremap <Leader>o :call AltCommand(expand('%'), ':e')<CR>
endif

set laststatus=2             " always display the status line
set colorcolumn=121          " make it obvious where 120 characters is
set listchars=tab:»·,trail:█ " show tabs and trailing whitespaces
set number relativenumber    " hybrid relative number + absolute

" highlight trailing whitespaces and tabs
autocmd BufEnter,InsertLeave * setlocal list
autocmd InsertEnter * setlocal nolist
"
" don't use relative numbers in insert more
autocmd BufEnter,FocusGained,InsertLeave * setlocal relativenumber
autocmd BufLeave,FocusLost,InsertEnter * setlocal norelativenumber

" highlight trailing whitespaces and tabs
match ExtraWhitespace /\(\s\+$\|\t\)/
hi ExtraWhitespace ctermbg=172 guifg=#d78700

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

" removes the delay when hitting esc in insert mode
set ttimeout
set ttimeoutlen=1

" disable sound
set visualbell t_vb=

" automatically refresh changed files
set autoread

" fold method definitions
set foldenable        " enable folding
set foldlevel=20      " open all folds by default
set foldmethod=indent " fold based on indent level
nnoremap fo za        " folding shortcut

" coc.nvim settings:
set cmdheight=2    " give more space for displaying messages.
set updatetime=300 " having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.

" make line number brighter
hi LineNr ctermfg=240 guifg=#585858

" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" create directory if doesn't exist before saving
autocmd BufWritePre * if !isdirectory(expand('%:h')) | call mkdir(expand('%:h'), 'p') | endif

autocmd FileType ruby,eruby,yaml,clojure setlocal ai sw=2 sts=2                   " autoindent with two spaces, always expand tabs
autocmd FileType ruby,eruby,yaml,elixir setlocal iskeyword=@,48-57,192-255,_      " make @,numbers,latin chars,_,? part of words
autocmd FileType markdown setlocal wrap colorcolumn=240 shiftwidth=2              " automatically wrap for Markdown
autocmd FileType markdown setlocal spell spelllang=ru_ru,en_us                    " enable spellchecking for Markdown messages
autocmd FileType gitcommit setlocal colorcolumn=72                                " automatically wrap at 72 characters
autocmd FileType gitcommit setlocal spell                                         " enable spellchecking for git commit messages
autocmd FileType css,scss,sass setlocal iskeyword+=-                              " allow stylesheets to autocomplete hyphenated words
autocmd FileType clojure setlocal iskeyword=@,48-57,_,192-255,?,-,*,!,+,=,<,>,:,$ " customize keywords
autocmd FileType crontab setlocal nobackup nowritebackup                          " allow to edit crontab -e
autocmd BufWritePre *.rb,*.haml,*.coffee,*.md,*.rake,*.clj,*.js,*.jsx,*.ts,*.tsx,*.sol,*.ex :%s/\s\+$//e " remove trailing whitespaces

" Elixir syntax highlight
autocmd BufRead,BufNewFile *.ex,*.exs set filetype=elixir
autocmd BufRead,BufNewFile *.eex,*.heex,*.leex,*.sface,*.lexs set filetype=eelixir
autocmd BufRead,BufNewFile mix.lock set filetype=elixir

" Rebuild ctags async on entering the insert mode for the first time
autocmd InsertEnter *.rb if !exists('b:has_been_entered_rb')
  \| let b:has_been_entered_rb = 1
  \| execute ":!(cp tags tags_tmp 2>/dev/null || :) && (gem ctags >/dev/null && fd --type file --extension rb --print0 | xargs -0 ripper-tags --extra=q -R -a -f tags_tmp || :) && mv tags_tmp tags &"
  \| endif
autocmd InsertEnter *.js,*.jsx,*.ts,*.tsx if !exists('b:has_been_entered_js')
  \| let b:has_been_entered_js = 1
  \| execute ":!(cp tags tags_tmp 2>/dev/null || :) && (fd --type file --extension js --extension jsx --extension ts --extension tsx --print0 | xargs -0 ctags -R -a -f tags_tmp || :) && mv tags_tmp tags &"
  \| endif
autocmd InsertEnter *.ex,*.exs,*.eex if !exists('b:has_been_entered_ex')
  \| let b:has_been_entered_ex = 1
  \| execute ":!(cp tags tags_tmp 2>/dev/null || :) && (fd --type file --extension ex --extension exs --print0 | xargs -0 ctags -R -a -f tags_tmp || :) && mv tags_tmp tags &"
  \| endif

" Rebuild ctags command
autocmd BufRead *.rb nnoremap tt :!(gem ctags >/dev/null && fd --type file --extension rb --print0 \| xargs -0 ripper-tags --extra=q -R -a -f tags_tmp \|\| :) && mv tags_tmp tags &<CR>
autocmd BufRead *.js,*.jsx,*.ts,*.tsx nnoremap tt :!(fd --type file --extension js --extension jsx --extension ts --extension tsx --print0 \| xargs -0 ctags -R -a -f tags_tmp \|\| :) && mv tags_tmp tags &<CR>
autocmd BufRead *.ex,*.exs,*.eex nnoremap tt :!(fd --type file --extension ex --extension exs --print0 \| xargs -0 ctags -R -a -f tags_tmp \|\| :) && mv tags_tmp tags &<CR>

" Insert debugger
autocmd BufRead *.rb nnoremap <A-p> Orequire 'pry'; binding.pry<Esc>
  \| nnoremap <C-]> :call JumpToRubyDefinition()<CR>
autocmd BufRead *.js,*.jsx,*.ts,*.tsx nnoremap <A-p> Odebugger;<Esc>
autocmd BufRead *.ex,*.exs,*.eex nnoremap <A-p> Orequire IEx; IEx.pry<Esc>

" Format
autocmd FileType xml nnoremap <buffer> ff :%!xmllint --format --encode UTF-8 -<CR>
autocmd FileType html nnoremap <buffer> ff :%! cat % \| tidy -q -i -w 0 -ashtml 2>/dev/null<CR>
autocmd FileType json nnoremap <buffer> ff :%! cat % \| ruby -e "require 'json'; puts JSON.pretty_generate(JSON.parse(STDIN.read))"<CR>
autocmd FileType xml,json,javascriptreact,typescriptreact vmap <buffer> ff :%!tidy -q -i -w 0 -xml 2>/dev/null<CR>

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

" wrap long lines
nnoremap wl gggqG

" redraw vim
nnoremap rr :so $MYVIMRC \| checktime<CR>

" replace text in a project with sed
nnoremap <Leader>re :!fd --type file --extension jsx --print0 \| xargs -0 sed -i '' 's,search,replace,g'
nnoremap re :%s,search,replace,gc

" Clear current search highlight by double tapping //
nnoremap <Esc> :noh<CR>

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

" Copy error message to clipboard
nnoremap <Leader>e :let @+ = v:statusmsg<CR>

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
function! LargeFile()
  setlocal eventignore+=FileType " no syntax highlighting etc
  setlocal bufhidden=unload " save memory when other file is viewed
  setlocal undolevels=-1 " no undo possible
  setlocal foldmethod=manual
  setlocal noswapfile
endfunction
" files with filesize too large are recognized too (getfsize = -2)
autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif

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
