set nocompatible
filetype off

""
" Vundle Setup
""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

""
" Let Vundle manage Vundle
""
Plugin 'gmarik/Vundle.vim'

""
" Plugin list
""
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rsi'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-tbone'
Plugin 'tpope/vim-unimpaired'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/NERDTree'
Plugin 'AndrewRadev/switch.vim'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'vim-scripts/UltiSnips'
Plugin 'vim-scripts/Auto-Pairs'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'rking/ag.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'elzr/vim-json'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'edkolev/tmuxline.vim'
Plugin 'whatyouhide/vim-gotham'
Plugin 'godlygeek/tabular'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'sgur/ctrlp-extensions.vim'
Plugin 'mhinz/vim-startify'
Plugin 'jplaut/vim-arduino-ino'
Plugin 'fatih/vim-go'
Plugin 'ervandew/supertab'

""
" Done setting up Vundle
""
call vundle#end()

syntax on
filetype plugin indent on

""
" Misc Runtime
""
runtime macros/matchit.vim

""
" CtrlP.vim
""
let g:ctrlp_working_path_mode = 0
let g:ctrlp_extensions = ['funky', 'cmdline', 'yankring']
let g:ctrlp_root_markers = ['Gemfile']

""
" vim-airline
""
let g:airline_powerline_fonts = 1
let g:airline_theme = "murmur"
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_y = airline#section#create_right(['ffenc'])

""
" tmuxline.vim
""
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : [ '#(whoami)' ],
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'x'    : ['📝  #(~/.bin/todo --count)', '#(~/.bin/is_plugged_in && echo ⛽️  || echo 🔋  )  #(~/.bin/battery_status)'],
      \'y'    : ['%R', '%a %d ', '%Y'],
      \'z'    : '#H'}

""
" UltiSnips
""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-f>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"
let g:UltiSnipsEditSplit="vertical"

""
" vim-json
""
let g:vim_json_warnings=0

""
" switch.vim
""
autocmd FileType ruby let g:switch_custom_definitions =
      \ [
      \   ['extend', 'include'],
      \   {
      \     '\(\s*\%(RSpec\.\)*\)\(describe\|context\|it\) \(.\+\) do': '\1\2 \3, focus: true do',
      \     '\(\s*\%(RSpec\.\)*\)\(describe\|context\|it\) \(.\+\), focus: true do': '\1\2 \3 do'
      \   }
      \]

""
" vim-startify
""
let g:startify_custom_header = map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['']

let g:startify_list_order = [
      \ ['   MRU:'],
      \ 'dir',
      \ ['   MRU (all):'],
      \ 'files' ,
      \ ['   Sessions:'],
      \ 'sessions',
      \ ['   Bookmarks:'],
      \ 'bookmarks',
      \ ]

""
" vim-arduino-ino
""
let g:vim_arduino_map_keys = 0
command! ArduinoCompile       call ArduinoCompile()
command! ArduinoDeploy        call ArduinoDeploy()
command! ArduinoSerialMonitor call ArduinoSerialMonitor()

""
" synastic
""
" Syntastic is more annoying than useful for html files, given that 90% of the
" time there is templating in there as well or partials
let g:syntastic_ignore_files = ['\mhtml$', '\mmain.scss$', '\merb$', '\mhbs$']

""
" Colour settings
""
set t_Co=256
colorscheme gotham256
hi Comment ctermfg=yellow

""
" Goto last location in non-empty files and centre it
""
autocmd BufReadPost *  if line("'\"") > 1 && line("'\"") <= line("$")
      \|     exe "normal! g`\"zz"
      \|  endif

""
" More Natural Splits
""
set splitbelow
set splitright

""
" Codefolding
""
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END
set foldlevel=20 " Folds available but open

""
" Relative Number hybrid thing
""
set number
set relativenumber

""
" Misc Settings
""
set ruler
match Error /\s\+$/
set laststatus=2
set ttyfast
set nowrap
set noshowmode
set hidden

""
" Fix backspace not deleting new lines
""
set backspace=indent,eol,start

""
" Key press timeout
""
set timeoutlen=500

""
" Completion
""
set wildchar=<TAB>
set wildmenu
set wildmode=list:longest

""
" Visual
""
set virtualedit=block

""
" Search
""
set incsearch
set wrapscan
set ignorecase
set smartcase

""
" Replace
""
set gdefault

""
" Set up .swp files to ~/.vim/tmp
""
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.

""
" Enable mouse if available
""
if has("mouse")
  set mouse=a
endif

""
" Cursorline Settings
""
set cursorline
hi CursorLine cterm=NONE ctermbg=236 ctermfg=NONE

""
" Highlight column when over 80 characters
""
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
call matchadd('Error', '\%121v', 100)

""
" List chars
""
set listchars=tab:>#,nbsp:_
set list

""
" Trim whitespace
""
autocmd BufWritePre *.* :%s/\s\+$//e

""
" Mappings
""
let mapleader = "\<space>"
let g:mapleader = "\<space>"

nnoremap Y y$
map <Leader>== mmgg=G:w<CR>'mzz
map <Leader>bo :BufOnly<CR>

nnoremap <Leader>] :call NextTabOrBuffer()<CR>
nnoremap <Leader>[ :call PreviousTabOrBuffer()<CR>
map <F7> :tabp<CR>
map <F8> :tabn<CR>
map <Leader>pb :CtrlPBuffer<CR>
map <Leader>pm :CtrlPMRUFiles<CR>
map <Leader>pp :CtrlPMixed<CR>
map <Leader>py :CtrlPYankring<CR>
map <Leader>f :CtrlPLine<CR>

nmap j gj
nmap k gk
nmap <Tab> %

omap p i)

cmap w!! w !sudo tee % >/dev/null
command! Qa qa
command! Wqa wqa
command! Wq wq
command! W w
command! Q q

command! Irb silent !tmux split-window -p 25 irb
command! Bc silent !tmux split-window -p 25 "echo Calculator; bc -sq"

nnoremap <Leader>vi :tabe $MYVIMRC<CR>
nnoremap <Leader>so :so $MYVIMRC<CR>:noh<CR>

nnoremap <Leader>qq :bdelete<CR>
nnoremap <Leader>mt :call MergeTabs()<CR>
nnoremap <Leader>tm :tabnext<CR>:call MergeTabs()<CR>
nnoremap <Leader>oc :set cursorcolumn!<CR>

nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gd :Gdiff<CR>

nnoremap <Leader>- :Switch<CR>

nnoremap <Leader>cw ^cw
nnoremap <Leader>, A,<CR>
nnoremap <Leader>d, ddk$x
nnoremap <Leader>a, mzA,<Esc>`z:w<CR>

nnoremap <Leader><Up> mz"dyy"dp`z
nnoremap <Leader><Down> mz"dyy"dp`zj
vnoremap <Leader><Down> "dymz"dP`z

nnoremap <Leader><Backspace> mz$x`z:w<CR>

nnoremap <Leader>s<space> :%s/<C-r><C-w>//c<Left><Left>
nnoremap <Leader>s% :%s///c<Left><Left><Left>
nnoremap <Leader>g<space> :g/<C-r><C-w>/

nnoremap <Leader>ag :Ag <C-r><C-w><CR>

inoremap :w<CR> <Esc>:w<CR>
inoremap :wq<CR> <Esc>:wq<CR>

""
" Jump to end of pasted text
""
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

""
" Auto centering
""
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

""
" Filetype specific
""
augroup go
  autocmd!
  autocmd Filetype go set nolist
augroup END

""
" Merge a tab into a split in the previous window
""
function! MergeTabs()
  if tabpagenr() == 1
    return
  endif
  let bufferName = bufname("%")
  if tabpagenr("$") == tabpagenr()
    close!
  else
    close!
    tabprev
  endif
  vsplit
  execute "buffer " . bufferName
endfunction

""
" Buffer/Tab switching
""
function! NextTabOrBuffer()
  if tabpagenr('$') == 1
    bnext
  else
    tabnext
  endif
endfunction

function! PreviousTabOrBuffer()
  if tabpagenr('$') == 1
    bprevious
  else
    tabprevious
  endif
endfunction

""
" Don't Overwrite Register on vp
""
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()
