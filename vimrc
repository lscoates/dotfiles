set nocompatible

"Plugins"
call plug#begin('~/.vim/plugged')

Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'junegunn/vim-easy-align'
Plug 'w0rp/ale'
Plug 'othree/html5.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'hail2u/vim-css3-syntax'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-git'
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'janko-m/vim-test'
Plug 'isRuslan/vim-es6'
Plug 'othree/yajs.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

"THEMES"
Plug 'NLKNguyen/papercolor-theme'
" Plug 'trevordmiller/nova-vim'
Plug 'rakr/vim-one'
Plug 'cocopon/iceberg.vim'
" Plug 'junegunn/seoul256.vim'
" Plug 'arcticicestudio/nord-vim'

call plug#end()

let mapleader = ","

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

" Override comment contract in Nord theme
" let g:nord_comment_brightness = 12

" Theme
augroup vimrc
  autocmd!
  " autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=#253238 | highlight LineNr ctermbg=NONE guibg=#1e292d

  " trailing whitespace
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/
  highlight ExtraWhitespace ctermbg=NONE guibg=#ff5f5f
  autocmd ColorScheme * highlight ExtraWhitespace ctermbg=NONE guibg=#ff5f5f

  " visual line
  " DARK
  " autocmd ColorScheme * highlight Visual ctermbg=NONE guibg=#475367
  autocmd ColorScheme * highlight Visual ctermbg=NONE guibg=#d3dded
augroup END

syntax on
syntax sync minlines=10000
set redrawtime=10000
set t_Co=256
colorscheme one
set background=dark
let base16colorspace=256

" set up some custom colors
highlight clear SignColumn
highlight VertSplit    ctermbg=236
highlight ColorColumn  ctermbg=237
highlight LineNr       ctermbg=236 ctermfg=240
highlight StatusLineNC ctermbg=12  ctermfg=0
highlight StatusLine   ctermbg=235 ctermfg=12
highlight IncSearch    ctermbg=0   ctermfg=3
highlight Search       ctermbg=0   ctermfg=9
highlight Visual       ctermbg=3   ctermfg=0
highlight Pmenu        ctermbg=235 ctermfg=12
highlight PmenuSel     ctermbg=0   ctermfg=3
highlight SpellBad     ctermbg=0   ctermfg=1
highlight ErrorMsg     ctermbg=210
highlight SpellCap     ctermbg=3   ctermfg=0
highlight Statement    ctermfg=1

" highlight the status bar when in insert mode
if version >= 700
  " green in insert mode
  au InsertEnter * hi StatusLine ctermbg=235 ctermfg=2
 " blue in normal/visual mode
  au InsertLeave * hi StatusLine ctermbg=235 ctermfg=12
endif

set wildmenu
set showcmd
set ignorecase
set smartcase
set backspace=indent,eol,start
set ruler
" set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]
set confirm
set visualbell
set mouse=a
set cmdheight=2
set number
set notimeout ttimeout ttimeoutlen=200
set pastetoggle=<F11>
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set lazyredraw
set ttyfast
set splitright
set splitbelow
set noswapfile
set guioptions+=a

map Y y$
nnoremap <C-L> :nohl<CR><C-L>

" Easily edit and source .vimrc and .tmux.conf
nnoremap <leader>ev :tabedit $MYVIMRC<cr>
nnoremap <leader>et :tabedit ~/.tmux.conf<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Copy current filename to system clipboard (wonky but works for now)
nnoremap <Leader>yf :!echo % \| pbcopy<CR><CR>

" bind K to grep word under cursor
nnoremap K :Ag! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Highlight Trailing Whitespace
match ErrorMsg '\s\+$'

" Show recently opened files
noremap <leader>f :History<CR>

" Use hybrid line numbers
" set number relativenumber
" set nu rnu

" NERDTree
nmap <leader>ne :NERDTree<cr>
nmap <leader>nf :NERDTreeFind<cr>

" vim-jsx
let g:jsx_ext_required = 0

" Open FZF
noremap <leader>p :FZF<CR>

" -- FZF
let g:fzf_layout = { 'down': '~20%' }
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
let g:fzf_buffers_jump = 1
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Shift + arrow keys to resize split
" noremap <S-k> <C-W>+
" noremap <S-j> <C-W>-
" noremap <S-h> <C-W>>
" noremap <S-l> <C-W><

" Splits
nmap <leader>vs :vs<CR>
nmap <leader>hs :sp<CR>

" VTR
nnoremap <leader>ra :VtrAttachToPane<cr>
nnoremap <leader>rf :VtrFocusRunner<cr>
nnoremap <leader>rr :VtrSendLinesToRunner<cr>
nnoremap <leader>rd :VtrSendCtrlD<cr>

" Vim-Test Mappings
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <leader>l :TestLast<CR>
let g:test#strategy = "vtr"
let g:test#ruby#rspec#executable = "HEADLESS=0 ./bin/rspec"
let g:test#javascript#jest#executable = "yarn test"

" If typing 'W' in command mode, do 'w' so it doesn't complain
cabbrev Wq :wq
cabbrev W :w
cabbrev Bd bd
cabbrev Tabe tabedit
cabbrev Tabm tabmove

" Ale
" when to lint
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_filetype_changed = 1

" add sign column emoticons
let g:ale_sign_error = 'e'
let g:ale_sign_warning = 'w'

" message format
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" always show the sign column
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 1

" reset sign column background colors
highlight link ALEError SignColumn
highlight link ALEWarning SignColumn
highlight link ALEErrorSign SignColumn
highlight link ALEWarningSign SignColumn

" cTags
set tags=./tags,tags;$HOME
au BufWritePost *.c,*.cpp,*.h silent! !ctags -R &
